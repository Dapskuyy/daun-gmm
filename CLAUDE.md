AI Assistant harus mematuhi aturan berikut saat menulis atau memodifikasi kode:

### 1. Sintaks & Framework

- Gunakan bahasa Java dengan API standar Processing 3 / Processing 4.
- Gunakan arsitektur fungsi dasar: setup() dijalankan sekali, draw() dijalankan berulang (secara default 24 FPS).
- Resolusi yang disarankan: size(1280, 720); atau fullScreen(); (sesuaikan dengan kesepakatan tim).

### 2. Transformasi Geometri (PENTING)
Berdasarkan materi GM-08 Transformasi:

- Saat menggambar motif berulang (seperti batik Kawung), WAJIB menggunakan pushMatrix() dan popMatrix() untuk mengisolasi perubahan koordinat.
- Gunakan translate(), rotate(), dan scale() di dalam blok pushMatrix(). Jangan mengubah titik koordinat secara manual jika bisa menggunakan transformasi.

### 3. Manajemen Animasi & Waktu
Berdasarkan materi GM-09 Animasi & GM-04 Tipe Animasi:

- JANGAN PERNAH menggunakan fungsi delay(). Fungsi ini akan membekukan seluruh thread gambar.
- Gunakan fungsi millis() untuk mengatur timing pergantian scene atau kemunculan objek.
  Contoh: if (millis() > 5000) { currentScene = 2; }
- Gunakan interpolasi linear (lerp()) atau penambahan variabel posisi (x += speed;) untuk pergerakan objek yang halus.
- Transisi fade-in/fade-out harus diimplementasikan menggunakan parameter Alpha pada warna: fill(R, G, B, alphaVariable);

### 4. Layering & Rendering Visual

- Urutan Draw: Latar belakang (background()) digambar pertama, diikuti oleh elemen generatif (motif batik/tebing), dan terakhir adalah aset pixel art menggunakan fungsi image().
- Pastikan memuat gambar di dalam setup() menggunakan loadImage() untuk mencegah memory leak atau lag, BUKAN di dalam draw().

### 5. Modularitas & Keterbacaan

- Jangan menumpuk semua logika di dalam fungsi draw() utama.
- Pecah logika menggambar ke dalam prosedur/fungsi mandiri (misal: void drawMotifKawung(float x, float y, float size)).
- Gunakan komentar ber bahasa Indonesia yang jelas untuk setiap blok kode algoritma.

## 📝 Catatan Khusus untuk AI Integrations (Cursor/Cline/Claude)
Jika pengguna meminta bantuan untuk membuat "Looping Motif" atau "Transisi Animasi":

1. Selalu asumsikan variabel warna akan menggunakan palet warna bumi (cokelat tanah, krem hangat) kecuali diminta spesifik.
2. Perhatikan kinerja (performance): Jika menggambar ribuan objek primitif (elips/garis), sarankan penggunaan createGraphics() (PGraphics) untuk membuat buffer gambar statis agar tidak digambar ulang setiap frame, KECUALI jika motif tersebut sedang dianimasikan (misal: membesar/berputar).
