void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == WIN) {
    winClicks();
  }
}

void mousePressed() {
  if (!shotBall && dist(ballX, ballY, mouseX, mouseY) < ballD/2) {
    draggingBall = true;
  }
}
