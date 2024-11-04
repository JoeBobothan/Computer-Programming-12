void game() {
  background(black);
  handlePlayerInput();
  drawWorld();
  leftPlayer.act();

  // win criteria: 10 goals
  if (blueScore >= 2 || redScore >= 2) {
    if (blueScore > redScore) {
      blueWins = true;
    } else {
      blueWins = false;
    }
    mode = WIN;
  }
}

void drawWorld() {
  pushMatrix();
  translate(width/2, height/2);
  scale(zoom);
  translate(-leftPlayer.getX(), -leftPlayer.getY());
  world.step();
  world.draw();
  popMatrix();
}

void drawScore() {
  push();
  translate(width/2, 0);
  fill(255);
  rect(0, 0, 200, 100, 25);
  line(0, 0, 0, 50);
  textSize(25);
  fill(red);
  text(redScore, -50, 22);
  fill(blue);
  text(blueScore, 50, 22);
  pop();
}

void gameClicks() {
  mode = PAUSE;
}
