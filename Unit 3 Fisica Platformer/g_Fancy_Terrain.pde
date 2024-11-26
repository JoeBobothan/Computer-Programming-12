class FBridge extends FGameObject {
  FBridge(float x, float y) {
    super();
    setPosition(x, y);
    setName("bridge");
    attachImage(bridge);
    setStatic(true);
    setFriction(4);
    setRotatable(false);
  }
  void act() {
    if (isTouching("player")) {
      setStatic(false);
      setSensor(true);
    }
  }
}

class FLava extends FGameObject {
  int t = 0;
  int p = int(random(0, lavas.size()));
  int f = p;
  FLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    attachImage(lavas.get(p));
    setStatic(true);
    setRotatable(false);
  }
  void act() {
    t++;
    if (t == 5) {
      t = 0;
      f++;
      if (f < p) {
        if (f > 0) {
          int r = int(random(0, 100));
          if (r % 2 == 1) f--;
        }
        attachImage(lavas.get(0));
      } else if (f == p+1) attachImage(lavas.get(1));
      else if (f == p+2) attachImage(lavas.get(2));
      else if (f == p+3) attachImage(lavas.get(3));
      else if (f == p+4) attachImage(lavas.get(4));
      else if (f == p+5) {
        attachImage(lavas.get(5));
        f = 0;
      }
    }
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
      attachImage(waters.get(f));
      if (f == 3) {
        f = 0;
      }
    }
  }
}
