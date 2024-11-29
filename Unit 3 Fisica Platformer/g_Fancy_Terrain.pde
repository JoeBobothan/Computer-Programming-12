class FBridge extends FGameObject {
  float t = 25;
  float shakeTimer = t;
  boolean broken = false;
  FBridge(float x, float y) {
    super();
    setPosition(x, y-10);
    setName("bridge");
    attachImage(bridge);
    setStatic(true);
    setFriction(4);
    setRotatable(false);
  }
  void act() {
    if (isTouching("player")) {
      broken = true;
      if (broken) shakeTimer--;
      if (shakeTimer > t*0.9) setRotation(getRotation() + radians(1));
      else if (shakeTimer > t*0.7) setRotation(getRotation() - radians(1));
      else if (shakeTimer > t*0.5) setRotation(getRotation() + radians(1));
      else if (shakeTimer > t*0.3) setRotation(getRotation() - radians(1));
      else if (shakeTimer > t*0.1) setRotation(getRotation() + radians(1));
      else setRotation(getRotation() - radians(1));
      if (shakeTimer <= 0) fall();
    } else {
      setRotation(0);
    }
  }
  void fall() {
    FBridge sensorBridge = new FBridge(getX(), getY()+9.81);
    sensorBridge.setStatic(false);
    sensorBridge.setSensor(true);
    sensorBridge.attachImage(bridge);
    world.remove(this);
    fallingBridge.add(sensorBridge);
    world.add(sensorBridge);
  }
  void slowFall(float s) {
    if (!isStatic()) {
      float gravity = 9.81;
      float upwardForce = getMass() * gravity * s;
      adjustVelocity(0, -upwardForce);
    }
  }
}

class FLava extends FGameObject {
  int t = 0;
  int p = int(random(5, 10));
  int f = int(random(0, lavas.size()));
  FLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    attachImage(lavas.get(f));
    setStatic(true);
    setRotatable(false);
  }
  void act() {
    t++;
    if (f <= p) {
      if (t == 3) {
        f++;
        t=0;
      }
      if (f > 0) {
        int r = int(random(0, 5));
        if (r == 1) f--;
      }
    } else if (f > p && f < p+4) {
      if (t == 8) {
        f++;
        t=0;
      }
    } else {
      if (t == 3) {
        f++;
        t=0;
      }
    }
    if (f > p+6) f = 0;
    if (f <= p) attachImage(lavas.get(0));
    else attachImage(lavas.get(f-p));
  }
}

class FWater extends FGameObject {
  int t = 0;
  int f = int(random(0, waters.size()));
  FWater(float x, float y) {
    super();
    setPosition(x, y);
    setName("water");
    attachImage(waters.get(f));
    setStatic(true);
    setRotatable(false);
  }
  void act() {
    t++;
    if (t == 5) {
      t = 0;
      f++;
      if (f == 4) f = 0;
      attachImage(waters.get(f));
    }
  }
}
