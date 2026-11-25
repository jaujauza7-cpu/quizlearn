import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../services/auth_service.dart';
import '../theme.dart';
import 'home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _mulai();
  }

  Future<void> _mulai() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    final user = await AuthService.userAktif();
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => user == null ? const LoginPage() : const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(child: CustomPaint(painter: _GelombangPainter())),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/logo_sekolah.png', width: 240),
                    const SizedBox(height: 16),
                    const Text(
                      namaAplikasi,
                      style: TextStyle(
                        fontSize: 44,
                        fontWeight: FontWeight.w800,
                        color: Warna.navy,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Kenali Sekolahmu,\nRaih Skormu!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: Warna.teks,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 48,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Menggambar gelombang biru di bagian atas dan bawah layar.
class _GelombangPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final atasMuda = Path()
      ..moveTo(0, 0)
      ..lineTo(w, 0)
      ..lineTo(w, h * 0.06)
      ..cubicTo(w * 0.75, h * 0.22, w * 0.4, h * 0.04, 0, h * 0.2)
      ..close();
    canvas.drawPath(atasMuda, Paint()..color = Warna.biru);

    final atas = Path()
      ..moveTo(0, 0)
      ..lineTo(w * 0.8, 0)
      ..cubicTo(w * 0.6, h * 0.1, w * 0.3, h * 0.03, 0, h * 0.14)
      ..close();
    canvas.drawPath(atas, Paint()..color = Warna.navy);

    final bawahMuda = Path()
      ..moveTo(0, h)
      ..lineTo(w, h)
      ..lineTo(w, h * 0.74)
      ..cubicTo(w * 0.65, h * 0.68, w * 0.4, h * 0.86, 0, h * 0.76)
      ..close();
    canvas.drawPath(bawahMuda, Paint()..color = Warna.biru);

    final bawah = Path()
      ..moveTo(0, h)
      ..lineTo(w, h)
      ..lineTo(w, h * 0.82)
      ..cubicTo(w * 0.7, h * 0.74, w * 0.35, h * 0.92, 0, h * 0.84)
      ..close();
    canvas.drawPath(bawah, Paint()..color = Warna.navy);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
