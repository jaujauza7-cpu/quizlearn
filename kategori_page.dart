import 'package:flutter/material.dart';

import '../components/header_bar.dart';
import '../components/kartu_kategori.dart';
import '../data/bank_soal.dart';
import '../theme.dart';
import 'quiz_page.dart';

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderBar(judul: 'Kuis Sekolah', kembali: true),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(18),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/images/school_scene.png',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 18),
                const Center(
                  child: Text(
                    'Kuis Seputar Sekolah',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Warna.navy,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Center(
                  child: Text(
                    'Pilih kategori kuis yang ingin kamu kerjakan:',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, color: Warna.teks),
                  ),
                ),
                const SizedBox(height: 18),
                for (final k in daftarKategori)
                  KartuKategori(
                    ikon: k.ikon,
                    nama: k.nama,
                    keterangan: '${k.soal.length} soal',
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => QuizPage(kategori: k)),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
