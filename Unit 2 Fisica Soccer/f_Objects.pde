//setGrabbable(false)

void makePlayers() {
  leftPlayer = new FCircle(48);

  leftPlayer.setPosition(width/2 - 500, height/2);
  leftPlayer.setFillColor(red);
  //leftPlayer.setNoStroke();
  leftPlayer.setDensity(10);
  leftPlayer.setFriction(10);
  leftPlayer.setRestitution(0);
  leftPlayer.setDamping(5);
  leftPlayer.setRotatable(false);
  world.add(leftPlayer);

  rightPlayer = new FCircle(48);

  rightPlayer.setPosition(width/2 + 500, height/2);
  rightPlayer.setFillColor(blue);
  //rightPlayer.setNoStroke();
  rightPlayer.setDensity(10);
  rightPlayer.setFriction(10);
  rightPlayer.setRestitution(0);
  rightPlayer.setDamping(5);
  rightPlayer.setRotatable(false);
  rightPlayer.setRotation(PI);
  world.add(rightPlayer);
}

void makeNets() {
  leftNet = new FPoly();
  leftNet.vertex(-75, -250);
  leftNet.vertex(75, -250);
  leftNet.vertex(75, -225);
  leftNet.vertex(-50, -225);
  leftNet.vertex(-50, 225);
  leftNet.vertex(75, 225);
  leftNet.vertex(75, 250);
  leftNet.vertex(-75, 250);
  leftNet.setPosition(width/2 - 850, height/2);
  leftNet.setFillColor(white);
  leftNet.setNoStroke();
  leftNet.setStatic(true);
  leftNet.setFriction(1);
  leftNet.setRestitution(0);
  world.add(leftNet);

  rightNet = new FPoly();
  rightNet.vertex(75, -250);
  rightNet.vertex(-75, -250);
  rightNet.vertex(-75, -225);
  rightNet.vertex(50, -225);
  rightNet.vertex(50, 225);
  rightNet.vertex(-75, 225);
  rightNet.vertex(-75, 250);
  rightNet.vertex(75, 250);
  rightNet.setPosition(width/2 + 850, height/2);
  rightNet.setFillColor(white);
  rightNet.setNoStroke();
  rightNet.setStatic(true);
  rightNet.setFriction(1);
  rightNet.setRestitution(0);
  world.add(rightNet);
}

void makeBall() {
  ball = new FCircle(24);
  ball.setPosition(width/2, height/2);
  ball.setRestitution(1);
  world.add(ball);
}
