import 'package:flutter/material.dart';

import '../components/header_bar.dart';
import '../components/tombol_utama.dart';
import '../theme.dart';
import 'kategori_page.dart';

/// Halaman informasi singkat sekolah. Isi teks dapat disesuaikan.
class TentangSekolahPage extends StatelessWidget {
  const TentangSekolahPage({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: const TextStyle(color: Colors.black54)),
          ),
          Expanded(
            child: Text(
              isi,
              style: const TextStyle(fontWeight: FontWeight.w700, color: Warna.teks),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const HeaderBar(judul: 'Tentang Sekolah', kembali: true),
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
                const SizedBox(height: 16),
                const Text(
                  'SMK Informatika CBI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Warna.navy,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Kenali sekolahmu lewat kuis yang seru dan lihat skormu langsung!',
                  style: TextStyle(fontSize: 15, color: Warna.teks),
                ),
                const SizedBox(height: 16),
                _baris('Nama sekolah', 'SMK Informatika CBI'),
                _baris('Jenjang', 'Sekolah Menengah Kejuruan (SMK)'),
                _baris('Kategori kuis', 'Lokasi & Fasilitas, Mata Pelajaran, Kegiatan & Program'),
                const SizedBox(height: 10),
                TombolUtama(
                  label: 'Mulai Kuis',
                  ikonBelakang: Icons.arrow_forward,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const KategoriPage()),
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
