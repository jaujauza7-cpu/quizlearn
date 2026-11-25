import 'package:flutter/material.dart';

import '../components/header_bar.dart';
import '../models/kategori_model.dart';
import '../theme.dart';

/// Detail hasil: jawaban benar/salah dan pembahasan tiap soal.
class PembahasanPage extends StatelessWidget {
  final KategoriModel kategori;
  final List<int?> jawaban;

  const PembahasanPage({super.key, required this.kategori, required this.jawaban});

  @override
  Widget build(BuildContext context) {
    final daftar = kategori.soal;
    return Scaffold(
      body: Column(
        children: [
          const HeaderBar(judul: 'Pembahasan', kembali: true),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: daftar.length,
              itemBuilder: (context, i) {
                final s = daftar[i];
                final j = jawaban[i];
                final benar = j == s.jawabanBenar;
                final warna = benar ? Warna.benar : Warna.salah;
                return Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: warna, width: 1.4),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(benar ? Icons.check_circle : Icons.cancel, color: warna),
                          const SizedBox(width: 8),
                          Text(
                            'Soal ${i + 1}',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: warna,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        s.pertanyaan,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Warna.teks,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Jawabanmu: ${j == null ? "Tidak dijawab" : s.opsi[j]}',
                        style: TextStyle(color: warna, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Jawaban benar: ${s.opsi[s.jawabanBenar]}',
                        style: const TextStyle(
                          color: Warna.benar,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Warna.biruMuda,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Pembahasan: ${s.pembahasan}',
                          style: const TextStyle(fontSize: 14, color: Warna.teks),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
