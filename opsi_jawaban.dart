import 'package:flutter/material.dart';

import '../theme.dart';

/// Satu pilihan jawaban (radio) pada halaman quiz.
class OpsiJawaban extends StatelessWidget {
  final String teks;
  final bool terpilih;
  final VoidCallback onTap;

  const OpsiJawaban({
    super.key,
    required this.teks,
    required this.terpilih,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: terpilih ? Warna.biruMuda : Colors.white,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: terpilih ? Warna.navy : Warna.garis,
                width: terpilih ? 2 : 1.2,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  terpilih ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                  color: Warna.navy,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    teks,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Warna.teks,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
