//setGrabbable(false)

class FPlayer extends FBox {
  int player;

  FPlayer(int p) {
    super(gridSize, gridSize);
    setPosition(200, 200);
    setFillColor(red);
    setRotatable(false);
    ////player.setNoStroke();
    //player.setDensity(10);
    //player.setFriction(0.1);
    //player.setRestitution(0);
    //player.setDamping(5);
    player = p;
  }

  void act() {
    if (player == 0) {
      float vx = getVelocityX();
      float vy = getVelocityY();
      if (isOnGround(leftPlayer) && wKey) leftPlayer.setVelocity(vx, -500);
      if (aKey && !dKey) leftPlayer.setVelocity(vx*0.1-450, vy);
      if (sKey) leftPlayer.setVelocity(vx, 500);
      if (dKey && !aKey) leftPlayer.setVelocity(vx*0.1+450, vy);
    } else if (player == 1) {
      float right_vx = rightPlayer.getVelocityX();
      float right_vy = rightPlayer.getVelocityY();
      if (isOnGround(rightPlayer) && upKey) rightPlayer.setVelocity(right_vx, -500);
      if (leftKey) rightPlayer.setVelocity(right_vx*0.1-450, right_vy);
      if (downKey) rightPlayer.setVelocity(right_vx, 500);
      if (rightKey) rightPlayer.setVelocity(right_vx*0.1+450, right_vy);
    }
  }
}
