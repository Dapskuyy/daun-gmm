// Modul visual motif Parang
// Menyusun elemen motif secara berulang dengan efek dinamis

void drawSceneParang() {
  pushMatrix();
  translate(width * 0.5, height * 0.5);

  for (int i = 0; i < 6; i++) {
    pushMatrix();
    translate(i * 80 - 240, 0);
    drawMotifParang(0, 0, 120);
    popMatrix();
  }

  popMatrix();
}

void drawMotifParang(float x, float y, float size) {
  noFill();
  stroke(95, 55, 30);
  strokeWeight(2);

  for (int i = 0; i < 5; i++) {
    pushMatrix();
    translate(x, y);
    rotate(radians(-20 + i * 10));
    line(0, -size * 0.5, 0, size * 0.5);
    popMatrix();
  }

  line(x - size * 0.4, y - size * 0.2, x + size * 0.4, y + size * 0.2);
  line(x - size * 0.4, y + size * 0.2, x + size * 0.4, y - size * 0.2);
}
