void drawFlower(float x, float y, int p, color c, float s) {
  push();
  translate(x, y);
  scale(s);
  drawPetals(p, c);
  pop();
}

void drawPetals(int p, color c) {
  push();
  fill(c);
  for (int i = 0; i < p; i++) {
    beginShape();
    vertex(-15, -10);
    vertex(-15, -10);
    vertex(-18, -15);
    vertex(-23, -30);
    vertex(-25, -40);
    vertex(-27, -55);
    vertex(-25, -65);
    vertex(-19, -80);
    vertex(-14, -90);
    vertex(-9, -100);
    vertex(-5, -110);
    vertex(-2, -120);
    vertex(-1, -125);
    vertex(0, -130);
    vertex(1, -125);
    vertex(2, -120);
    vertex(5, -110);
    vertex(9, -100);
    vertex(14, -90);
    vertex(19, -80);
    vertex(25, -65);
    vertex(27, -55);
    vertex(25, -40);
    vertex(23, -30);
    vertex(18, -15);
    vertex(15, -10);
    vertex(-15, -10);
    vertex(-15, -10);
    endShape();
    rotate(2*PI/p);
  }
  fill(red(c)/2, green(c)/2, blue(c)/2);
  circle(0, 0, 40);
  pop();
}
