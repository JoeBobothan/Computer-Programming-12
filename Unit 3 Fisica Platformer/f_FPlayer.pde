class FPlayer extends FBox {
  ArrayList<FBox> sensors;
  boolean jumping = false;
  int jumpTimer = 0;
  float x, y;
  float vx, vy;

  FPlayer() {
    super(gridSize, gridSize);
    setPosition(200, 200);
    setFillColor(red);
    setRotatable(false);
    setNoStroke();
    setFriction(0);
    x = this.getX();
    y = this.getY();
    sensors = new ArrayList<FBox>();
    sensors.add(new FBox(gridSize*0.9, 2));
    sensors.add(new FBox(gridSize*0.9, 2));
    sensors.add(new FBox(2, gridSize*0.9));
    sensors.add(new FBox(2, gridSize*0.9));
    for (FBox b : sensors) {
      b.setSensor(true);
      b.setFillColor(cyan);
      b.setNoStroke();
      world.add(b);
    }
  }

  void act() {
    x = this.getX();
    y = this.getY();
    vx = getVelocityX();
    vy = getVelocityY();
    movement();
    sensors.get(0).setPosition(x, y - (gridSize/2) - 1); // top
    sensors.get(1).setPosition(x, y + (gridSize/2) + 1); // bottom
    sensors.get(2).setPosition(x - (gridSize/2) - 1, y); // left
    sensors.get(3).setPosition(x + (gridSize/2) + 1, y); // right
    for (FBox b : sensors) {
      b.setVelocity(vx, vy);
    }
    collisions();
  }

  void movement() {
    float vxChange = 0;
    boolean jump = false;
    int gridX = int(map(this.getX(), 0, 1024, 0, 8));
    int gridY = int(map(this.getY(), 0, 1024, 0, 8));
    if (isOnGround()) doubleJumps = maxdoubleJumps;
    if (jumpTimer > 0) jumpTimer--;
    else if (wKey && !jumping) {
      if (isOnGround()) {
        jumpTimer = 10;
        jumping = true;
        jump = true;
      } else if (!isOnGround() && (doubleJumps > 0 || spaceKey)) {
        jumpTimer = 10;
        jumping = true;
        jump = true;
        if (!spaceKey) doubleJumps--;
      }
    }
    if (!wKey) jumping = false;
    if (aKey && !isTouchingLeftWall()) vxChange -= map(abs(vx), 0, 300, 30, 10);
    if (dKey && !isTouchingRightWall()) vxChange += map(abs(vx), 0, 300, 30, 10);

    if (jump) setVelocity(vx*0.95 + vxChange, -400);
    else setVelocity(vx*0.95 + vxChange, vy);
  }

  void collisions() {
  }
}
