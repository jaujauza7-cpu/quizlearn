import 'dart:async';

import 'package:flutter/material.dart';

import '../components/header_bar.dart';
import '../components/opsi_jawaban.dart';
import '../components/timer_kuis.dart';
import '../components/tombol_utama.dart';
import '../models/hasil_model.dart';
import '../models/kategori_model.dart';
import '../models/soal_model.dart';
import '../services/auth_service.dart';
import '../services/quiz_service.dart';
import '../theme.dart';
import 'hasil_page.dart';

class QuizPage extends StatefulWidget {
  final KategoriModel kategori;

  const QuizPage({super.key, required this.kategori});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  static const int _detikPerSoal = 45;

  int _no = 0; // nomor soal yang sedang tampil (mulai 0)
  int? _pilih; // opsi yang dipilih pada soal ini
  late List<int?> _jawaban; // jawaban semua soal
  int _sisa = _detikPerSoal;
  Timer? _timer;
  bool _selesaiDiproses = false;

  List<SoalModel> get _soal => widget.kategori.soal;

  @override
  void initState() {
    super.initState();
    _jawaban = List<int?>.filled(_soal.length, null);
    _mulaiTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _mulaiTimer() {
    _timer?.cancel();
    _sisa = _detikPerSoal;
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (_sisa <= 1) {
        _lanjut(); // waktu habis, pindah soal otomatis
      } else {
        setState(() => _sisa--);
      }
    });
  }

  void _lanjut() {
    if (_selesaiDiproses) return;
    _jawaban[_no] = _pilih;
    if (_no == _soal.length - 1) {
      _selesai();
    } else {
      setState(() {
        _no++;
        _pilih = null;
      });
      _mulaiTimer();
    }
  }

  Future<void> _selesai() async {
    _selesaiDiproses = true;
    _timer?.cancel();

    int benar = 0;
    for (int i = 0; i < _soal.length; i++) {
      if (_jawaban[i] == _soal[i].jawabanBenar) benar++;
    }
    final skor = (benar * 100 / _soal.length).round();

    final user = await AuthService.userAktif();
    if (user != null) {
      await QuizService.simpanHasil(
        HasilModel(
          userId: user.id.toLowerCase(),
          nama: user.nama,
          kategori: widget.kategori.nama,
          skor: skor,
          benar: benar,
          total: _soal.length,
          tanggal: DateTime.now(),
        ),
      );
    }

    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HasilPage(
          kategori: widget.kategori,
          jawaban: _jawaban,
          benar: benar,
          skor: skor,
        ),
      ),
    );
  }

  Future<void> _konfirmasiKeluar() async {
    final keluar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Keluar dari kuis?'),
        content: const Text('Progres kuis kamu tidak akan disimpan.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
    if (keluar == true && mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final soal = _soal[_no];
    final terakhir = _no == _soal.length - 1;

    return Scaffold(
      body: Column(
        children: [
          HeaderBar(
            judul: 'Kuis Sekolah',
            kembali: true,
            onKembali: _konfirmasiKeluar,
            aksi: [TimerKuis(detik: _sisa)],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${_no + 1} / ${_soal.length}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Warna.navy,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LinearProgressIndicator(
                            value: (_no + 1) / _soal.length,
                            minHeight: 10,
                            backgroundColor: Warna.biruMuda,
                            color: Warna.navy,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 22),
                  Text(
                    soal.pertanyaan,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                      color: Warna.teks,
                    ),
                  ),
                  const SizedBox(height: 18),
                  for (int i = 0; i < soal.opsi.length; i++)
                    OpsiJawaban(
                      teks: soal.opsi[i],
                      terpilih: _pilih == i,
                      onTap: () => setState(() => _pilih = i),
                    ),
                ],
              ),
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: TombolUtama(
                label: terakhir ? 'Selesai' : 'Selanjutnya',
                ikonBelakang: terakhir ? Icons.check : Icons.arrow_forward,
                onTap: _pilih == null ? null : _lanjut,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
