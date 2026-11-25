import 'package:flutter/material.dart';

import '../models/hasil_model.dart';
import '../theme.dart';

/// Satu baris riwayat nilai (piala, nama kuis, tanggal, skor).
class KartuNilai extends StatelessWidget {
  final HasilModel hasil;

  const KartuNilai({super.key, required this.hasil});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Warna.garis),
      ),
      child: Row(
        children: [
          const Icon(Icons.emoji_events, color: Warna.emas, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kuis ${hasil.kategori}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Warna.teks,
                  ),
                ),
                Text(
                  hasil.tanggalText,
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          Text(
            '${hasil.skor}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Warna.teks,
            ),
          ),
        ],
      ),
    );
  }
}
