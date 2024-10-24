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
  if (keyCode == UP) upKey = false;
  if (keyCode == LEFT) leftKey = false;
  if (keyCode == DOWN) downKey = false;
  if (keyCode == RIGHT) rightKey = false;
  if (key == 'p' || key == 'P') nextRightPlayer();
}

void nextLeftPlayer() {
  leftControlling++;
  if (leftControlling == 3) leftControlling = 0;
}

void nextRightPlayer() {
  rightControlling++;
  if (rightControlling == 3) rightControlling = 0;
}
