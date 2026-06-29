**Proyek Animasi Grafika dan Multimedia - Jejak Makna dalam Sehelai Batik
Repository ini memuat kode sumber, aset, dan dokumentasi teknis untuk proyek akhir mata kuliah Grafika dan Multimedia. Proyek ini berupa sketsa animasi generatif interaktif yang dikembangkan menggunakan lingkungan pengembangan Processing (Java) dengan fokus mengangkat nilai budaya dan filosofi di balik motif batik tradisional Indonesia.

Deskripsi Proyek
Animasi ini menyampaikan narasi visual mengenai makna mendalam di balik motif batik seperti Kawung dan Parang. Pendekatan visual menggabungkan dua elemen utama: generative art yang dibangun menggunakan baris kode objek primitif komputer grafis untuk membentuk pola batik, serta pixel art dua dimensi untuk merepresentasikan karakter utama dan mendukung alur cerita. Animasi ini dirancang dengan target durasi terstruktur antara 2 hingga 3 menit.

Implementasi Teknis dan Fitur Utama
Proyek ini mengintegrasikan berbagai konsep dasar grafika komputer dan multimedia yang dipelajari selama perkuliahan, meliputi:

Transformasi Geometri Dua Dimensi: Memanfaatkan fungsi isolasi koordinat melalui instruksi pushMatrix() dan popMatrix() serta memanipulasi posisi, orientasi, dan ukuran objek menggunakan perintah translate(), rotate(), dan scale().

Algoritma Pola Generatif: Menggunakan struktur perulangan bersarang (nested loops) untuk merender pola geometris berulang yang presisi guna menghasilkan visualisasi kain batik secara efisien.

Manajemen Waktu dan Pergantian Scene: Menggunakan fungsi internal millis() untuk mengontrol timeline transisi antar-adegan (scene management) dan efek fade-in/fade-out berbasis parameter kecerahan/alpha tanpa menghentikan kelancaran render thread (menghindari penggunaan fungsi delay()).

Komposisi Multi-layer Visual: Menerapkan teknik penumpukan lapisan (layering) visual di mana latar belakang generatif digambar terlebih dahulu sebelum merender aset citra digital (sprite) eksternal untuk menjaga kedalaman visual.

Persyaratan Sistem dan Cara Menjalankan
Untuk menjalankan sketsa animasi ini secara lokal, pastikan perangkat Anda telah memenuhi spesifikasi berikut:

Processing IDE (versi 3.x atau versi 4.x) yang dapat diunduh melalui situs resmi processing.org.

Java Runtime Environment (JRE) yang umumnya sudah terintegrasi di dalam bundel aplikasi Processing.

Langkah menjalankan:

Unduh atau klon repository ini ke direktori lokal Anda.

Buka berkas AnimasiBatik.pde yang berada di dalam folder AnimasiBatik menggunakan Processing IDE.

Tekan tombol Run (ikon segitiga) pada baris menu Processing untuk memulai eksekusi animasi.
