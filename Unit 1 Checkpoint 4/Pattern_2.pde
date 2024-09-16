void pattern2() {
  background(Y4);
  for (int i=0; i<5; i++) {
    for (int j=0; j<5; j++) {
      node((400-16*h)+(8*h)*i, 0+120*j);
    }
  }
  for (int i=0; i<4; i++) {
    for (int j=0; j<4; j++) {
      node((400-12*h)+(8*h)*i, 60+120*j);
    }
  }
}

void node(float x, float y) {
  push();
  translate(x, y);
  fill(Y1);
  nodePart();
  rotate(2*PI/3);
  fill(Y2);
  nodePart();
  rotate(2*PI/3);
  fill(Y3);
  nodePart();
  rotate(2*PI/3);
  pop();
}

void nodePart() {
  beginShape();
  vertex(0, 0);
  vertex(0, -90);
  vertex(-h, -75);
  vertex(-h, -15);
  vertex(-3*h, 15);
  vertex(-3*h, 45);
  endShape();
}
