// Connor Tsoi
// Computer Programming 12
// Block 1-4
// September 18, 2024

int mode;
final int p1 = 0;
final int p2 = 1;
final int p3 = 2;

color B1 = color(34, 52, 110);
color B2 = color(16, 86, 137);
color B3 = color(39, 118, 187);
color B4 = color(122, 175, 223);

color Y1 = color(150, 100, 50);
color Y2 = color(255, 255, 100);
color Y3 = color(205, 150, 50);
color Y4 = color(100, 50, 0);

float h = 15*sqrt(3);

color Red = color(232, 61, 91);
color Yellow = color(233, 231, 61);
color Green = color(61, 232, 81);
color Purple = color(153, 51, 255);

void setup() {
  size(800, 450);
  noStroke();
}

void draw() {
  push();
  if (mode == p1) {
    pattern1();
  } else if (mode == p2) {
    pattern2();
  } else if (mode == p3) {
    pattern3();
  } else {
    println("Invalid mode");
    noLoop();
  }
  pop();
  push();
  rectMode(CENTER);
  fill(102, 128);
  if (mouseX > 12.5 && mouseX < 37.5 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
    fill(102, 204);
  }
  rect(25, height/2, 25, 50, 5);
  fill(102, 128);
  if (mouseX > width - 37.5 && mouseX < width - 12.5 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
    fill(102, 204);
  }
  rect(width - 25, height/2, 25, 50, 5);
  fill(255, 128);
  triangle(18, height/2, 32, height/2 - 7, 32, height/2 + 7);
  triangle(width - 18, height/2, width - 32, height/2 - 7, width - 32, height/2 + 7);
  pop();
}
