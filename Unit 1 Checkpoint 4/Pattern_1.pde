void pattern1() {
  for (int i=0; i<ceil(width/80f); i++) {
    for (int j=0; j<ceil(height/80f); j++) {
      full(0+80*i, 0+80*j);
    }
  }
}

void full(float x, float y) {
  push();
  translate(x, y);
  topHalf();
  translate(80, 80);
  rotate(PI);
  topHalf();
  pop();
}

void topHalf() {
  fill(B1);
  triangle(0, 40, 10, 40, 10, 30);
  triangle(30, 20, 40, 20, 40, 30);
  triangle(40, 0, 40, 10, 50, 10);
  triangle(50, 40, 60, 40, 60, 30);
  fill(B2);
  square(0, 0, 10);
  triangle(10, 0, 20, 10, 30, 0);
  triangle(0, 10, 10, 20, 0, 30);
  beginShape();
  vertex(20, 10);
  vertex(30, 10);
  vertex(30, 30);
  vertex(10, 30);
  vertex(10, 20);
  vertex(20, 20);
  vertex(20, 10);
  endShape();
  square(40, 30, 10);
  triangle(50, 0, 60, 10, 70, 0);
  triangle(80, 10, 70, 20, 80, 30);
  beginShape();
  vertex(50, 10);
  vertex(70, 10);
  vertex(70, 30);
  vertex(60, 30);
  vertex(60, 20);
  vertex(50, 20);
  vertex(50, 10);
  endShape();
  fill(B3);
  beginShape();
  vertex(0, 10);
  vertex(10, 10);
  vertex(20, 20);
  vertex(10, 20);
  endShape();
  beginShape();
  vertex(0, 30);
  vertex(0, 40);
  vertex(10, 30);
  vertex(10, 20);
  endShape();
  beginShape();
  vertex(10, 30);
  vertex(20, 40);
  vertex(40, 40);
  vertex(30, 30);
  endShape();
  for (int i=0; i<3; i++) {
    beginShape();
    vertex(30+10*i, 0+10*i);
    vertex(40+10*i, 0+10*i);
    vertex(30+10*i, 10+10*i);
    vertex(20+10*i, 10+10*i);
    endShape();
  }
  beginShape();
  vertex(60, 30);
  vertex(70, 30);
  vertex(80, 40);
  vertex(70, 40);
  endShape();
  beginShape();
  vertex(60, 10);
  vertex(70, 10);
  vertex(80, 0);
  vertex(70, 0);
  endShape();
  fill(B4);
  beginShape();
  vertex(10, 0);
  vertex(20, 10);
  vertex(20, 20);
  vertex(10, 10);
  endShape();
  for (int i=0; i<3; i++) {
    beginShape();
    vertex(30+10*i, 10+10*i);
    vertex(40+10*i, 0+10*i);
    vertex(40+10*i, 10+10*i);
    vertex(30+10*i, 20+10*i);
    endShape();
  }
  beginShape();
  vertex(30, 20);
  vertex(40, 30);
  vertex(40, 40);
  vertex(30, 30);
  endShape();
  beginShape();
  vertex(40, 0);
  vertex(50, 0);
  vertex(60, 10);
  vertex(50, 10);
  endShape();
  beginShape();
  vertex(70, 10);
  vertex(80, 0);
  vertex(80, 10);
  vertex(70, 20);
  endShape();
  beginShape();
  vertex(70, 20);
  vertex(80, 30);
  vertex(80, 40);
  vertex(70, 30);
  endShape();
  triangle(10, 30, 20, 40, 10, 40);
  triangle(60, 30, 70, 40, 60, 40);
}
