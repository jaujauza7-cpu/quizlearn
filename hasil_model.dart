class HasilModel {
  final String userId;
  final String nama;
  final String kategori;
  final int skor; // 0 - 100
  final int benar;
  final int total;
  final DateTime tanggal;

  HasilModel({
    required this.userId,
    required this.nama,
    required this.kategori,
    required this.skor,
    required this.benar,
    required this.total,
    required this.tanggal,
  });

  String get tanggalText {
    const bulan = [
      'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
      'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'
    ];
    return '${tanggal.day} ${bulan[tanggal.month - 1]} ${tanggal.year}';
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'nama': nama,
        'kategori': kategori,
        'skor': skor,
        'benar': benar,
        'total': total,
        'tanggal': tanggal.toIso8601String(),
      };

  factory HasilModel.fromJson(Map<String, dynamic> json) => HasilModel(
        userId: json['userId'] as String,
        nama: json['nama'] as String,
        kategori: json['kategori'] as String,
        skor: json['skor'] as int,
        benar: json['benar'] as int,
        total: json['total'] as int,
        tanggal: DateTime.parse(json['tanggal'] as String),
      );
}
