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
    

    if (player == 0) {
      textSize(12);
      if (checkForGround(leftPlayer));
      //if (sKey) vyChange = 250;
      if (isOnGround(leftPlayer)) setFillColor(green);
      else setFillColor(red);
      if (isTouchingLeftWall(leftPlayer)) text("touching left wall", width/2, height/2 - 50);

      fill(red, 102);
      int gridX = int(map(leftPlayer.getX(), 0, 1024, 0, 8));
      int gridY = int(map(leftPlayer.getY(), 0, 1024, 0, 8));
      
      //square(1024/8, gridX/8*1024, gridY/8*1024);
      if (isOnGround(leftPlayer) && wKey) vyChange = 30000;
      if (aKey && !isTouchingLeftWall(leftPlayer)) {
        vxChange -= 300;
      }
      if (dKey && !isTouchingRightWall(leftPlayer)) {
        vxChange += 300;
      }
    }
    setVelocity(vx + vxChange, vy + vyChange);
  }
}
