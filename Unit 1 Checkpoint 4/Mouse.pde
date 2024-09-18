void mousePressed() {
  if (mouseButton == LEFT) {
    if (mouseX > 12.5 && mouseX < 37.5 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
      scrollLeft();
    }
    if (mouseX > width - 37.5 && mouseX < width - 12.5 && mouseY > height/2 - 25 && mouseY < height/2 + 25) {
      scrollRight();
    }
  }
}

void scrollLeft() {
  if (mode == p1) mode = p3;
  else if (mode == p2) mode = p1;
  else if (mode == p3) mode = p2;
}

void scrollRight() {
  if (mode == p1) mode = p2;
  else if (mode == p2) mode = p3;
  else if (mode == p3) mode = p1;
}
