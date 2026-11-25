import 'package:flutter/material.dart';

/// Tampilan penghitung waktu, format 00:00:45 (jam:menit:detik).
class TimerKuis extends StatelessWidget {
  final int detik;

  const TimerKuis({super.key, required this.detik});

  String _dua(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final teks = '${_dua(detik ~/ 3600)}:${_dua((detik % 3600) ~/ 60)}:${_dua(detik % 60)}';
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          const Icon(Icons.timer_outlined, color: Colors.white, size: 24),
          const SizedBox(width: 6),
          Text(
            teks,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
