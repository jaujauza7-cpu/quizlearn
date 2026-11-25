import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../services/auth_service.dart';
import '../theme.dart';
import 'beranda_tab.dart';
import 'profil_page.dart';
import 'riwayat_tab.dart';

/// Kerangka halaman utama dengan bottom navigation: Beranda, Riwayat, Profil.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tab = 0;
  UserModel? _user;

  @override
  void initState() {
    super.initState();
    _muatUser();
  }

  Future<void> _muatUser() async {
    final u = await AuthService.userAktif();
    if (!mounted) return;
    setState(() => _user = u);
  }

  @override
  Widget build(BuildContext context) {
    final user = _user;
    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    Widget isi;
    if (_tab == 0) {
      isi = BerandaTab(user: user, onProfil: () => setState(() => _tab = 2));
    } else if (_tab == 1) {
      isi = RiwayatTab(user: user);
    } else {
      isi = ProfilPage(user: user, onUbah: _muatUser);
    }

    return Scaffold(
      body: isi,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tab,
        onTap: (i) => setState(() => _tab = i),
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Warna.navy,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
