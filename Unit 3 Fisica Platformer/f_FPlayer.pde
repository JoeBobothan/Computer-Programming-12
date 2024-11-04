////setGrabbable(false)

//void makePlayers() {
//  leftPlayer = makePlayer(red, width/2 - 500, height/2);
//  rightPlayer = makePlayer(blue, width/2 + 500, height/2);
//}

//FCircle makePlayer(color c, float x, float y) {
//  FCircle player = new FCircle(playerD);
//  player.setPosition(x, y);
//  player.setFillColor(c);
//  //player.setNoStroke();
//  player.setDensity(10);
//  player.setFriction(0.1);
//  player.setRestitution(0);
//  player.setDamping(5);
//  player.setRotatable(false);
//  if (c == blue) player.setRotation(PI);
//  world.add(player);
//  return player;
//}

class FPlayer extends FBox {

  FPlayer() {
    super(gridSize, gridSize);
    setPosition(200, 200);
    setFillColor(red);
    setRotatable(false);
  }

  void act() {
    float vx = getVelocityX();
    float vy = getVelocityY();
    //if (isTouching(leftPlayer, leftPlatform) && wKey) leftPlayer.setVelocity(left_vx, -750);
    if (aKey && !dKey) leftPlayer.setVelocity(vx*0.1-450, vy);
    if (sKey) leftPlayer.setVelocity(vx, 500);
    if (dKey && !aKey) leftPlayer.setVelocity(vx*0.1+450, vy);
  }
}
