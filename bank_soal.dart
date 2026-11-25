import 'package:flutter/material.dart';

import '../models/kategori_model.dart';
import '../models/soal_model.dart';

/// Bank soal quiz. Guru/siswa dapat menambah atau mengubah soal di file ini.
/// Format: pertanyaan, 4 opsi, indeks jawaban benar (mulai dari 0), pembahasan.
final List<KategoriModel> daftarKategori = [
  KategoriModel(
    id: 'lokasi',
    nama: 'Lokasi & Fasilitas',
    ikon: Icons.location_on,
    soal: const [
      SoalModel(
        pertanyaan: 'Ada berapa ruang kelas di SMK Informatika CBI?',
        opsi: ['20', '15', '24', '10'],
        jawabanBenar: 2,
        pembahasan: 'SMK Informatika CBI memiliki 24 ruang kelas.',
      ),
      SoalModel(
        pertanyaan: 'Ada berapa jumlah ruangan LAB di gedung SMK Informatika CBI?',
        opsi: ['5', '4', '3', '2'],
        jawabanBenar: 2,
        pembahasan: 'Di gedung SMK Informatika CBI terdapat 3 ruangan LAB.',
      ),
      SoalModel(
        pertanyaan: 'Di mana lokasi gedung SMK Informatika CBI?',
        opsi: ['Cicurug Jl. Koramil', 'Bogor Jl. Jambu 2', 'Cibadak', 'Sukabumi kota'],
        jawabanBenar: 0,
        pembahasan: 'SMK Informatika CBI berlokasi di Cicurug, Jl. Koramil.',
      ),
      SoalModel(
        pertanyaan: 'Apakah benar di SMK Informatika CBI ada musholanya?',
        opsi: ['Benar', 'Tidak benar', 'Ada, tetapi tidak boleh dipakai', 'Tidak ada sama sekali'],
        jawabanBenar: 0,
        pembahasan: 'Benar, SMK Informatika CBI menyediakan mushola untuk beribadah.',
      ),
      SoalModel(
        pertanyaan: 'Sabtu dan Minggu di SMK Informatika CBI masuk atau libur?',
        opsi: ['Masuk', 'Libur', 'Masuk hanya hari Sabtu', 'Masuk hanya hari Minggu'],
        jawabanBenar: 1,
        pembahasan: 'Hari Sabtu dan Minggu adalah hari libur di SMK Informatika CBI.',
      ),
      SoalModel(
        pertanyaan: 'Apakah murid-murid di SMK Informatika CBI diperbolehkan membawa kendaraan?',
        opsi: ['Tidak boleh', 'Hanya boleh untuk guru', 'Tidak boleh, harus diantar jemput', 'Boleh'],
        jawabanBenar: 3,
        pembahasan: 'Murid diperbolehkan membawa kendaraan ke sekolah.',
      ),
      SoalModel(
        pertanyaan: 'Apakah semua kendaraan boleh dibawa ke sekolah?',
        opsi: ['Ya, semua kendaraan boleh', 'Tidak, hanya motor', 'Tidak, hanya mobil', 'Tidak, hanya sepeda'],
        jawabanBenar: 1,
        pembahasan: 'Tidak semua kendaraan boleh, hanya motor yang diperbolehkan dibawa ke sekolah.',
      ),
      SoalModel(
        pertanyaan: 'Apakah di sekolahmu terdapat parkiran kendaraan?',
        opsi: ['Benar, ada!', 'Tidak ada parkiran', 'Hanya untuk guru', 'Hanya untuk tamu'],
        jawabanBenar: 0,
        pembahasan: 'Sekolah menyediakan area parkir untuk kendaraan.',
      ),
      SoalModel(
        pertanyaan: 'Haruskah semua murid mengikuti peraturan sekolah?',
        opsi: ['Tidak wajib', 'Boleh dilanggar sesekali', 'Hanya wajib untuk kelas X', 'Wajib. Harus!!'],
        jawabanBenar: 3,
        pembahasan: 'Peraturan sekolah wajib diikuti oleh seluruh murid agar kegiatan sekolah tertib.',
      ),
      SoalModel(
        pertanyaan: 'Apakah murid akan kena sanksi jika melakukan pelanggaran sekolah?',
        opsi: ['Tidak, murid bebas', 'Ya! Murid akan kena hukuman', 'Tidak, hanya diberi tahu', 'Tidak, hanya guru yang kena'],
        jawabanBenar: 1,
        pembahasan: 'Murid yang melanggar peraturan akan dikenai sanksi atau hukuman.',
      ),
    ],
  ),
  KategoriModel(
    id: 'mapel',
    nama: 'Mata Pelajaran',
    ikon: Icons.menu_book,
    soal: const [
      SoalModel(
        pertanyaan: 'Apa kepanjangan dari DKV?',
        opsi: ['Desain Komputer Visual', 'Desain Komunikasi Visual', 'Digital Kreatif Visual', 'Desain Karya Visual'],
        jawabanBenar: 1,
        pembahasan: 'DKV adalah singkatan dari Desain Komunikasi Visual.',
      ),
      SoalModel(
        pertanyaan: 'Aplikasi apa yang biasa digunakan untuk membuat desain grafis?',
        opsi: ['CorelDRAW', 'Microsoft Excel', 'Notepad', 'WinRAR'],
        jawabanBenar: 0,
        pembahasan: 'CorelDRAW adalah aplikasi untuk membuat desain grafis berbasis vektor.',
      ),
      SoalModel(
        pertanyaan: 'Apa kepanjangan dari PPLG?',
        opsi: ['Pengembangan Perangkat Lunak dan Gim', 'Program Pengolahan Layanan Grafis', 'Pendidikan Perangkat Lunak dan Game', 'Pengembangan Program dan Layanan Grafis'],
        jawabanBenar: 0,
        pembahasan: 'PPLG adalah singkatan dari Pengembangan Perangkat Lunak dan Gim.',
      ),
      SoalModel(
        pertanyaan: 'Bahasa pemrograman apa yang digunakan untuk membuat website?',
        opsi: ['HTML', 'JPG', 'MP3', 'PDF'],
        jawabanBenar: 0,
        pembahasan: 'HTML digunakan untuk membuat struktur halaman website. JPG, MP3, dan PDF adalah format file.',
      ),
      SoalModel(
        pertanyaan: 'Apa fungsi utama dari Adobe Photoshop?',
        opsi: ['Mengedit video', 'Mengolah gambar dan foto', 'Membuat database', 'Membuat aplikasi Android'],
        jawabanBenar: 1,
        pembahasan: 'Adobe Photoshop dipakai untuk mengolah dan mengedit gambar serta foto.',
      ),
      SoalModel(
        pertanyaan: 'Mata pelajaran apa yang mempelajari tentang jaringan komputer?',
        opsi: ['Seni Budaya', 'PJOK', 'Administrasi Sistem Jaringan', 'Sejarah'],
        jawabanBenar: 2,
        pembahasan: 'Administrasi Sistem Jaringan mempelajari pembuatan dan pengelolaan jaringan komputer.',
      ),
      SoalModel(
        pertanyaan: 'Apa fungsi dari Microsoft Excel?',
        opsi: ['Mengolah angka dan data', 'Mengedit foto', 'Membuat animasi', 'Memutar musik'],
        jawabanBenar: 0,
        pembahasan: 'Microsoft Excel digunakan untuk mengolah angka dan data dalam bentuk tabel.',
      ),
      SoalModel(
        pertanyaan: 'Apa kepanjangan dari CPU?',
        opsi: ['Central Program Unit', 'Computer Personal Unit', 'Central Processing Unit', 'Control Processing User'],
        jawabanBenar: 2,
        pembahasan: 'CPU adalah Central Processing Unit, otak yang memproses perintah pada komputer.',
      ),
      SoalModel(
        pertanyaan: 'Mata pelajaran apa yang mempelajari tentang pembuatan dan pengeditan video?',
        opsi: ['Desain Grafis', 'Editing Video', 'Matematika', 'Bahasa Indonesia'],
        jawabanBenar: 1,
        pembahasan: 'Editing Video mempelajari cara membuat dan mengedit video.',
      ),
      SoalModel(
        pertanyaan: 'Apa fungsi utama dari database dalam pembuatan aplikasi?',
        opsi: ['Mengedit gambar', 'Menyimpan dan mengelola data', 'Mempercepat koneksi internet', 'Membuat desain poster'],
        jawabanBenar: 1,
        pembahasan: 'Database berfungsi menyimpan dan mengelola data yang dipakai aplikasi.',
      ),
    ],
  ),
  KategoriModel(
    id: 'kegiatan',
    nama: 'Kegiatan & Program',
    ikon: Icons.description,
    soal: const [
      SoalModel(
        pertanyaan: 'OSIS adalah singkatan dari?',
        opsi: ['Organisasi Siswa Intra Sekolah', 'Organisasi Sekolah Intra Siswa', 'Olahraga Siswa Intra Sekolah', 'Organisasi Siswa Industri Sekolah'],
        jawabanBenar: 0,
        pembahasan: 'OSIS adalah Organisasi Siswa Intra Sekolah, wadah siswa untuk berorganisasi di sekolah.',
      ),
      SoalModel(
        pertanyaan: 'Ekstrakurikuler yang berlambang tunas kelapa adalah?',
        opsi: ['PMR', 'Pramuka', 'Paskibra', 'Basket'],
        jawabanBenar: 1,
        pembahasan: 'Lambang Gerakan Pramuka adalah tunas kelapa.',
      ),
      SoalModel(
        pertanyaan: 'PMR adalah singkatan dari?',
        opsi: ['Persatuan Murid Remaja', 'Pasukan Muda Raya', 'Palang Merah Remaja', 'Pelajar Mandiri Rajin'],
        jawabanBenar: 2,
        pembahasan: 'PMR (Palang Merah Remaja) melatih siswa dalam pertolongan pertama dan kegiatan kemanusiaan.',
      ),
      SoalModel(
        pertanyaan: 'Upacara bendera di sekolah rutin dilaksanakan pada hari?',
        opsi: ['Selasa', 'Rabu', 'Jumat', 'Senin'],
        jawabanBenar: 3,
        pembahasan: 'Upacara bendera rutin dilaksanakan setiap hari Senin pagi.',
      ),
      SoalModel(
        pertanyaan: 'PKL/Prakerin dilaksanakan di?',
        opsi: ['Dunia usaha dan dunia industri (DUDI)', 'Perpustakaan sekolah', 'Rumah wali kelas', 'Kantin sekolah'],
        jawabanBenar: 0,
        pembahasan: 'Praktik Kerja Lapangan dilakukan di DUDI agar siswa mendapat pengalaman kerja nyata.',
      ),
      SoalModel(
        pertanyaan: 'Tugas utama anggota Paskibra adalah?',
        opsi: ['Mengajar di kelas', 'Mengibarkan bendera saat upacara', 'Mengelola kantin', 'Membuat jadwal pelajaran'],
        jawabanBenar: 1,
        pembahasan: 'Paskibra bertugas sebagai pengibar bendera pada upacara.',
      ),
      SoalModel(
        pertanyaan: 'Kegiatan ekstrakurikuler dilaksanakan pada?',
        opsi: ['Saat ujian berlangsung', 'Saat jam tidur', 'Di luar jam pelajaran', 'Hanya saat libur panjang'],
        jawabanBenar: 2,
        pembahasan: 'Ekstrakurikuler dilaksanakan di luar jam pelajaran untuk mengembangkan minat dan bakat.',
      ),
      SoalModel(
        pertanyaan: 'Hari Kemerdekaan Republik Indonesia diperingati setiap tanggal?',
        opsi: ['1 Juni', '28 Oktober', '10 November', '17 Agustus'],
        jawabanBenar: 3,
        pembahasan: 'Kemerdekaan Indonesia diproklamasikan pada 17 Agustus 1945.',
      ),
      SoalModel(
        pertanyaan: 'Hari Pendidikan Nasional diperingati setiap tanggal?',
        opsi: ['2 Mei', '20 Mei', '1 Mei', '25 November'],
        jawabanBenar: 0,
        pembahasan: 'Hari Pendidikan Nasional diperingati setiap 2 Mei, hari lahir Ki Hajar Dewantara.',
      ),
      SoalModel(
        pertanyaan: 'Hari Guru Nasional diperingati setiap tanggal?',
        opsi: ['2 Mei', '25 November', '28 Oktober', '17 Agustus'],
        jawabanBenar: 1,
        pembahasan: 'Hari Guru Nasional diperingati setiap 25 November.',
      ),
    ],
  ),
];
