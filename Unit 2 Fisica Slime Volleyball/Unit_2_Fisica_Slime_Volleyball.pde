import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

FWorld world;

FBox leftPlatform;
//FBox rightPlatform;

void setup() {
  size(1000, 750);
  createWorld();
  makeFloor();
}

void draw() {
  background(blue);
  world.step();
  world.draw();
}

void createWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 981);
  world.setEdges();
}

void makeFloor() {
  leftPlatform = new FBox(width/2, 250);
  leftPlatform.setPosition(width/4, 625);

  leftPlatform.setStatic(true);
  leftPlatform.setFillColor(red);
  leftPlatform.setFriction(0);

  world.add(leftPlatform);
}
