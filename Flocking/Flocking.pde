Flock flock;
int count = 10;
int mouseCircleTimer = 0;
boolean wkey, akey, skey, dkey;

float accel = 0.15;
PVector N = new PVector(0, -1);
PVector NE = new PVector(1, -1);
PVector E = new PVector(1, 0);
PVector SE = new PVector(1, 1);
PVector S = new PVector(0, 1);
PVector SW = new PVector(-1, 1);
PVector W = new PVector(-1, 0);
PVector NW = new PVector(-1, -1);
PVector mvt = new PVector(0, 0);
float velocityN = 0;
float velocityNE = 0;
float velocityE = 0;
float velocitySE = 0;
float velocityS = 0;
float velocitySW = 0;
float velocityW = 0;
float velocityNW = 0;

void setup() {
  size(640, 360);
  //fullScreen();
  surface.setResizable(true);
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < count; i++) {
    flock.addBoid(new Boid(width/2, height/2));
  }
}

void draw() {
  background(50);
  flock.run();
  //if (mousePressed && mouseButton == LEFT) flock.addBoid(new Boid(mouseX, mouseY));
}

// Add a new boid into the System
void mousePressed() {
  if (mouseButton == LEFT) flock.addBoid(new Boid(mouseX, mouseY));
  if (mouseButton == RIGHT) {
    flock.removeBoid();
    flock.closestDist();
  }
}
//add a circle if radius [closestDist] when [remove] funciton runs 3 times or more in the last second
// cirlce lasts 0.5 seconds, timer refreshes each time [remove] is run

void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
}
