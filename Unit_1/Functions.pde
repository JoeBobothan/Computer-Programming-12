void drawHouse() {
   fill(50, 50, 200);
  rect(width/2, 200, 200, 150);
  fill(50, 200, 150);
  rect(550, 100, 35, 100);
  fill(200, 50, 50);
  triangle(int(width/2) - 50, 200, int(width/2) + 250, 200, int(width/2) + 100, 100);
  fill(200, 100, 50);
  rect(width/2 + 75, 260, 50, 90);
  fill(255);
  circle(width/2 + 37.5, 275, 40);
  triangle(537.5, 295, 587.5, 295, 562.5, 255);
}

void drawTree() {
  pushStyle();
  fill(200, 125, 50);
  rect(150, 200, 40, 150);
  fill(25, 225, 75);
  circle(170, 250, 90);
  circle(150, 205, 90);
  circle(190, 215, 90);
  circle(170, 170, 90);
  noStroke();
  circle(172, 235, 80);
  circle(169, 185, 85);
  popStyle();
}

void drawSun() {
  push();
  strokeWeight(2);
  fill(255, 255, 50);
  translate(width/2, 75);
  for (int i = 0; i < 12; i++) {
    rect(-2, 28, 4, 15);
    rotate(PI/6);
  }
  circle(0, 0, 50);
  pop();
}

void drawMoon() {
  push();
  noStroke();
  fill(255, 255, 125);
  translate(width/2, 75);
  circle(0, 0, 85);
  fill(sky);
  circle(-20, 0, 70);
  pop();
}
