void game() {
  background(black);
  leftPlayer.act();
  rightPlayer.act();
  drawWorld();
  fill(white);
  textSize(25);
  if (dKey && wKey) text("a & w held", width/2, height/2);
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

void gameClicks() {
  mode = PAUSE;
}
