void keyPressed() {
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 's' || key == 'S') sKey = true;
  if (key == 'd' || key == 'D') dKey = true;
  if (keyCode == UP) upKey = true;
  if (keyCode == LEFT) leftKey = true;
  if (keyCode == DOWN) downKey = true;
  if (keyCode == RIGHT) rightKey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 'a' || key == 'A') aKey = false;
  if (key == 's' || key == 'S') sKey = false;
  if (key == 'd' || key == 'D') dKey = false;
  if (key == 'q' || key == 'Q') nextLeftPlayer();
  if ((key == 'e' || key == 'E') && hasBall("left")) kickBall(1);
  if (keyCode == UP) upKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (key == 'i' || key == 'I') nextRightPlayer();
  if ((key == 'p' || key == 'P') && hasBall("right")) kickBall(1);
}

void nextLeftPlayer() {
  leftControlling++;
  if (leftControlling == 3) leftControlling = 0;
}

void nextRightPlayer() {
  rightControlling++;
  if (rightControlling == 3) rightControlling = 0;
}

boolean hasBall(String side) {
  if (side == "left") {
    for (FBody l : leftPlayers) {
      if (hasBall == l) return true;
    }
  } else if (side == "right") {
    for (FBody r : rightPlayers) {
      if (hasBall == r) return true;
    }
  }
  return false;
}
