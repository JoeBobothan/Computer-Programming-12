void game() {
  background(cyan);
  player.act();
  for (FGameObject b : terrain) {
    b.act();
  }
  for (FBridge f : fallingBridge) {
    f.slowFall(0.25);
  }
  drawWorld();
}

void drawWorld() {
  push();
  if (cameraFollow) {
    if (zoomOut && !zoomIn) zoom *= 0.99;
    if (zoomIn && !zoomOut) zoom *= 1.01;
    scale(zoom);
    translate(width/2/zoom - player.getX(), height/2/zoom - player.getY());
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
