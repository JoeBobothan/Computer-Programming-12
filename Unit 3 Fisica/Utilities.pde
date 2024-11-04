void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && !mousePressed) {
    mouseReleased = true;
    wasPressed = false;
  }
}

void mousePressed() {
  if (hToggle == true) {
    if (mouseButton == LEFT) {
      for (int j = -2; j < 3; j++) {
        for (int i = -2; i < 3; i++) {
          makeBird(mouseX+(50*i), mouseY+(50*j));
        }
      }
    }
    if (mouseButton == RIGHT) makeBlob(mouseX, mouseY);
    if (mouseButton == CENTER) for (int i = 0; i < 25; i++) makeBird(mouseX+random(-5, 5), mouseY+random(-5, 5));
  }
}

void keyPressed() {
  if (key == 'h' || key == 'H') hToggle = !hToggle;
  if (key == '1') bucketSetting = 1;
}

void keyReleased() {
}
