import 'package:flutter/material.dart';

/// Nama aplikasi (ubah di sini jika ingin mengganti nama, misal menjadi QuizCBI).
const String namaAplikasi = 'QuizLearn';

class Warna {
  static const Color navy = Color(0xFF1B3A6B);
  static const Color biru = Color(0xFF3C6FC0);
  static const Color biruMuda = Color(0xFFDCE9FB);
  static const Color garis = Color(0xFFBCD2F0);
  static const Color latar = Color(0xFFF5F9FF);
  static const Color teks = Color(0xFF16284A);
  static const Color emas = Color(0xFFF2B531);
  static const Color benar = Color(0xFF2E9E5B);
  static const Color salah = Color(0xFFD64545);
}

ThemeData buatTema() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Warna.navy,
      primary: Warna.navy,
    ),
    scaffoldBackgroundColor: Warna.latar,
  );
}
