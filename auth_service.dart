import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

/// Layanan akun (login, register, logout).
/// Data disimpan di penyimpanan lokal HP (shared_preferences),
/// sehingga aplikasi bisa langsung dipakai tanpa konfigurasi server.
class AuthService {
  static const String _kUsers = 'users';
  static const String _kAktif = 'user_aktif';

  static Future<Map<String, dynamic>> _ambilSemua() async {
    final p = await SharedPreferences.getInstance();
    final s = p.getString(_kUsers);
    if (s == null) return {};
    return Map<String, dynamic>.from(jsonDecode(s) as Map);
  }

  static Future<void> _simpanSemua(Map<String, dynamic> data) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(_kUsers, jsonEncode(data));
  }

  /// Mengembalikan pesan error, atau null jika berhasil.
  static Future<String?> daftar({
    required String nama,
    required String id,
    required String password,
  }) async {
    final semua = await _ambilSemua();
    final kunci = id.toLowerCase();
    if (semua.containsKey(kunci)) {
      return 'Akun sudah terdaftar, silakan login';
    }
    semua[kunci] = UserModel(nama: nama, id: id, password: password).toJson();
    await _simpanSemua(semua);
    final p = await SharedPreferences.getInstance();
    await p.setString(_kAktif, kunci);
    return null;
  }

  /// Mengembalikan pesan error, atau null jika berhasil.
  static Future<String?> masuk(String id, String password) async {
    final semua = await _ambilSemua();
    final kunci = id.toLowerCase();
    final data = semua[kunci];
    if (data == null) return 'Akun tidak ditemukan, silakan Register dulu';
    final user = UserModel.fromJson(Map<String, dynamic>.from(data as Map));
    if (user.password != password) return 'Password salah';
    final p = await SharedPreferences.getInstance();
    await p.setString(_kAktif, kunci);
    return null;
  }

  static Future<UserModel?> userAktif() async {
    final p = await SharedPreferences.getInstance();
    final kunci = p.getString(_kAktif);
    if (kunci == null) return null;
    final semua = await _ambilSemua();
    final data = semua[kunci];
    if (data == null) return null;
    return UserModel.fromJson(Map<String, dynamic>.from(data as Map));
  }

  static Future<void> keluar() async {
    final p = await SharedPreferences.getInstance();
    await p.remove(_kAktif);
  }

  static Future<void> ubahNama(String namaBaru) async {
    final user = await userAktif();
    if (user == null) return;
    final semua = await _ambilSemua();
    semua[user.id.toLowerCase()] =
        UserModel(nama: namaBaru, id: user.id, password: user.password)
            .toJson();
    await _simpanSemua(semua);
  }
}
