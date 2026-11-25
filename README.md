# QuizLearn - Aplikasi Quiz Siswa SMK Informatika CBI (Flutter, Android)

## Cara mendapatkan APK TANPA install Flutter (pakai GitHub Actions)
1. Buat akun GitHub (gratis) lalu buat repository baru, misalnya `quizlearn`.
2. Upload SEMUA isi folder ini (termasuk folder `.github`) ke repository tersebut.
   Di halaman repo: Add file > Upload files, tarik semua isi folder, lalu Commit.
   (Pastikan folder tersembunyi `.github/workflows/build-apk.yml` ikut terupload.)
3. Buka tab **Actions**. Workflow **Build APK** berjalan otomatis (sekitar 5-10 menit).
   Jika tidak jalan: pilih Build APK > Run workflow.
4. Setelah centang hijau, klik run tersebut, lalu di bagian **Artifacts** unduh `QuizLearn-APK`.
5. Ekstrak zip-nya, kirim `app-release.apk` ke HP, buka, izinkan "Instal dari sumber tidak dikenal", instal.

## Jika Flutter sudah terpasang
```
flutter create --platforms=android .
flutter pub get
flutter run            # atau: flutter build apk --release
```

## Struktur
- `lib/main.dart`, `lib/theme.dart`
- `lib/pages/` splash, login, home, beranda, kategori, quiz, hasil, pembahasan, profil, riwayat, tentang sekolah
- `lib/components/` kartu kategori, opsi jawaban, timer, tombol, header, kartu nilai
- `lib/models/` user, kategori, soal, hasil
- `lib/services/` auth_service, quiz_service
- `lib/data/bank_soal.dart` bank soal (bisa diedit)
- `database/` rancangan penyimpanan data
