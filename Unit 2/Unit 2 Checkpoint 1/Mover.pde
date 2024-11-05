class Mover {

  //instance variables
  float x, y;
  float d;
  color f;
  boolean rememberColour = false;
  boolean rememberSize = false;
  boolean randomShape = false;
  int s;

  //constructor
  Mover() {
    if (rememberColour) f = color(random(0, 255), random(0, 255), random(0, 255));
    if (rememberSize) d = random(25, 50);
    //if (randomShape) s = int(random(0, 2));
    x = width/2;
    y = height/2;
  }

  //behaviour functions
  void show() {
    stroke(0);
    fill(f);
    strokeWeight(5);
    if (s == 0) circle(x, y, d);
    else if (s == 1) square(x, y, d);
  }

  void act() {
    //for basic mover, remove the !remembers and use the set values below. set remember booleans all to false.
    //f = color(255);
    //d = 50;
    if (!rememberColour) f = color(random(0, 255), random(0, 255), random(0, 255));
    if (!rememberSize) d = random(25, 50);
    if (randomShape) s = int(random(0, 2));
    x += random(-20, 20);
    y += random(-20, 20);
  }
}
