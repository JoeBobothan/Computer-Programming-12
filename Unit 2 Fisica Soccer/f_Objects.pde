//setGrabbable(false)

void makePlayers() {
  leftPlayers[0] = makePlayer(red, width/2 - 500, height/2);
  leftPlayers[1] = makePlayer(red, width/2 - 750, height/2 - 75);
  leftPlayers[2] = makePlayer(red, width/2 - 750, height/2 + 75);
  rightPlayers[0] = makePlayer(blue, width/2 + 500, height/2);
  rightPlayers[1] = makePlayer(blue, width/2 + 750, height/2 - 75);
  rightPlayers[2] = makePlayer(blue, width/2 + 750, height/2 + 75);
}

FCircle makePlayer(color c, float x, float y) {
  FCircle player = new FCircle(playerD);
  player.setPosition(x, y);
  player.setFillColor(c);
  //player.setNoStroke();
  player.setDensity(10);
  player.setFriction(0.1);
  player.setRestitution(0);
  player.setDamping(5);
  player.setRotatable(false);
  if (c == blue) player.setRotation(PI);
  world.add(player);
  return player;
}

void makeNets() {
  leftNet = new FPoly();
  for (PVector v : leftNetVertices) {
    leftNet.vertex(v.x, v.y);
  }
  //leftNet.vertex(-75, -250);
  //leftNet.vertex(75, -250);
  //leftNet.vertex(75, -225);
  //leftNet.vertex(-50, -225);
  //leftNet.vertex(-50, 225);
  //leftNet.vertex(75, 225);
  //leftNet.vertex(75, 250);
  //leftNet.vertex(-75, 250);
  leftNet.setPosition(width/2 - 850, height/2);
  leftNet.setFillColor(white);
  leftNet.setNoStroke();
  leftNet.setStatic(true);
  leftNet.setFriction(1);
  leftNet.setRestitution(0);
  world.add(leftNet);

  rightNet = new FPoly();
  for (PVector v : rightNetVertices) {
    rightNet.vertex(v.x, v.y);
  }
  //rightNet.vertex(75, -250);
  //rightNet.vertex(-75, -250);
  //rightNet.vertex(-75, -225);
  //rightNet.vertex(50, -225);
  //rightNet.vertex(50, 225);
  //rightNet.vertex(-75, 225);
  //rightNet.vertex(-75, 250);
  //rightNet.vertex(75, 250);
  rightNet.setPosition(width/2 + 850, height/2);
  rightNet.setFillColor(white);
  rightNet.setNoStroke();
  rightNet.setStatic(true);
  rightNet.setFriction(1);
  rightNet.setRestitution(0);
  world.add(rightNet);
}

void makeBall() {
  ball = new FCircle(ballD);
  ball.setPosition(width/2, height/2);
  ball.setRestitution(1);
  world.add(ball);
}
