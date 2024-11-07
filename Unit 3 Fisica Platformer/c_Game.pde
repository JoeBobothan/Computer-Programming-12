void game() {
  background(black);
  leftPlayer.act();
  //rightPlayer.act();
  drawWorld();
  //fill(white, 153);
  //square(width/2, height/2, gridSize*zoom);
}

void drawWorld() {
  push();
  translate(width/2, height/2);
  scale(zoom);
  world.step();
  translate(-leftPlayer.getX(), -leftPlayer.getY());
  world.draw();
  pop();
}

void gameClicks() {
  mode = PAUSE;
}
