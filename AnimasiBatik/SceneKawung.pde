// Modul visual motif Kawung
// Menggunakan transformasi geometri untuk mengulang motif secara rapi

void drawSceneKawung() {
  pushMatrix();
  translate(width * 0.3, height * 0.5);
  scale(1.15);

  for (int i = 0; i < 4; i++) {
    pushMatrix();
    rotate(radians(i * 90 + frameCount * 0.2));
    drawMotifKawung(0, 0, 140);
    popMatrix();
  }

  popMatrix();
}

void drawMotifKawung(float x, float y, float size) {
  noFill();
  stroke(120, 72, 40);
  strokeWeight(3);

  ellipse(x, y, size, size);
  line(x - size * 0.3, y, x + size * 0.3, y);
  line(x, y - size * 0.3, x, y + size * 0.3);

  for (int i = 0; i < 4; i++) {
    pushMatrix();
    translate(x, y);
    rotate(radians(i * 90));
    line(0, 0, size * 0.22, size * 0.22);
    popMatrix();
  }
}
