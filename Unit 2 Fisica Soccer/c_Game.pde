void game() {
  background(green);
  handlePlayerInput();
  world.step();
  world.draw();
  float left_x = leftPlayer.getX();
  float left_y = leftPlayer.getY();
  float right_x = rightPlayer.getX();
  float right_y = rightPlayer.getY();
  push();
  strokeWeight(3);
  translate(left_x, left_y);
  rotate(leftPlayer.getRotation());
  line(0, 0, 24, 0);
  pop();
  push();
  strokeWeight(3);
  translate(right_x, right_y);
  rotate(rightPlayer.getRotation());
  line(0, 0, 24, 0);
  pop();
  textSize(10);
  //text(str(left_x) + "   " + str(left_y), left_x, left_y - 50);
  //if (wKey) text("w held", mouseX, mouseY-25);
  //if (aKey) text("a held", mouseX-35, mouseY-10);
  //if (sKey) text("s held", mouseX, mouseY-10);
  //if (dKey) text("d held", mouseX+35, mouseY-10);

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
