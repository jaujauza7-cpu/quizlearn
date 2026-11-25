import 'package:flutter/material.dart';

import '../theme.dart';

class TombolUtama extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  final IconData? ikonDepan;
  final IconData? ikonBelakang;
  final bool garis; // true = tombol outline (putih), false = tombol navy
  final bool memuat;

  const TombolUtama({
    super.key,
    required this.label,
    required this.onTap,
    this.ikonDepan,
    this.ikonBelakang,
    this.garis = false,
    this.memuat = false,
  });

  @override
  Widget build(BuildContext context) {
    final bentuk = RoundedRectangleBorder(borderRadius: BorderRadius.circular(14));

    final Widget isi = memuat
        ? const SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (ikonDepan != null) ...[
                Icon(ikonDepan, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              if (ikonBelakang != null) ...[
                const SizedBox(width: 8),
                Icon(ikonBelakang, size: 20),
              ],
            ],
          );

    if (garis) {
      return SizedBox(
        width: double.infinity,
        height: 52,
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: Warna.navy,
            backgroundColor: Colors.white,
            side: const BorderSide(color: Warna.navy, width: 1.5),
            shape: bentuk,
          ),
          child: isi,
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Warna.navy,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Warna.garis,
          disabledForegroundColor: Colors.white,
          elevation: 0,
          shape: bentuk,
        ),
        child: isi,
      ),
    );
  }
}
