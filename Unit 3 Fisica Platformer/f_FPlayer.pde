class FPlayer extends FBox {
  ArrayList<FBox> sensors;
  boolean jumping = false;
  int jumpTimer = 0;
  float x, y;
  float vx, vy;
  int health = 10;
  int hurtFrames;
  int maxDoubleJumps = 1;
  int doubleJumps = 1;
  boolean jump;

  FPlayer() {
    super(gridSize-2, gridSize-2);
    setName("player");
    setPosition(16, 200);
    setFillColor(white);
    setRotatable(false);
    setNoStroke();
    setFriction(0);
    x = this.getX();
    y = this.getY();
    sensors = new ArrayList<FBox>();
    sensors.add(new FBox(gridSize-4, 2));
    sensors.add(new FBox(gridSize-4, 2));
    sensors.add(new FBox(2, gridSize-4));
    sensors.add(new FBox(2, gridSize-4));
    for (FBox b : sensors) {
      b.setSensor(true);
      b.setFillColor(color(white, 0));
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
    sensors.get(0).setPosition(x, y - (gridSize/2) + 1); // top
    sensors.get(1).setPosition(x, y + (gridSize/2) - 1); // bottom
    sensors.get(2).setPosition(x - (gridSize/2) + 1, y); // left
    sensors.get(3).setPosition(x + (gridSize/2) - 1, y); // right
    for (FBox b : sensors) {
      b.setVelocity(vx, vy);
    }
    if (y > 2000) {
      health--;
      setPosition(16, 200);
    }
  }

  void movement() {
    float vxChange = 0;
    jump = false;
    if (jumpTimer > 0) jumpTimer--;
    else if (wKey && !jumping) {
      if (sensor(1, "floor")) {
        jumpTimer = 17;
        jumping = true;
        jump = true;
      } else if (!sensor(1, "floor") && (doubleJumps > 0 || spaceKey)) {
        jumpTimer = 17;
        jumping = true;
        jump = true;
        if (!spaceKey) doubleJumps--;
      }
    }
    if (!wKey) jumping = false;
    if (aKey && !sensor(2, "floor")) vxChange -= 50 + map(abs(vx), 0, 300, 15, 5);
    if (dKey && !sensor(3, "floor")) vxChange += 50 + map(abs(vx), 0, 300, 15, 5);
    float slide = 0;
    if (sensor(1, "ice")) slide = 0.95;
    else if (sensor(1, "spike")) {
      slide = 0.8;
      doubleJumps = maxDoubleJumps;
      if (hurtFrames <= 0) {
        health--;
        hurtFrames = 100;
      }
    } else if (sensor(1, "floor")) {
      slide = 0.85;
      vxChange *= 0.75;
      doubleJumps = maxDoubleJumps;
    } else slide = 0.85;

    if (jump) setVelocity(vx*slide + vxChange, -400);
    else setVelocity(vx*slide + vxChange, vy);
    if (hurtFrames > 0) {
      hurtFrames--;
      if (hurtFrames > 25 && hurtFrames%10 >= 5) setFillColor(color(red, 0));
      else setFillColor(white);
    }
  }

  boolean sensor(int sensorNumber, String f) {
    FBox s = player.sensors.get(sensorNumber);
    ArrayList<FContact> contactList = s.getContacts(); // Get list of contacts of player
    for (FContact c : contactList) { // For every FContact, name it c and run
      if (f.equals("floor")) {
        if (c.contains("ground") || c.contains("ice") || c.contains("treetop") || c.contains("trampoline") || c.contains("bridge")) {
          return true;
        }
      } else {
        if (c.contains(f)) return true;
      }
    }
    return false;
  }
}
