//setGrabbable(false)

void makePlayers() {
  //leftPlayer = makePlayer(red, width/2 - 500, height/2);
  //rightPlayer = makePlayer(blue, width/2 + 500, height/2);
  leftPlayer = new FPlayer();
  world.add(leftPlayer);
  rightPlayer = new FPlayer();
  world.add(rightPlayer);
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
