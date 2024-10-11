/*
 Create two buttons and place them on the screen in front of the FBodies.
 Clicking on one button should turn on/off the world's gravity.
 Clicking on the other button should turn on/off the adding of new FBodies to the world.
 */
import fisica.*;

Button[] buttons;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

boolean mouseReleased;
boolean wasPressed;

//assets
PImage redBird, mandelbrot;

//cloud variables
float x = 0;
float x1 = 100;

FPoly topPlatform;
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
  //make window
  fullScreen();
  buttons = new Button[2];
  buttons[0] = new Button("Toggle Gravity", 30, height-30, 50, 50, blue, green);

  //load resources
  redBird = loadImage("red-bird.png");
  mandelbrot = loadImage("mandelbrot.png");
  mandelbrot.resize(64, 64);

  //initialise world
  makeWorld();

  //add terrain to world
  makeTopPlatform();
  makeBottomPlatform();
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  //topPlatform.vertex(0, 0);
  //topPlatform.vertex(25, 0);
  //topPlatform.vertex(25, 250);
  //topPlatform.vertex(275, 250);
  //topPlatform.vertex(275, 0);
  //topPlatform.vertex(300, 0);
  //topPlatform.vertex(300, 275);
  //topPlatform.vertex(0, 275);
  
  topPlatform.vertex(0, 0);
  topPlatform.vertex(300, 0);
  topPlatform.vertex(300, 25);
  topPlatform.vertex(25, 25);
  topPlatform.vertex(25, 275);
  topPlatform.vertex(300, 275);
  topPlatform.vertex(300, 300);
  topPlatform.vertex(0, 300);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  //bottomPlatform.vertex(width+100, height*0.6);
  //bottomPlatform.vertex(300, height*0.8);
  //bottomPlatform.vertex(300, height*0.8+100);
  //bottomPlatform.vertex(width+100, height*0.6+100);
  
  bottomPlatform.vertex(0, 500);
  bottomPlatform.vertex(width, 500);
  bottomPlatform.vertex(width, 600);
  bottomPlatform.vertex(0, 600);


  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);

  if (frameCount % 100 == 0) {  //Every 20 frames ...
    //makeCircle();
    //makeBlob();
    //makeBox();
    makeBird();
  }
  x += 5;
  x1 += 3;
  if (x > width+50) x = -150;
  if (x1 > width+50) x1 = -150;
  world.step();  //get box2D to calculate all the forces and new positions
  ellipse(35+x, 25, 100, 50);
  ellipse(x, 45, 100, 50);
  ellipse(55+x, 50, 100, 50);
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw // to draw before or after the fisica objects, just normal code before and after
  ellipse(x1+35, 25, 100, 50);
  ellipse(x1, 45, 100, 50);
  ellipse(x1+55, 50, 100, 50);
}
