// File utama proyek animasi batik
// Menggabungkan scene Kawung dan Parang secara bergantian berdasarkan waktu

int currentScene = 0;
PImage karakter;

void setup() {
  size(1280, 720);
  frameRate(60);
  karakter = loadImage("data/karakter.png");
}

void draw() {
  background(245, 232, 202);

  if (millis() > 5000) {
    currentScene = 1;
  }

  if (currentScene == 0) {
    drawSceneKawung();
  } else {
    drawSceneParang();
  }

  if (karakter != null) {
    image(karakter, width * 0.74, height * 0.58, 180, 240);
  }
}
