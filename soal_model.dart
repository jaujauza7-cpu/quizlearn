class SoalModel {
  final String pertanyaan;
  final List<String> opsi;
  final int jawabanBenar; // indeks pada list opsi (0-3)
  final String pembahasan;

  const SoalModel({
    required this.pertanyaan,
    required this.opsi,
    required this.jawabanBenar,
    required this.pembahasan,
  });
}
