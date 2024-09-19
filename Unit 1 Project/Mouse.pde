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
    PVector ballVec = new PVector((ballX - mouseX), (ballY - mouseY));
    ballVec.limit(150);
    ballV = new PVector(ballVec.x/5, ballVec.y/5);
    // change ball velocities by vx = (ballx - mousex)/12
  }
}

void mouseDragged() {
}

void mousePressed() {
  if (dist(ballX, ballY, mouseX, mouseY) < ballD/2) {
    draggingBall = true;
  }
}
