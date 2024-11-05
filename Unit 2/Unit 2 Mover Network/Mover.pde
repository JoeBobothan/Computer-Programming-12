class Mover {

  //instance variables
  float d;
  color f;
  PVector position;
  PVector velocity;
  boolean kill = false;

  //constructor
  Mover() {
    d = 0;
    f = color(255, 50);
    f = color(random(0, 255), random(0, 255), random(0, 255), 50);
    position = new PVector(random(d/2, width-d/2), random(d/2, height-d/2));
    velocity = PVector.random2D().setMag(random(1, 2));
    velocity.setMag(0);
  }
  
  Mover(float x, float y) {
    this();
    position = new PVector(x, y);
  }

  //behaviour functions
  void show() {
    fill(f);
    noStroke();
    circle(position.x, position.y, d);
  }

  void act() {
    if (kill) movers.remove(this);
    checkEdges();
    position.add(velocity);
  }

  void showConnections(ArrayList<Mover> movers) {
    for (Mover m : movers) {
      float dist = PVector.dist(position, m.position);
      if (dist <= connectionDist) {
        float a = map(dist, 0, connectionDist, 128, 0);
        //stroke(255, a);
        stroke(red(f), green(f), blue(f), a);
        //stroke(random(0, 255), random(0, 255), random(0, 255), a);
        strokeWeight(2);
        line(position.x, position.y, m.position.x, m.position.y);
      }
    }
  }
  
  void touchingMouse() {
    if (dist(mouseX, mouseY, position.x, position.y) < d/2 && mousePressed && mouseButton == RIGHT) kill = true;
    else kill = false;
  }
  
  void checkEdges() {
    if (position.x < d/2) velocity.x = abs(velocity.x);
    if (position.x > width-d/2) velocity.x = -abs(velocity.x);
    if (position.y < d/2) velocity.y = abs(velocity.y);
    if (position.y > height-d/2) velocity.y = -abs(velocity.y);
  }
}
