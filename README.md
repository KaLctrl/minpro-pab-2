# Activity Tracker App (Log-Olahraga)

Aplikasi **Activity Tracker** (log-olahraga) adalah aplikasi mobile yang dibuat menggunakan **Flutter** dan **Supabase** untuk mencatat aktivitas harian pengguna.
Pengguna dapat menambahkan, melihat, mengedit, dan menghapus aktivitas yang dilakukan setiap hari.

Aplikasi ini dibuat sebagai bagian dari **Mini Project Praktikum Pengembangan Aplikasi Bergerak (PAB)**.

---

# Teknologi yang Digunakan

Aplikasi ini dibangun menggunakan beberapa teknologi berikut:

* **Flutter** → Framework utama untuk membangun aplikasi mobile.
* **Dart** → Bahasa pemrograman yang digunakan oleh Flutter.
* **Supabase** → Backend as a Service untuk database dan authentication.
* **Material Design 3** → Sistem desain untuk tampilan UI aplikasi.

---

# Fitur Aplikasi

Aplikasi Activity Tracker(log-olahraga) memiliki beberapa fitur utama yaitu:

### 1. Register

Pengguna dapat membuat akun baru menggunakan email dan password.

### 2. Login

Pengguna dapat masuk ke aplikasi menggunakan akun yang telah didaftarkan.

### 3. Menambah Aktivitas

Pengguna dapat menambahkan aktivitas yang dilakukan dengan informasi:

* Nama aktivitas
* Durasi aktivitas
* Catatan
* Tanggal aktivitas

### 4. Melihat Daftar Aktivitas

Semua aktivitas yang telah dibuat akan ditampilkan dalam bentuk daftar.

### 5. Edit Aktivitas

Pengguna dapat mengubah informasi aktivitas yang sudah dibuat sebelumnya.

### 6. Hapus Aktivitas

Pengguna dapat menghapus aktivitas yang tidak diperlukan lagi.

---

# Struktur Folder Project

Berikut struktur utama project Flutter ini:

```
lib
│
├── pages
│   ├── login_page.dart
│   ├── register_page.dart
│   ├── activity_list_page.dart
│   └── activity_form_page.dart
│
├── services
│   └── activity_service.dart
│
├── widgets
│   └── activity_card.dart
│
└── main.dart
```

Penjelasan:

* **pages** → Berisi halaman utama aplikasi.
* **services** → Berisi logic untuk komunikasi dengan database Supabase.
* **widgets** → Komponen UI yang digunakan ulang.
* **main.dart** → Entry point aplikasi Flutter.

---

# Struktur Database Supabase

Aplikasi ini menggunakan tabel **activities** di Supabase.

### Tabel: `activities`

| Field    | Type      | Deskripsi                  |
| -------- | --------- | -------------------------- |
| id       | uuid      | Primary key                |
| user_id  | uuid      | ID user dari Supabase Auth |
| name     | text      | Nama aktivitas             |
| duration | integer   | Durasi aktivitas (menit)   |
| notes    | text      | Catatan aktivitas          |
| date     | timestamp | Tanggal aktivitas          |

---

# Tampilan Aplikasi

Beberapa tampilan utama aplikasi:

* Halaman Login
* Halaman Register
* Halaman List Activity
* Halaman Tambah Activity
* Halaman Edit Activity
assets/screenshots/1.png
assets/screenshots/2.png
assets/screenshots/3.png
assets/screenshots/4.png
assets/screenshots/5.png


---

#  Konfigurasi Supabase

Agar aplikasi dapat berjalan, konfigurasi Supabase harus dilakukan pada file:

```
lib/main.dart
```

Isi dengan URL dan Anon Key dari project Supabase:

```
Supabase.initialize(
  url: 'YOUR_SUPABASE_URL',
  anonKey: 'YOUR_SUPABASE_ANON_KEY',
);
```

---

#  Developer

Project ini dibuat oleh:

**Nama:** Muh Haikal Adis Yafiq
**Program Studi:** Sistem Informasi
**Universitas:** Universitas Mulawarman

---

# Lisensi

Project ini dibuat untuk keperluan **pembelajaran dan tugas akademik**.
