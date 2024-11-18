void game() {
  background(black);
  if (qKey) {
    player.setPosition(200, 200);
    player.setVelocity(0, 0);
  }
  for (int x = 0; x < 8; x++) {
    for (int y = 0; y < 8; y++) {
      for (FBox b : gridTiles[x][y]) {
        b.setFillColor(white);
      }
    }
  }
  player.act();
  drawWorld();
  //fill(white, 153);
  //square(width/2, height/2, gridSize*zoom);
}

void drawWorld() {
  push();
  if (cameraFollow) {
    translate(width/2, height/2);
    if (zoomOut && !zoomIn) zoom *= 0.99;
    if (zoomIn && !zoomOut) zoom *= 1.01;
    scale(zoom);
  }
  world.step();
  if (cameraFollow) translate(-player.getX(), -player.getY());
  world.draw();

  if (drawGrid) {
    stroke(brown);
    strokeWeight(5);
    for (int i = 0; i < 8; i++) {
      line(1024*i/8, 0, 1024*i/8, 1024);
    }
    for (int j = 0; j < 8; j++) {
      line(0, 1024*j/8, 1024, 1024*j/8);
    }
  }
  pop();
  fill(white);
  if (spaceKey) text("Air Jumps: ∞", player.getX(), player.getY());
  else text("Air Jumps: " + doubleJumps, player.getX(), player.getY());
}

void gameClicks() {
  //mode = PAUSE;
}
