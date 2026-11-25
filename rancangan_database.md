# Rancangan Penyimpanan Data QuizLearn

Versi ini menyimpan data di penyimpanan lokal HP (shared_preferences, format JSON),
sehingga aplikasi langsung bisa dipakai tanpa server.

## Kunci `users` (peta: id huruf kecil -> data akun)
| Field    | Tipe   | Keterangan                       |
|----------|--------|----------------------------------|
| nama     | String | Nama lengkap siswa               |
| id       | String | Email atau username              |
| password | String | Kata sandi                       |

## Kunci `user_aktif`
Berisi id akun yang sedang login (dihapus saat Logout).

## Kunci `hasil_kuis` (daftar hasil)
| Field    | Tipe   | Keterangan                          |
|----------|--------|-------------------------------------|
| userId   | String | id akun (huruf kecil)               |
| nama     | String | Nama siswa                          |
| kategori | String | Nama kategori kuis                  |
| skor     | int    | Nilai 0-100                         |
| benar    | int    | Jumlah jawaban benar                |
| total    | int    | Jumlah soal                         |
| tanggal  | String | Waktu pengerjaan (ISO 8601)         |

Bank soal ada di `lib/data/bank_soal.dart`.

## Rencana pengembangan: Firebase
Jika nanti ingin memakai Firebase (sesuai rencana LKPD), koleksi yang disarankan:
`users/{uid}`, `kategori/{id}/soal/{id}`, dan `hasil/{id}`. Cukup ganti isi
`services/auth_service.dart` dan `services/quiz_service.dart`; halaman tidak perlu diubah.
