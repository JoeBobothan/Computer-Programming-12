void game() {
  background(black);
  for (int x = 0; x < 8; x++) {
    for (int y = 0; y < 8; y++) {
      for (FBox b : gridTiles[x][y]) {
        b.setFillColor(white);
      }
    }
  }
  leftPlayer.act();
  drawWorld();
  push();
  stroke(brown);
  strokeWeight(5);
  for (int i = 0; i < 7; i++) {
    line(1024*i/7, 0, 1024*i/7, 1024);
  }
  for (int j = 0; j < 7; j++) {
    line(0, 1024*j/7, 1024, 1024*j/7);
  }
  fill(white);
  int gridX = int(map(leftPlayer.getX(), 0, 1024, 0, 7));
  int gridY = int(map(leftPlayer.getY(), 0, 1024, 0, 7));
  text(gridX + ", " + gridY, mouseX, mouseY);
  pop();
  //fill(white, 153);
  //square(width/2, height/2, gridSize*zoom);
}

void drawWorld() {
  //push();
  //translate(width/2, height/2);
  if (zoomOut && !zoomIn) zoom *= 0.99;
  if (zoomIn && !zoomOut) zoom *= 1.01;
  //scale(zoom);
  world.step();
  //translate(-leftPlayer.getX(), -leftPlayer.getY());
  world.draw();
  //pop();
}

void gameClicks() {
  //mode = PAUSE;
}
