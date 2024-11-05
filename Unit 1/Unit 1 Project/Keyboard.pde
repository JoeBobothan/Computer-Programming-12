void keyPressed() {
  if (hints) {
    if (key == '0') {
      map = -1;
      nextMap();
    } else if (key == '1') {
      map = 0;
      nextMap();
    } else if (key == '2') {
      map = 1;
      nextMap();
    } else if (key == '3') {
      map = 2;
      nextMap();
    } else if (key == '4') {
      map = 3;
      nextMap();
    } else if (key == '5') {
      map = 4;
      nextMap();
    } else if (key == '6') {
      map = 5;
      nextMap();
    } else if (key == '7') {
      map = 6;
      nextMap();
    } else if (key == '8') {
      map = 7;
      nextMap();
    } else if (key == '9') {
      map = 8;
      nextMap();
    }
    if (key == 'n' || key == 'N') nextMap();
    if (key == 'b' || key == 'B') {
      ballV.setMag(0);
      ballX = mouseX;
      ballY = mouseY;
    }
    if (key == 'l' || key == 'L') {
      ballX = 125 + ballD/2;
      ballY = height/2;
      ballV = new PVector(500-ballD, -750+ballD);
      ballV.setMag(10);
    }
    if (key == 'r' || key == 'R') {
      ballV.setMag(0);
      ballX = width/2;
      ballY = 800;
    }
  }
  if (key == 'h') {
    hints = true;
  }
}

void keyReleased() {
  hints = false;
}
