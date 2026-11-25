import 'package:flutter/material.dart';

import '../components/header_bar.dart';
import '../components/kartu_nilai.dart';
import '../models/hasil_model.dart';
import '../models/user_model.dart';
import '../services/quiz_service.dart';
import '../theme.dart';

/// Tab Riwayat: papan peringkat dan riwayat nilai pengguna.
class RiwayatTab extends StatefulWidget {
  final UserModel user;

  const RiwayatTab({super.key, required this.user});

  @override
  State<RiwayatTab> createState() => _RiwayatTabState();
}

class _RiwayatTabState extends State<RiwayatTab> {
  List<HasilModel> _hasil = [];
  List<PeringkatItem> _peringkat = [];

  @override
  void initState() {
    super.initState();
    _muat();
  }

  Future<void> _muat() async {
    final h = await QuizService.hasilUser(widget.user.id);
    final p = await QuizService.peringkat();
    if (!mounted) return;
    setState(() {
      _hasil = h;
      _peringkat = p;
    });
  }

  Color _warnaPeringkat(int i) {
    if (i == 0) return Warna.emas;
    if (i == 1) return const Color(0xFF9AA5B1);
    if (i == 2) return const Color(0xFFC98B4B);
    return Warna.biru;
  }

  @override
  Widget build(BuildContext context) {
    final top = _peringkat.length > 10 ? _peringkat.sublist(0, 10) : _peringkat;
    return Column(
      children: [
        const HeaderBar(judul: 'Riwayat & Peringkat'),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(18),
            children: [
              const Text(
                'Papan Peringkat',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: Warna.navy,
                ),
              ),
              const SizedBox(height: 10),
              if (top.isEmpty)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Belum ada skor. Jadilah yang pertama!',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              for (int i = 0; i < top.length; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: Warna.garis),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: _warnaPeringkat(i),
                        child: Text(
                          '${i + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          top[i].nama,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Warna.teks,
                          ),
                        ),
                      ),
                      Text(
                        '${top[i].skor}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: Warna.teks,
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 18),
              const Text(
                'Riwayat Nilai Saya',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: Warna.navy,
                ),
              ),
              const SizedBox(height: 10),
              if (_hasil.isEmpty)
                const Text(
                  'Belum ada riwayat nilai.',
                  style: TextStyle(color: Colors.black54),
                ),
              for (final h in _hasil) KartuNilai(hasil: h),
            ],
          ),
        ),
      ],
    );
  }
}
