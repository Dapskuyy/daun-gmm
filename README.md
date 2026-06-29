# Proyek Animasi Grafika dan Multimedia - Jejak Makna dalam Sehelai Batik

Repository ini memuat kode sumber, aset, dan dokumentasi teknis untuk proyek akhir mata kuliah Grafika dan Multimedia. Proyek ini berupa sketsa animasi generatif interaktif yang dikembangkan menggunakan lingkungan pengembangan Processing (Java) dengan fokus mengangkat nilai budaya dan filosofi di balik motif batik tradisional Indonesia.

## Deskripsi Proyek

Animasi ini menyampaikan narasi visual mengenai makna mendalam di balik motif batik seperti Kawung dan Parang. Pendekatan visual menggabungkan dua elemen utama: generative art yang dibangun menggunakan baris kode objek primitif komputer grafis untuk membentuk pola batik, serta pixel art dua dimensi untuk merepresentasikan karakter utama dan mendukung alur cerita. Animasi ini dirancang dengan target durasi terstruktur antara 2 hingga 3 menit.

## Implementasi Teknis dan Fitur Utama

Proyek ini mengintegrasikan berbagai konsep dasar grafika komputer dan multimedia yang dipelajari selama perkuliahan, meliputi:

1. **Transformasi Geometri Dua Dimensi:** Memanfaatkan fungsi isolasi koordinat melalui instruksi `pushMatrix()` dan `popMatrix()` serta memanipulasi posisi, orientasi, dan ukuran objek menggunakan perintah `translate()`, `rotate()`, dan `scale()`.
2. **Algoritma Pola Generatif:** Menggunakan struktur perulangan bersarang (nested loops) untuk merender pola geometris berulang yang presisi guna menghasilkan visualisasi kain batik secara efisien.
3. **Manajemen Waktu dan Pergantian Scene:** Menggunakan fungsi internal `millis()` untuk mengontrol timeline transisi antar-adegan (scene management) dan efek fade-in/fade-out berbasis parameter kecerahan/alpha tanpa menghentikan kelancaran render thread (menghindari penggunaan fungsi `delay()`).
4. **Komposisi Multi-layer Visual:** Menerapkan teknik penumpukan lapisan (layering) visual di mana latar belakang generatif digambar terlebih dahulu sebelum merender aset citra digital (sprite) eksternal untuk menjaga kedalaman visual.

## Struktur Direktori

```text
Kelompok-DAUN/
├── AnimasiBatik/                  # Folder utama sketsa Processing
│   ├── AnimasiBatik.pde           # File eksekusi utama (setup dan draw)
│   ├── SceneKawung.pde            # Modul logika visual motif Kawung
│   ├── SceneParang.pde            # Modul logika visual motif Parang
│   └── data/                      # Direktori penyimpanan aset eksternal
│       ├── karakter.png      
├── Docs/                          # Dokumentasi perencanaan proyek
│   ├── Storyboard.pdf
│   └── Rancangan_Animasi.md
├── CLAUDE.md                      # Panduan aturan koding dan standar AI
└── README.md                      # Deskripsi utama repository
