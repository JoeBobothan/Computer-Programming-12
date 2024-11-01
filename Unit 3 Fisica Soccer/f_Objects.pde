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
  ball.setDamping(2.5);
  world.add(ball);
}

void netVertices() {
  leftNetVertices.add(new PVector(-75, -250));
  leftNetVertices.add(new PVector(75, -250));
  leftNetVertices.add(new PVector(75, -225));
  leftNetVertices.add(new PVector(-50, -225));
  leftNetVertices.add(new PVector(-50, 225));
  leftNetVertices.add(new PVector(75, 225));
  leftNetVertices.add(new PVector(75, 250));
  leftNetVertices.add(new PVector(-75, 250));
  rightNetVertices.add(new PVector(75, -250));
  rightNetVertices.add(new PVector(-75, -250));
  rightNetVertices.add(new PVector(-75, -225));
  rightNetVertices.add(new PVector(50, -225));
  rightNetVertices.add(new PVector(50, 225));
  rightNetVertices.add(new PVector(-75, 225));
  rightNetVertices.add(new PVector(-75, 250));
  rightNetVertices.add(new PVector(75, 250));
}

void verticesWH() {
  for (PVector c : leftNetVertices) {
    if (c.x > leftMaxX) leftMaxX = c.x;
    if (c.x < leftMinX) leftMinX = c.x;
    if (c.y > leftMaxY) leftMaxY = c.y;
    if (c.y < leftMinY) leftMinY = c.y;
  }
  for (PVector c : rightNetVertices) {
    if (c.x > rightMaxX) rightMaxX = c.x;
    if (c.x < rightMinX) rightMinX = c.x;
    if (c.y > rightMaxY) rightMaxY = c.y;
    if (c.y < rightMinY) rightMinY = c.y;
  }
}
