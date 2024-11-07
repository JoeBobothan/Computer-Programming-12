void game() {
  background(black);
  leftPlayer.act();
  drawWorld();
  //fill(white, 153);
  //square(width/2, height/2, gridSize*zoom);
}

void drawWorld() {
  push();
  translate(width/2, height/2);
  if (zoomOut && !zoomIn) zoom *= 0.99;
  if (zoomIn && !zoomOut) zoom *= 1.01;
  scale(zoom);
  world.step();
  translate(-leftPlayer.getX(), -leftPlayer.getY());
  world.draw();
  pop();
}

void gameClicks() {
  mode = PAUSE;
}
