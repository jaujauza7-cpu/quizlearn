import 'package:flutter/material.dart';

import '../components/header_bar.dart';
import '../models/user_model.dart';
import '../theme.dart';
import 'kategori_page.dart';
import 'tentang_sekolah_page.dart';

class BerandaTab extends StatelessWidget {
  final UserModel user;
  final VoidCallback onProfil;

  const BerandaTab({super.key, required this.user, required this.onProfil});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Warna.navy,
      child: Column(
        children: [
          HeaderBar(
            judul: namaAplikasi,
            aksi: [
              IconButton(
                onPressed: onProfil,
                icon: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Warna.navy),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Warna.latar,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: ListView(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 24),
                children: [
                  // Kartu sapaan
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Warna.biruMuda,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Halo, ${user.nama}!',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Warna.navy,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Siap menjawab kuis\nseputar sekolah?',
                                style: TextStyle(fontSize: 15, color: Warna.teks),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.campaign, size: 72, color: Warna.biru),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    'Menu Utama',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Warna.navy,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Kartu menu kuis
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const KategoriPage()),
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/school_scene.png',
                            height: 170,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          right: 12,
                          bottom: 12,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Kuis',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Warna.teks,
                                      ),
                                    ),
                                    Text(
                                      'Seputar Sekolah',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Warna.teks,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 14),
                                const CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Warna.navy,
                                  child: Icon(Icons.arrow_forward_ios,
                                      size: 14, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Kartu tentang sekolah
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const TentangSekolahPage()),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Warna.biruMuda,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.lightbulb, size: 40, color: Warna.emas),
                          SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tentang Sekolah',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Warna.teks,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Yuk, kenali lebih dekat\nSMK Informatika CBI!',
                                  style: TextStyle(fontSize: 13, color: Warna.teks),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right, color: Warna.navy, size: 28),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
