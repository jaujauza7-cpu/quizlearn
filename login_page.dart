import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/tombol_utama.dart';
import '../services/auth_service.dart';
import '../theme.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _id = TextEditingController();
  final _pass = TextEditingController();
  final _nama = TextEditingController();
  bool _daftar = false; // false = mode Login, true = mode Register
  bool _sembunyi = true;
  bool _memuat = false;

  @override
  void dispose() {
    _id.dispose();
    _pass.dispose();
    _nama.dispose();
    super.dispose();
  }

  void _pesan(String teks) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(teks)));
  }

  Future<void> _kirim() async {
    final id = _id.text.trim();
    final pass = _pass.text;
    if (id.isEmpty || pass.isEmpty) {
      _pesan('Email/Username dan password wajib diisi');
      return;
    }
    if (_daftar && _nama.text.trim().isEmpty) {
      _pesan('Nama lengkap wajib diisi');
      return;
    }
    if (_daftar && pass.length < 6) {
      _pesan('Password minimal 6 karakter');
      return;
    }

    setState(() => _memuat = true);
    final galat = _daftar
        ? await AuthService.daftar(nama: _nama.text.trim(), id: id, password: pass)
        : await AuthService.masuk(id, pass);
    if (!mounted) return;
    setState(() => _memuat = false);

    if (galat != null) {
      _pesan(galat);
      return;
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const HomePage()),
    );
  }

  Widget _kolom({
    required TextEditingController controller,
    required String hint,
    required IconData ikon,
    bool sandi = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        obscureText: sandi && _sembunyi,
        keyboardType: sandi ? TextInputType.text : TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(ikon, color: Warna.navy),
          suffixIcon: sandi
              ? IconButton(
                  onPressed: () => setState(() => _sembunyi = !_sembunyi),
                  icon: Icon(
                    _sembunyi ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: Warna.navy,
                  ),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Warna.garis),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Warna.navy, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _tab(String teks, bool aktif, VoidCallback onTap) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: aktif ? Warna.navy : Colors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: Warna.navy, width: 1.5),
          ),
          child: Text(
            teks,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: aktif ? Colors.white : Warna.navy,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Warna.latar,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Image.asset('assets/images/logo_sekolah.png', width: 130),
                  const SizedBox(height: 6),
                  const Text(
                    namaAplikasi,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      color: Warna.navy,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Ayo uji pengetahuanmu\ntentang sekolah!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17, color: Warna.teks),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    children: [
                      _tab('Login', !_daftar, () => setState(() => _daftar = false)),
                      const SizedBox(width: 14),
                      _tab('Register', _daftar, () => setState(() => _daftar = true)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (_daftar)
                    _kolom(
                      controller: _nama,
                      hint: 'Nama lengkap',
                      ikon: Icons.badge_outlined,
                    ),
                  _kolom(
                    controller: _id,
                    hint: 'Email atau Username',
                    ikon: Icons.person,
                  ),
                  _kolom(
                    controller: _pass,
                    hint: 'Password',
                    ikon: Icons.lock,
                    sandi: true,
                  ),
                  const SizedBox(height: 4),
                  TombolUtama(
                    label: _daftar ? 'Daftar' : 'Masuk',
                    onTap: _memuat ? null : _kirim,
                    memuat: _memuat,
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('atau', style: TextStyle(color: Colors.black54)),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () => _pesan(
                        'Login dengan Google belum diaktifkan pada versi ini',
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Warna.teks,
                        side: const BorderSide(color: Warna.garis, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'G',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF4285F4),
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Login dengan Google',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  GestureDetector(
                    onTap: () => setState(() => _daftar = !_daftar),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _daftar ? 'Sudah punya akun? ' : 'Belum punya akun? ',
                          style: const TextStyle(color: Warna.teks),
                        ),
                        Text(
                          _daftar ? 'Login di sini' : 'Register di sini',
                          style: const TextStyle(
                            color: Warna.navy,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
