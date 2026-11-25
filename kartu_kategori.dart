import 'package:flutter/material.dart';

import '../theme.dart';

class KartuKategori extends StatelessWidget {
  final IconData ikon;
  final String nama;
  final String keterangan;
  final VoidCallback onTap;

  const KartuKategori({
    super.key,
    required this.ikon,
    required this.nama,
    required this.keterangan,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Warna.garis, width: 1.2),
            ),
            child: Row(
              children: [
                Icon(ikon, color: Warna.navy, size: 30),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nama,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Warna.teks,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        keterangan,
                        style: const TextStyle(fontSize: 13, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Warna.navy, size: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
