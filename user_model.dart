class UserModel {
  final String nama;
  final String id; // email atau username
  final String password;

  UserModel({required this.nama, required this.id, required this.password});

  Map<String, dynamic> toJson() => {'nama': nama, 'id': id, 'password': password};

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        nama: json['nama'] as String,
        id: json['id'] as String,
        password: json['password'] as String,
      );
}
