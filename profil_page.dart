import 'package:flutter/material.dart';

import '../components/header_bar.dart';
import '../components/kartu_nilai.dart';
import '../components/tombol_utama.dart';
import '../models/hasil_model.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../services/quiz_service.dart';
import '../theme.dart';
import 'login_page.dart';

class ProfilPage extends StatefulWidget {
  final UserModel user;
  final Future<void> Function() onUbah; // dipanggil setelah data profil berubah

  const ProfilPage({super.key, required this.user, required this.onUbah});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  int _tab = 0; // 0 = Riwayat Nilai, 1 = Info Akun
  List<HasilModel> _hasil = [];

  @override
  void initState() {
    super.initState();
    _muatRiwayat();
  }

  Future<void> _muatRiwayat() async {
    final data = await QuizService.hasilUser(widget.user.id);
    if (!mounted) return;
    setState(() => _hasil = data);
  }

  Future<void> _keluar() async {
    await AuthService.keluar();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  Future<void> _ubahNama() async {
    final c = TextEditingController(text: widget.user.nama);
    final baru = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Ubah Nama'),
        content: TextField(
          controller: c,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'Nama lengkap'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(c.text.trim()),
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
    if (baru != null && baru.isNotEmpty) {
      await AuthService.ubahNama(baru);
      await widget.onUbah();
    }
  }

  Future<void> _hapusRiwayat() async {
    await QuizService.hapusRiwayat(widget.user.id);
    await _muatRiwayat();
  }

  void _bukaPengaturan() {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Ubah Nama'),
              onTap: () {
                Navigator.of(ctx).pop();
                _ubahNama();
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Hapus Riwayat Nilai'),
              onTap: () {
                Navigator.of(ctx).pop();
                _hapusRiwayat();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _tombolTab(String teks, int indeks) {
    final aktif = _tab == indeks;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _tab = indeks),
        child: Container(
          height: 44,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: aktif ? Warna.navy : Warna.biruMuda,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            teks,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: aktif ? Colors.white : Warna.teks,
            ),
          ),
        ),
      ),
    );
  }

  Widget _baris(String label, String isi) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Warna.garis),
      ),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(color: Colors.black54))),
          Text(isi, style: const TextStyle(fontWeight: FontWeight.w700, color: Warna.teks)),
        ],
      ),
    );
  }

  List<Widget> _isiTab() {
    if (_tab == 0) {
      if (_hasil.isEmpty) {
        return const [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 28),
            child: Center(
              child: Text(
                'Belum ada riwayat nilai.\nYuk kerjakan kuis pertamamu!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ),
        ];
      }
      return _hasil.map((h) => KartuNilai(hasil: h)).toList();
    }
    final terbaik = _hasil.isEmpty
        ? 0
        : _hasil.map((h) => h.skor).reduce((a, b) => a > b ? a : b);
    return [
      _baris('Nama', widget.user.nama),
      _baris('Email / Username', widget.user.id),
      _baris('Kuis dikerjakan', '${_hasil.length}'),
      _baris('Skor terbaik', '$terbaik'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderBar(
          judul: 'Profil',
          aksi: [
            IconButton(
              onPressed: _bukaPengaturan,
              icon: const Icon(Icons.settings, color: Colors.white),
            ),
          ],
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: Warna.biruMuda,
                  child: Icon(Icons.person, size: 54, color: Warna.navy),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  widget.user.nama,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w800,
                    color: Warna.teks,
                  ),
                ),
              ),
              Center(
                child: Text(
                  widget.user.id,
                  style: const TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  _tombolTab('Riwayat Nilai', 0),
                  const SizedBox(width: 10),
                  _tombolTab('Info Akun', 1),
                ],
              ),
              const SizedBox(height: 14),
              ..._isiTab(),
              const SizedBox(height: 14),
              TombolUtama(
                label: 'Logout',
                ikonDepan: Icons.logout,
                onTap: _keluar,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
