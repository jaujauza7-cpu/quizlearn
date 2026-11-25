import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/hasil_model.dart';

class PeringkatItem {
  final String nama;
  final int skor;
  PeringkatItem(this.nama, this.skor);
}

/// Layanan penyimpanan hasil quiz, riwayat nilai, dan papan peringkat.
class QuizService {
  static const String _kHasil = 'hasil_kuis';

  static Future<List<HasilModel>> semuaHasil() async {
    final p = await SharedPreferences.getInstance();
    final s = p.getString(_kHasil);
    if (s == null) return [];
    final list = jsonDecode(s) as List;
    return list
        .map((e) => HasilModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  static Future<void> _simpanSemua(List<HasilModel> data) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(_kHasil, jsonEncode(data.map((e) => e.toJson()).toList()));
  }

  static Future<void> simpanHasil(HasilModel hasil) async {
    final semua = await semuaHasil();
    semua.add(hasil);
    await _simpanSemua(semua);
  }

  /// Riwayat nilai milik satu pengguna, terbaru di atas.
  static Future<List<HasilModel>> hasilUser(String userId) async {
    final semua = await semuaHasil();
    final milik =
        semua.where((h) => h.userId == userId.toLowerCase()).toList();
    milik.sort((a, b) => b.tanggal.compareTo(a.tanggal));
    return milik;
  }

  /// Papan peringkat: skor tertinggi tiap pengguna (di HP ini).
  static Future<List<PeringkatItem>> peringkat() async {
    final semua = await semuaHasil();
    final terbaik = <String, PeringkatItem>{};
    for (final h in semua) {
      final lama = terbaik[h.userId];
      if (lama == null || h.skor > lama.skor) {
        terbaik[h.userId] = PeringkatItem(h.nama, h.skor);
      }
    }
    final hasil = terbaik.values.toList();
    hasil.sort((a, b) => b.skor.compareTo(a.skor));
    return hasil;
  }

  static Future<void> hapusRiwayat(String userId) async {
    final semua = await semuaHasil();
    semua.removeWhere((h) => h.userId == userId.toLowerCase());
    await _simpanSemua(semua);
  }
}
