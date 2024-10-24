void game() {
  background(green);
  handlePlayerInput();
  world.step();
  world.draw();
  for (int i = 0; i < 3; i++) {
    leftPlayers[i].setFillColor(red);
    rightPlayers[i].setFillColor(blue);
    float left_x = leftPlayers[i].getX();
    float left_y = leftPlayers[i].getY();
    float right_x = rightPlayers[i].getX();
    float right_y = rightPlayers[i].getY();
    push();
    strokeWeight(3);
    translate(left_x, left_y);
    rotate(leftPlayers[i].getRotation());
    line(0, 0, playerD/2, 0);
    pop();
    push();
    strokeWeight(3);
    translate(right_x, right_y);
    rotate(rightPlayers[i].getRotation());
    line(0, 0, playerD/2, 0);
    pop();
    textSize(10);
  }
  leftPlayers[leftControlling].setFillColor(lerpColor(red, white, 0.25));
  rightPlayers[rightControlling].setFillColor(lerpColor(blue, white, 0.25));
  drawScore();

  // win criteria: 10 goals
  if (blueScore >= 10 || redScore >= 10) {
    if (blueScore > redScore) {
      blueWins = true;
    } else {
      blueWins = false;
    }
    mode = WIN;
  }
}

void drawScore() {
  push();
  translate(width/2, 0);
  fill(255);
  rect(0, 0, 200, 100, 25);
  line(0, 0, 0, 50);
  textSize(25);
  fill(blue);
  text(blueScore, -50, 22);
  fill(red);
  text(redScore, 50, 22);
  pop();
}

void gameClicks() {
  mode = PAUSE;
}
