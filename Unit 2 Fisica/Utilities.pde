void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}

void mousePressed() {

  for (int j = -2; j < 3; j++) {
    for (int i = -2; i < 3; i++) {
      makeBird(mouseX+(48*i), mouseY+(48*j));
    }
  }
}
