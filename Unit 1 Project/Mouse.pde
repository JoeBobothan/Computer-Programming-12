void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == WIN) {
    winClicks();
  }

  if (draggingBall) {
    draggingBall = false;
    //shotBall = true;
    PVector ballVec = new PVector((ballX - mouseX), (ballY - mouseY));
    ballVec.limit(100);
    ballV = new PVector(ballVec.x/5, ballVec.y/5);
  }
}

void mouseDragged() {
}

void mousePressed() {
  if (!shotBall && dist(ballX, ballY, mouseX, mouseY) < ballD/2) {
    draggingBall = true;
  }
}
