# Visualisasi Filosofi Batik — Kelompok DAUN

Repository ini berisi source code, aset visual/audio, dan dokumentasi untuk proyek akhir mata kuliah Grafika dan Multimedia. Proyek berupa animasi Processing yang menampilkan filosofi tiga motif batik — Kawung, Megamendung, dan Parang — melalui visual bergerak, narasi audio, subtitle, dan transisi scene yang teratur, lalu ditutup dengan scene ending dan credit yang otomatis looping kembali ke awal.

## Deskripsi Singkat

Animasi ini menghadirkan makna dari motif batik Kawung, Megamendung, dan Parang melalui visual yang bergerak dan terdengar. Karya ini menggabungkan elemen grafis generatif (kunang-kunang, awan Megamendung, matahari), transisi fade antar scene, narasi audio, dan subtitle sehingga penonton bisa memahami pesan budaya yang ingin disampaikan.

## Fitur Utama

- 16 scene beralur (pembuka, tiga motif batik, transisi, penutup, dan credit) dengan transisi fade in/out yang halus
- Narasi audio (10 klip MP3) dan musik latar (BGM) yang disinkronkan dengan subtitle mengikuti alur cerita
- Objek visual generatif: kunang-kunang yang beterbangan, awan Megamendung yang melayang, dan animasi matahari berputar
- Interaksi klik mouse untuk melompat cepat ke waypoint scene berikutnya
- Auto-loop: animasi otomatis kembali ke scene awal setelah credit selesai (tanpa perlu restart manual)

## Struktur Proyek

```
Kelompok-DAUN/
├── AnimasiBatik/                   # Folder utama proyek Processing (sketch)
│   ├── AnimasiBatik.pde            # Kode utama: setup, draw, scene, audio, subtitle, kelas visual
│   └── data/                       # Aset gambar & audio yang dimuat sketch
│       ├── 1.png, 3.1A.png, 3.2A.png, 3.2B.png, 3.3.png
│       ├── 4.1.png, 4.3.png, 5.1.png, 5.2.png, 5.3.png, 5.4.png
│       ├── Motif-Kawung.png, Motif-Megamendung.png, Motif-Parang.png
│       └── Audio/
│           ├── BGM.mp3                     # Musik latar
│           ├── Narr-1.1.mp3 … Narr-4.2.mp3 # Narasi tiap segmen motif
│           ├── Narr-ED1.mp3, Narr-ED2.mp3  # Narasi penutup
│           └── Sample/
├── Docs/                           # Dokumen pendukung proyek
│   ├── Storyboard-GMM.pdf          # Storyboard animasi
│   └── Script Subtitle.docx        # Naskah narasi & subtitle
├── .vscode/                        # Konfigurasi VS Code (task & auto-approve untuk menjalankan sketch)
└── README.md
```

## Anggota Kelompok (DAUN)

| Nama | NIM |
|---|---|
| Muhammad Farhan H.A | 24523115 |
| Dafa Rizal R. | 24523164 |
| Sifa Aulia A. | 24523078 |

## Persyaratan

- Processing IDE (rekomendasi: Processing 4.x)
- Library Processing **Sound**

## Cara Menjalankan Program

### Via Processing IDE
1. Buka aplikasi Processing.
2. Buka file [AnimasiBatik/AnimasiBatik.pde](AnimasiBatik/AnimasiBatik.pde).
3. Pastikan library Sound terinstal:
   - Pilih Sketch > Import Library > Add Library
   - Cari "Sound" lalu install
4. Tekan tombol Run atau gunakan shortcut Ctrl+R.
5. Klik mouse di area window animasi untuk melompat lebih cepat ke scene berikutnya.

### Via VS Code
Proyek ini sudah menyertakan task VS Code (`.vscode/tasks.json`) yang menjalankan sketch langsung lewat Processing.exe. Jalankan task default (Terminal > Run Task... > "Run Processing sketch") untuk build & run tanpa membuka Processing IDE secara manual. Sesuaikan path `Processing.exe` pada `tasks.json` jika instalasi Processing berada di lokasi berbeda.

## Catatan Tambahan

- Program memerlukan seluruh file di folder `AnimasiBatik/data` (gambar dan audio) tetap berada di lokasi aslinya sebelum dijalankan.
- Animasi akan otomatis mengulang (loop) dari scene awal setelah credit selesai ditampilkan.

## YouTube
https://youtu.be/9Zwn4kX2kfo
