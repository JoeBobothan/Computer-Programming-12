void game() {
  background(cyan);
  if (qKey) {
    player.setPosition(16, 200);
    player.setVelocity(0, 0);
  }
  player.act();
  for (FGameObject b : terrain) {
    b.act();
  }
  drawWorld();
}

void drawWorld() {
  push();
  if (cameraFollow) {
    //translate(int(width/2 - player.getX()*zoom), int(height/2 - player.getY()*zoom));
    if (zoomOut && !zoomIn) zoom *= 0.99;
    if (zoomIn && !zoomOut) zoom *= 1.01;
    scale(zoom);

    translate(int(width/2/zoom - player.getX()), int(height/2/zoom - player.getY()));
  }
  world.step();
  world.draw();
  pop();

  fill(black);
  if (spaceKey) text("Air Jumps: ∞", player.getX(), player.getY() - 10);
  else text("Air Jumps: " + player.doubleJumps, player.getX(), player.getY() - 10);
  text("Health: " + player.health, player.getX(), player.getY() + 10);
  text(frameRate, player.getX(), player.getY() + 20);
}

void gameClicks() {
  //mode = PAUSE;
}
