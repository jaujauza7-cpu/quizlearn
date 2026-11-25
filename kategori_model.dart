import 'package:flutter/material.dart';
import 'soal_model.dart';

class KategoriModel {
  final String id;
  final String nama;
  final IconData ikon;
  final List<SoalModel> soal;

  const KategoriModel({
    required this.id,
    required this.nama,
    required this.ikon,
    required this.soal,
  });
}
