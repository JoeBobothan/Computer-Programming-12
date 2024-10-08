class Mover {

  //instance variables
  float d;
  color f;
  PVector position = new PVector(random(d/2, width-d/2), random(d/2, height-d/2));
  PVector velocity = PVector.random2D().setMag(0.75);

  //constructor
  Mover() {
    d = 75;
    f = color(255, 50);
  }

  //behaviour functions
  void show() {
    stroke(0);
    fill(f);
    noStroke();
    circle(position.x, position.y, d);
  }

  void act() {
    checkEdges();
    position.add(velocity);
  }

  void showConnections(ArrayList<Mover> movers) {
    for (Mover m : movers) {
      float dist = PVector.dist(position, m.position);
      if (dist <= 200) {
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(2);
        line(position.x, position.y, m.position.x, m.position.y);
      }
    }
  }

  void checkEdges() {
    if (position.x < d/2) velocity.x = abs(velocity.x);
    if (position.x > width-d/2) velocity.x = -abs(velocity.x);
    if (position.y < d/2) velocity.y = abs(velocity.y);
    if (position.y > height-d/2) velocity.y = -abs(velocity.y);
  }
}
