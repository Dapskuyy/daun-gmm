import processing.sound.*;

// Variabel global utama
PImage img1, imgKawung, img3, img32A, img32B, img33, imgMegamendung, img41, img43, imgParang, img51, img52, img53, img54;
int imgWidth, imgHeight;

// --- Narasi dan audio ---
String[] narrFile = {
  "Narr-1.1.mp3", "Narr-1.2.mp3",
  "Narr-2.1.mp3", "Narr-2.2.mp3",
  "Narr-3.1.mp3", "Narr-3.2.mp3",
  "Narr-4.1.mp3", "Narr-4.2.mp3",
  "Narr-ED1.mp3", "Narr-ED2.mp3"
};

int[] narrStart = {
  0, 16000,
  24000, 34000,
  43000, 61000,
  82000, 91000,
  99000, 107000
};

int[] narrDur = {
  14000, 8000,
  8000, 9000,
  4000, 11000,
  7000, 6000,
  7000, 8000
};

String[] narrSub = {
  "Di balik setiap goresan canting yang menari di atas kain, tersimpan doa dan harapan yang tak terucap.",
  "Batik bukan sekadar kain, ia adalah rekaman jiwa, saksi bisu dari kearifan yang diwariskan turun-temurun.",
  "Lihatlah Kawung. Ketika riuhnya godaan dunia datang mencoba menguasai diri, ia mengajarkan kita untuk berhenti menggapainya.",
  "Empat kelopaknya yang simetris adalah simbol pengendalian hawa nafsu, menuntun jiwa kita kembali pada kesucian dan keteraturan yang sejati.",
  "Dan inilah Megamendung. Awan yang berarak dengan kelembutannya.",
  "Ia bukan sekadar hiasan, melainkan pengingat akan kesabaran. Bahwa sekeras apa pun masalah yang menghantam, selalu ada keteduhan yang bisa kita temukan jika kita mampu bersabar.",
  "Terakhir, Parang. Garis-garis diagonal yang tak pernah putus, seperti ombak laut yang terus menghantam karang.",
  "Ia adalah simbol semangat. Semangat yang pantang menyerah, keteguhan yang tak mudah goyah oleh badai kehidupan.",
  "Setiap garis memiliki cerita. Setiap motif memiliki doa. Mereka adalah cerminan hidup, pelajaran tentang menjadi manusia yang utuh.",
  "Batik kita, warisan kita, makna yang terus hidup. Mari terus menjaga jejak-jejak makna ini, di setiap goresan yang kita beri."
};

SoundFile[] narrSounds = new SoundFile[narrFile.length];
boolean[] narrPlayed = new boolean[narrFile.length];

SoundFile bgm;
float volumeBGM = 0.02;

// Titik lompat saat klik mouse
int[] waypoints = {
  16000, 24000, 28000, 33000, 34000, 38000, 43000, 56000, 61000,
  75000, 82000, 87000, 90000, 92000, 95500, 99000, 103000, 107000,
  111000, 115000
};

// Variabel transisi dan animasi
float alpha1 = 0, alpha2 = 0, alpha3 = 0, alpha32 = 0, alpha33 = 0, alphaMega = 0, alpha41 = 0;
float alpha42 = 0;
float alpha5 = 0, alpha52 = 0, alpha53 = 0, alpha54 = 0;
float alphaEnding1 = 0, alphaEnding2 = 0, alphaEnding3 = 0, alphaEnding4 = 0;
float alphaCredit = 0;

float zoom1 = 1.1;
float zoom43 = 1.08;

int scene = 1;
int waktuOffset = 0;

KunangKunang[] kumpulanKunang = new KunangKunang[30];
KunangKunang kunangSpesial;
AwanMegamendung[] kumpulanAwan = new AwanMegamendung[15];

void setup() {
  size(1280, 720);
  frameRate(24);

  // bagian ini memuat semua gambar dan suara sebelum animasi berjalan.
  // Load gambar
  img1 = loadImage("1.png");
  imgKawung = loadImage("Motif-Kawung.png");
  img3 = loadImage("3.1A.png");
  img32A = loadImage("3.2A.png");
  img32B = loadImage("3.2B.png");
  img33 = loadImage("3.3.png");
  imgMegamendung = loadImage("Motif-Megamendung.png");
  img41 = loadImage("4.1.png");
  img43 = loadImage("4.3.png");
  imgParang = loadImage("Motif-Parang.png");
  img51 = loadImage("5.1.png");
  img52 = loadImage("5.2.png");
  img53 = loadImage("5.3.png");
  img54 = loadImage("5.4.png");

  // Load narasi
  for (int i = 0; i < narrFile.length; i++) {
    narrSounds[i] = new SoundFile(this, "Audio/" + narrFile[i]);
  }

  // Load latar musik
  bgm = new SoundFile(this, "Audio/BGM.mp3");
  bgm.loop();
  bgm.amp(volumeBGM);

  if (imgKawung != null) {
    imgWidth = imgKawung.width;
    imgHeight = imgKawung.height;
  }

  kunangSpesial = new KunangKunang(width / 2, height / 2, 22);
  for (int i = 0; i < kumpulanKunang.length; i++) kumpulanKunang[i] = new KunangKunang();
  for (int i = 0; i < kumpulanAwan.length; i++) kumpulanAwan[i] = new AwanMegamendung(i);
}

void draw() {
  int waktu = millis() + waktuOffset;

  if (bgm != null) bgm.amp(volumeBGM);

  // jika sampai akhir kredit, reset kembali ke awal untuk looping.
  if (waktu >= 115000 + 10000) {
    loopAnimation();
    waktu = millis() + waktuOffset;
  }

  // bagian ini mengatur urutan scene agar animasi sesuai narasi.
  // Penentuan scene berdasarkan waktu
  if (waktu < 24000) scene = 1;
  else if (waktu < 28000) scene = 2;
  else if (waktu < 33000) scene = 3;
  else if (waktu < 38000) scene = 4;
  else if (waktu < 43000) scene = 5;
  else if (waktu < 56000) scene = 6;
  else if (waktu < 61000) scene = 7;
  else if (waktu < 75000) scene = 8;
  else if (waktu < 82000) scene = 9;
  else if (waktu < 87000) scene = 10;
  else if (waktu < 90000) scene = 11;
  else if (waktu < 92000) scene = 12;
  else if (waktu < 95500) scene = 13;
  else if (waktu < 99000) scene = 14;
  else if (waktu < 115000) scene = 15;
  else scene = 16;

  // Jalankan scene yang aktif
  if (scene == 1) drawScene1();
  else if (scene == 2) drawScene2();
  else if (scene == 3) drawScene3(waktu);
  else if (scene == 4) drawScene32(waktu);
  else if (scene == 5) drawScene33(waktu);
  else if (scene == 6) drawSceneMegamendung(waktu);
  else if (scene == 7) drawScene41(waktu);
  else if (scene == 8) drawScene42(waktu);
  else if (scene == 9) drawScene43(waktu);
  else if (scene == 10) drawScene5(waktu);
  else if (scene == 11) drawScene51(waktu);
  else if (scene == 12) drawScene52(waktu);
  else if (scene == 13) drawScene53(waktu);
  else if (scene == 14) drawScene54(waktu);
  else if (scene == 15) drawSceneEnding(waktu);
  else if (scene == 16) drawCreditScene();

  triggerAudio(waktu);
  drawSubtitles(waktu);
}

void loopAnimation() {
  waktuOffset = -millis();
  resetAnimationState();
  stopAllNarration();
  for (int i = 0; i < narrPlayed.length; i++) {
    narrPlayed[i] = false;
  }
}

// --- Scene awal ---
void drawScene1() {
  background(#4F7942);
  imageMode(CENTER);
  if (alpha1 < 255) alpha1 += 2;
  zoom1 += 0.001;

  pushMatrix();
  translate(width / 2, height / 2);
  scale(zoom1);
  tint(255, alpha1);
  image(img1, 0, 0);
  popMatrix();
}

void drawScene2() {
  background(#240902);
  imageMode(CORNER);
  if (alpha2 < 255) alpha2 += 3;
  tint(255, alpha2);

  for (int y = 0; y < height; y += imgHeight) {
    for (int x = 0; x < width; x += imgWidth) image(imgKawung, x, y);
  }
}

void drawScene3(int waktu) {
  background(#0B132B);
  imageMode(CENTER);
  if (waktu < 32000) {
    if (alpha3 < 255) alpha3 += 3;
  } else {
    if (alpha3 > 0) alpha3 -= 8;
  }

  tint(255, alpha3);
  image(img3, width / 2, height / 2, img3.width * 0.6, img3.height * 0.6);

  float aK = map(alpha3, 0, 255, 0, 127);
  float aI = map(alpha3, 0, 255, 0, 255);
  for (KunangKunang k : kumpulanKunang) {
    k.update();
    k.display(aK, aI);
  }
  kunangSpesial.update();
  kunangSpesial.display(aK, aI);
}

void drawScene32(int waktu) {
  background(0);
  imageMode(CENTER);
  if (waktu < 37000) {
    if (alpha32 < 255) alpha32 += 4;
  } else {
    if (alpha32 > 0) alpha32 -= 8;
  }

  tint(255, alpha32);
  if (waktu < 35000) image(img32A, width / 2, height / 2, img32A.width * 1.2, img32A.height * 1.2);
  else image(img32B, width / 2, height / 2, img32B.width * 1.2, img32B.height * 1.2);
}

void drawScene33(int waktu) {
  background(#0B132B);
  imageMode(CENTER);
  if (waktu < 42000) {
    if (alpha33 < 255) alpha33 += 3;
  } else {
    if (alpha33 > 0) alpha33 -= 8;
  }

  tint(255, alpha33);
  image(img33, width / 2, height / 2, img33.width * 1.0, img33.height * 1.0);
  for (KunangKunang k : kumpulanKunang) {
    k.update();
    k.display(map(alpha33, 0, 255, 0, 127), map(alpha33, 0, 255, 0, 255));
  }
}

void drawSceneMegamendung(int waktu) {
  background(#0F2027);
  imageMode(CENTER);
  if (waktu < 55000) {
    if (alphaMega < 255) alphaMega += 10;
  } else {
    if (alphaMega > 0) alphaMega -= 15;
  }

  tint(255, alphaMega);
  for (AwanMegamendung a : kumpulanAwan) {
    a.display();
  }
}

void drawScene41(int waktu) {
  background(#AFEEEE);
  imageMode(CENTER);
  if (waktu < 60000) {
    if (alpha41 < 255) alpha41 += 4;
  } else {
    if (alpha41 > 0) alpha41 -= 12;
  }

  tint(255, alpha41);
  image(img41, width / 2, height / 2, img41.width, img41.height);
}

// --- Scene transisi motif ---
// scene ini menampilkan perpindahan motif secara halus dan menarik untuk dipresentasikan.
void drawScene42(int waktu) {
  int waktuMulai = 61000;
  int waktuSelesai = 75000;
  background(#AFEEEE);
  imageMode(CENTER);
  if (alpha42 < 255) alpha42 += 4;

  pushMatrix();
  fill(#FFD700);
  noStroke();
  drawSunBentukan(width / 2, height / 2, 90);
  popMatrix();

  tint(255, alpha42);
  float progress = map(waktu, waktuMulai, waktuSelesai, 0, 1);
  progress = constrain(progress, 0, 1);

  float xKiri1 = lerp(-300, width / 2 - 40, progress);
  float yKiri1 = height / 2 + 30;
  image(imgMegamendung, xKiri1, yKiri1, imgMegamendung.width * 1.3, imgMegamendung.height * 1.3);

  float xKiri2 = lerp(-500, width / 2 - 120, progress);
  float yKiri2 = height / 5 - 50;
  image(imgMegamendung, xKiri2, yKiri2, imgMegamendung.width * 0.5, imgMegamendung.height * 0.5);

  float xKiri3 = lerp(-200, width / 2 + 10, progress);
  float yKiri3 = height / 2 - 20;
  image(imgMegamendung, xKiri3, yKiri3, imgMegamendung.width * 1.1, imgMegamendung.height * 1.1);

  float xKanan1 = lerp(width + 300, width / 2 + 80, progress);
  float yKanan1 = height / 2 + 50;
  image(imgMegamendung, xKanan1, yKanan1, imgMegamendung.width * 1.0, imgMegamendung.height * 1.0);

  float xKanan2 = lerp(width + 500, width / 2 + 110, progress);
  float yKanan2 = height / 5 - 70;
  image(imgMegamendung, xKanan2, yKanan2, imgMegamendung.width * 0.8, imgMegamendung.height * 0.8);
}

void drawScene43(int waktu) {
  int waktuMulai = 75000;
  int waktuSelesai = 82000;

  background(#B0E0E6);
  imageMode(CENTER);
  noTint();

  float progress = map(waktu, waktuMulai, waktuSelesai, 0, 1);
  progress = constrain(progress, 0, 1);
  float currentZoom = lerp(zoom43, 1.0, progress);

  pushMatrix();
  translate(width / 2, height / 2);
  scale(currentZoom);
  image(img43, 0, 0, img43.width, img43.height);
  popMatrix();
}

// --- Scene Parang ---
void drawScene5(int waktu) {
  background(#F8F4E3);
  imageMode(CENTER);
  alpha5 = hitungAlphaFade(waktu, 82000, 87000);
  tint(255, alpha5);
  if (imgParang != null) image(imgParang, width / 2, height / 2, width, height);
  noTint();
}

void drawScene51(int waktu) {
  background(#B0E0E6);
  imageMode(CENTER);
  float progress = constrain(map(waktu, 87000, 90000, 0, 1), 0, 1);
  float yPos = lerp(height * 0.60, height * 0.45, progress);
  noTint();
  if (img51 != null) image(img51, width / 2, yPos, img51.width * 0.7, img51.height * 0.7);
}

void drawScene52(int waktu) {
  background(0);
  imageMode(CENTER);
  alpha52 = hitungAlphaFade(waktu, 90000, 92000);
  tint(255, alpha52);
  if (img52 != null) image(img52, width / 2, height / 2, width, height);
  noTint();
}

void drawScene53(int waktu) {
  background(#B0E0E6);
  imageMode(CENTER);
  alpha53 = hitungAlphaFade(waktu, 92000, 95500);
  tint(255, alpha53);
  if (img53 != null) image(img53, width / 2, height / 2, img53.width, img53.height);
  noTint();
}

void drawScene54(int waktu) {
  background(0);
  imageMode(CENTER);
  alpha54 = hitungAlphaFade(waktu, 95500, 99000);
  tint(255, alpha54);
  if (img54 != null) image(img54, width / 2, height / 2, width, height);
  noTint();
}

// --- Penutup dan kredit ---
// agian penutup memberi kesan akhir yang rapi dan membuat karya terasa lengkap.
void drawSceneEnding(int waktu) {
  background(255);
  imageMode(CENTER);
  float skala = 0.4;

  float xKiriAtas = width * 0.25;
  float yKiriAtas = height * 0.25;
  float xTengahBawah = width * 0.50;
  float yTengahBawah = height * 0.75;
  float xTengahAtas = width * 0.50;
  float yTengahAtas = height * 0.25;
  float xKiriBawah = width * 0.25;
  float yKiriBawah = height * 0.75;

  alphaEnding1 = hitungAlphaFade(waktu, 99000, 103000);
  tint(255, alphaEnding1);
  if (img1 != null) image(img1, xKiriAtas, yKiriAtas, img1.width * skala, img1.height * skala);

  alphaEnding2 = hitungAlphaFade(waktu, 103000, 107000);
  tint(255, alphaEnding2);
  if (img3 != null) image(img3, xTengahBawah, yTengahBawah, img3.width * skala, img3.height * skala);

  alphaEnding3 = hitungAlphaFade(waktu, 107000, 111000);
  tint(255, alphaEnding3);
  if (img41 != null) image(img41, xTengahAtas, yTengahAtas, img41.width * skala, img41.height * skala);

  alphaEnding4 = hitungAlphaFade(waktu, 111000, 115000);
  tint(255, alphaEnding4);
  if (img54 != null) image(img54, xKiriBawah, yKiriBawah, img54.width * skala, img54.height * skala);

  noTint();
}

// Fungsi bantu untuk transisi fade
float hitungAlphaFade(int waktu, int startMs, int endMs) {
  if (waktu <= startMs || waktu >= endMs) return 0;
  if (waktu < startMs + 1000) return map(waktu, startMs, startMs + 1000, 0, 255);
  if (waktu > endMs - 1000) return map(waktu, endMs - 1000, endMs, 255, 0);
  return 255;
}

void drawCreditScene() {
  background(255);
  if (alphaCredit < 255) alphaCredit += 3;

  textAlign(CENTER, CENTER);
  textSize(38);
  fill(30, 30, 30, alphaCredit);
  text("Visualisasi Filosofi Batik", width / 2, height * 0.20);

  textSize(72);
  fill(0, 0, 0, alphaCredit);
  text("DAUN", width / 2, height * 0.38);

  stroke(0, alphaCredit);
  strokeWeight(1.5);
  line(width * 0.30, height * 0.52, width * 0.70, height * 0.52);
  noStroke();

  textSize(22);
  fill(60, 60, 60, alphaCredit);
  text("Muhammad Farhan H.A  24523115", width / 2, height * 0.62);
  text("Dafa Rizal R.  24523164", width / 2, height * 0.72);
  text("Sifa Aulia A.  24523164", width / 2, height * 0.82);
}

// --- Audio dan subtitle ---
// suara dan subtitle membantu penonton memahami makna dari setiap scene.
void triggerAudio(int waktu) {
  for (int i = 0; i < narrStart.length; i++) {
    if (!narrPlayed[i] && waktu >= narrStart[i]) {
      playNarr(narrFile[i]);
      narrPlayed[i] = true;
    }
  }
}

void playNarr(String filename) {
  stopAllNarration();
  for (int i = 0; i < narrFile.length; i++) {
    if (narrFile[i].equals(filename)) {
      narrSounds[i].play();
      break;
    }
  }
}

void stopAllNarration() {
  for (SoundFile sf : narrSounds) sf.stop();
}

void stopAllAudio() {
  stopAllNarration();
  if (bgm != null) bgm.stop();
}

void drawSubtitles(int waktu) {
  String subText = null;
  for (int i = narrStart.length - 1; i >= 0; i--) {
    if (waktu >= narrStart[i] && waktu < narrStart[i] + narrDur[i]) {
      subText = narrSub[i];
      break;
    }
  }

  if (subText == null) return;

  textSize(17);
  textAlign(CENTER, CENTER);
  noStroke();
  rectMode(CORNER);
  fill(0, 150);
  rect(width * 0.05, height * 0.75, width * 0.9, height * 0.2, 8);

  fill(255);
  text(subText, width * 0.1, height * 0.75, width * 0.8, height * 0.2);
}

// --- Matahari dan event listener ---
void drawSunBentukan(float cx, float cy, float r) {
  pushMatrix();
  translate(cx, cy);
  rotate(frameCount * 0.01);
  beginShape();
  int totalTitik = 24;
  for (int i = 0; i < totalTitik; i++) {
    float sudut = TWO_PI / totalTitik * i;
    float radiusSekarang = (i % 2 == 0) ? r : r * 1.25;
    float tx = cos(sudut) * radiusSekarang;
    float ty = sin(sudut) * radiusSekarang;
    vertex(tx, ty);
  }
  endShape(CLOSE);
  popMatrix();
}

void stop() {
  stopAllAudio();
  super.stop();
}

void mousePressed() {
  // klik mouse bisa memindahkan animasi ke scene berikutnya dengan cepat.
  if (mouseButton == LEFT) {
    int w = millis() + waktuOffset;
    resetAnimationState();

    int targetWaktu = -1;
    for (int wp : waypoints) {
      if (w < wp) {
        targetWaktu = wp;
        break;
      }
    }

    if (targetWaktu != -1) {
      waktuOffset += (targetWaktu - w);
      stopAllNarration();
      for (int i = 0; i < narrStart.length; i++) {
        narrPlayed[i] = (targetWaktu > narrStart[i]);
      }
    }
  }
}

void resetAnimationState() {
  alpha1 = 0;
  alpha2 = 0;
  alpha3 = 0;
  alpha32 = 0;
  alpha33 = 0;
  alphaMega = 0;
  alpha41 = 0;
  alpha42 = 0;
  alpha5 = 0;
  alpha52 = 0;
  alpha53 = 0;
  alpha54 = 0;
  alphaEnding1 = 0;
  alphaEnding2 = 0;
  alphaEnding3 = 0;
  alphaEnding4 = 0;
  alphaCredit = 0;
  zoom1 = 1.1;
}

// --- Kelas bantu visual ---
class KunangKunang {
  float startX, startY, xPos, yPos, ukuranGlow, ukuranInti, kecepatanKepak, offset;
  boolean diamDiTengah = false;

  KunangKunang() {
    startX = random(width);
    startY = random(height);
    ukuranInti = random(5, 12);
    ukuranGlow = ukuranInti * 4;
    kecepatanKepak = random(0.02, 0.08);
    offset = random(TWO_PI);
  }

  KunangKunang(float x, float y, float u) {
    startX = x;
    startY = y;
    ukuranInti = u;
    ukuranGlow = u * 4;
    kecepatanKepak = 0.05;
    offset = 0;
    diamDiTengah = true;
  }

  void update() {
    yPos = startY + sin(frameCount * kecepatanKepak + offset) * 20;
    if (!diamDiTengah) startX += random(-0.5, 0.5);
    xPos = startX;
  }

  void display(float gA, float iA) {
    noStroke();
    fill(255, 255, 50, gA);
    circleBentuk(xPos, yPos, ukuranGlow / 2);
    fill(255, 255, 150, iA);
    circleBentuk(xPos, yPos, ukuranInti / 2);
  }

  void circleBentuk(float x, float y, float r) {
    beginShape();
    for (float s = 0; s < TWO_PI; s += TWO_PI / 16) {
      vertex(x + cos(s) * r, y + sin(s) * r);
    }
    endShape(CLOSE);
  }
}

class AwanMegamendung {
  float x, y, w, h;

  AwanMegamendung(int index) {
    float s = random(0.2, 0.6);
    w = imgMegamendung.width * s;
    h = imgMegamendung.height * s;
    int k = index % 5;
    int b = index / 5;
    float jX = width / 5;
    float jY = height / 3;
    x = (k * jX) + (jX / 2) + random(-40, 40);
    y = (b * jY) + (jY / 2) + random(-30, 30);
  }

  void display() {
    image(imgMegamendung, x, y, w, h);
  }
}