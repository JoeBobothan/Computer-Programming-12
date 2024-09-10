void drawFlower(float x, float y, int p, color c, float s, boolean useStroke) {
  push();
  translate(x, y);
  scale(s);
  fill(50, 200, 50);
  rect(-10, 0, 20, 200);
  drawPetals(p, c, useStroke);
  pop();
}

void drawPetals(int p, color c, boolean useStroke) {
  push();
  if (p % 2 == 0) rotate(PI/p);
  fill(c);
  if (useStroke) stroke(night);
  if (!useStroke) noStroke();
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
  if (!useStroke) {
    rotate(PI/p);
    stroke(night);
    for (int i = 0; i < p; i++) {
      line(0, 0, 0, -24*pow(p, 0.5));
      rotate(2*PI/p);
    }
  }
  fill(200, 200, 50);
  circle(0, 0, 60);
  pop();
}
