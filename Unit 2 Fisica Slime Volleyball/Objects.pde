
void makeFloor() {
  leftPlatform = new FBox(width/2, 100);
  leftPlatform.setPosition(width/4, 700);
  leftPlatform.setStatic(true);
  leftPlatform.setFillColor(red);
  leftPlatform.setNoStroke();
  leftPlatform.setFriction(0);
  world.add(leftPlatform);

  rightPlatform = new FBox(width/2, 100);
  rightPlatform.setPosition(width*3/4, 700);
  rightPlatform.setStatic(true);
  rightPlatform.setFillColor(blue);
  rightPlatform.setNoStroke();
  rightPlatform.setFriction(0);
  world.add(rightPlatform);
}

void makePlayers() {
  leftPlayer = new FBox(100, 100);
  leftPlayer.setPosition(width/4, 599);
  leftPlayer.setFillColor(red);
  leftPlayer.setNoStroke();
  leftPlayer.setDensity(10);
  leftPlayer.setFriction(0.1);
  leftPlayer.setRestitution(0.25);
  world.add(leftPlayer);

  rightPlayer = new FBox(100, 100);
  rightPlayer.setPosition(width*3/4, 599);
  rightPlayer.setFillColor(blue);
  rightPlayer.setNoStroke();
  rightPlayer.setDensity(10);
  rightPlayer.setFriction(0.1);
  rightPlayer.setRestitution(0.25);
  world.add(rightPlayer);
}

void makeNet() {
  net = new FBox(20, 200);
  net.setPosition(width/2, 549);
  net.setFillColor(white);
  net.setNoStroke();
  net.setStatic(true);
  net.setFriction(0);
  world.add(net);
}

void makeBall() {
  ball = new FCircle(48);
  ball.setPosition(width/2, 0);
  ball.setRestitution(1);
  world.add(ball);
}
