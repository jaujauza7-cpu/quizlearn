import 'package:flutter/material.dart';

import '../theme.dart';

/// Header berwarna navy seperti pada mockup.
class HeaderBar extends StatelessWidget {
  final String judul;
  final bool kembali;
  final VoidCallback? onKembali;
  final List<Widget> aksi;

  const HeaderBar({
    super.key,
    required this.judul,
    this.kembali = false,
    this.onKembali,
    this.aksi = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Warna.navy,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 8,
        left: 8,
        right: 8,
        bottom: 14,
      ),
      child: Row(
        children: [
          if (kembali)
            IconButton(
              onPressed: onKembali ?? () => Navigator.of(context).maybePop(),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
            )
          else
            const SizedBox(width: 12),
          Expanded(
            child: Text(
              judul,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ...aksi,
        ],
      ),
    );
  }
}
