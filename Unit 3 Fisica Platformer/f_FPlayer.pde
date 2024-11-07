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
    //setRestitution(0);
    //player.setDamping(5);
    player = p;
  }

  void act() {
    float vx = getVelocityX()*0.1;
    float vy = getVelocityY();
    float vxChange = 0;
    float vyChange = 0;
    //if (isTouchingWall(leftPlayer)) {
    //  vx = 0;  // Stop horizontal movement when touching the wall (adjust as needed)
    //}

    if (player == 0) {
      if (isOnGround(leftPlayer) && wKey) vyChange = 300;
      if (aKey && !isTouchingLeftWall(leftPlayer)) vxChange -= 300;
      if (sKey) vyChange = 250;
      if (dKey && !isTouchingRightWall(leftPlayer)) vxChange += 300;
      //if (isTouchingLeftWall(leftPlayer) || isTouchingRightWall(leftPlayer)) vx /= 2;
    } else if (player == 1) {
      if (isOnGround(rightPlayer) && upKey) vyChange = 300;
      if (leftKey) vxChange -= 300;
      if (downKey) vyChange = 250;
      if (rightKey) vxChange += 300;
    }
    setVelocity(vx + vxChange, vy + vyChange);
  }
}
