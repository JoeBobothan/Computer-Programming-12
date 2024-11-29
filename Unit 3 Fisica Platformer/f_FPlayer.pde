class FPlayer extends FBox {
  ArrayList<FBox> sensors;
  boolean jumping = false;
  int jumpTimer = 0;
  float x, y;
  float vx, vy;
  float slide;
  float vxChange = 0;
  int health = 10;
  int hurtFrames;
  int maxDoubleJumps = 1;
  int doubleJumps = 1;
  boolean jump;
  int frame = 0;
  boolean facingRight = true;

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
    setupSensors();
  }

  void act() {
    movement();
    animate();
  }

  void movement() {
    x = this.getX();
    y = this.getY();
    vx = getVelocityX();
    vy = getVelocityY();
    vxChange = 0;
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
    if (aKey && !sensor(2, "wall")) vxChange -= 50 + map(abs(vx), 0, 300, 15, 5);
    if (dKey && !sensor(3, "wall")) vxChange += 50 + map(abs(vx), 0, 300, 15, 5);
    if (sensor(1, "ice")) slide = 0.95;
    else if (sensor(1, "spike")) {
      slide = 0.8;
      doubleJumps = maxDoubleJumps;
      if (hurtFrames <= 0) {
        health--;
        hurtFrames = 100;
      }
    } else if (sensor(1, "lava")) {
      jump = true;
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
    sensors.get(0).setPosition(x, y - (gridSize/2) + 1); // top
    sensors.get(1).setPosition(x, y + (gridSize/2) - 1); // bottom
    sensors.get(2).setPosition(x - (gridSize/2) + 1, y); // left
    sensors.get(3).setPosition(x + (gridSize/2) - 1, y); // right
    for (FBox b : sensors) b.setVelocity(vx, vy);
    if (y > 1900) {
      health--;
      setPosition(16, 200);
    }
    if (qKey) {
      player.setPosition(816, 800);
      player.setVelocity(0, 0);
    }
    if (vy == 0) action = idle;
  }

  void animate() {
    if (frame >= action.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(action[frame]);
      frame++;
    }
  }

  boolean sensor(int sensorNumber, String f) {
    FBox s = player.sensors.get(sensorNumber);
    ArrayList<FContact> contactList = s.getContacts();
    for (FContact c : contactList) {
      if (f.equals("floor")) {
        if (c.contains("ground") || c.contains("ice") || c.contains("treetop") || c.contains("trampoline") || c.contains("bridge")) {
          return true;
        }
      } else if (f.equals("wall")) {
        if (c.contains("ground") || c.contains("ice") || c.contains("treetop") || c.contains("trampoline")) {
          return true;
        }
      } else {
        if (c.contains(f)) return true;
      }
    }
    return false;
  }

  void setupSensors() {
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
}
