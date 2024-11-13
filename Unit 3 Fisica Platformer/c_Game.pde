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
  //fill(white, 153);
  //square(width/2, height/2, gridSize*zoom);
}

void drawWorld() {
  world.step();
  world.draw();
  //stroke(brown);
  //strokeWeight(5);
  //for (int i = 0; i < 8; i++) {
  //  line(1024*i/8, 0, 1024*i/8, 1024);
  //}
  //for (int j = 0; j < 8; j++) {
  //  line(0, 1024*j/8, 1024, 1024*j/8);
  //}
  
  //push();
  //translate(width/2, height/2);
  //if (zoomOut && !zoomIn) zoom *= 0.99;
  //if (zoomIn && !zoomOut) zoom *= 1.01;
  //scale(zoom);
  //world.step();
  //translate(-leftPlayer.getX(), -leftPlayer.getY());
  //world.draw();
  //image(terrain, width/2, height/2);
  //stroke(brown);
  //strokeWeight(5);
  //for (int i = 0; i < 8; i++) {
  //  line(1024*i/8, 0, 1024*i/8, 1024);
  //}
  //for (int j = 0; j < 8; j++) {
  //  line(0, 1024*j/8, 1024, 1024*j/8);
  //}
  //pop();
}

void gameClicks() {
  //mode = PAUSE;
}
