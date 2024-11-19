class FPlayer extends FBox {
  ArrayList<FBox> sensors;
  boolean jumping = false;
  int jumpTimer = 0;
  float x, y;
  float vx, vy;
  int health = 10;
  int hurtFrames;
  int maxdoubleJumps = 1;
  int doubleJumps = 1;
  boolean jump;

  FPlayer() {
    super(gridSize, gridSize);
    setPosition(200, 200);
    setFillColor(white);
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
  }

  void movement() {
    float vxChange = 0;
    jump = false;
    int gridX = int(map(this.getX(), 0, 1024, 0, 8));
    int gridY = int(map(this.getY(), 0, 1024, 0, 8));
    collisions();
    if (jumpTimer > 0) jumpTimer--;
    else if (wKey && !jumping) {
      if (bottomSensor("floor")) {
        jumpTimer = 17;
        jumping = true;
        jump = true;
      } else if (!bottomSensor("floor") && (doubleJumps > 0 || spaceKey)) {
        jumpTimer = 17;
        jumping = true;
        jump = true;
        if (!spaceKey) doubleJumps--;
      }
    }
    if (!wKey) jumping = false;
    if (aKey && !isTouchingLeftWall()) vxChange -= 5 + map(abs(vx), 0, 300, 15, 5);
    if (dKey && !isTouchingRightWall()) vxChange += 5 + map(abs(vx), 0, 300, 15, 5);

    if (jump) setVelocity(vx*0.95 + vxChange, -400);
    else setVelocity(vx*0.95 + vxChange, vy);
  }

  void collisions() {
    if (hurtFrames > 0) {
      hurtFrames--;
      if (hurtFrames > 25 && hurtFrames%10 >= 5) setFillColor(red);
      else setFillColor(white);
    }
    if (bottomSensor("floor")) doubleJumps = maxdoubleJumps;
    else if (bottomSensor("spike")) {
      if (hurtFrames <= 0) {
        health--;
        jump = true;
        hurtFrames = 100;
      }
    }
  }
}
