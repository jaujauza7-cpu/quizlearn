import 'package:flutter/material.dart';

import '../components/tombol_utama.dart';
import '../models/kategori_model.dart';
import '../theme.dart';
import 'pembahasan_page.dart';

class HasilPage extends StatelessWidget {
  final KategoriModel kategori;
  final List<int?> jawaban;
  final int benar;
  final int skor;

  const HasilPage({
    super.key,
    required this.kategori,
    required this.jawaban,
    required this.benar,
    required this.skor,
  });

  String get _pesan {
    if (skor >= 90) return 'Hebat! Kamu sangat\npaham tentang sekolah!';
    if (skor >= 70) return 'Bagus! Terus tingkatkan\npengetahuanmu!';
    if (skor >= 50) return 'Lumayan! Yuk belajar\nlagi supaya lebih baik!';
    return 'Jangan menyerah!\nCoba lagi ya!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Warna.latar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/trophy.png', width: 300),
                    const SizedBox(height: 8),
                    const Text(
                      'Skor Kamu:',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Warna.navy,
                      ),
                    ),
                    Text(
                      '$skor / 100',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w800,
                        color: Warna.navy,
                      ),
                    ),
                    Text(
                      '$benar dari ${kategori.soal.length} soal benar',
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 14),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Warna.biruMuda,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Text(
                        _pesan,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 17, color: Warna.teks),
                      ),
                    ),
                  ],
                ),
              ),
              TombolUtama(
                label: 'Lihat Pembahasan',
                ikonDepan: Icons.menu_book,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PembahasanPage(kategori: kategori, jawaban: jawaban),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TombolUtama(
                label: 'Kembali ke Beranda',
                ikonDepan: Icons.home,
                garis: true,
                onTap: () => Navigator.of(context).popUntil((r) => r.isFirst),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
