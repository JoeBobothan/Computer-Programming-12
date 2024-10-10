/*
Copy and paste the Fisica experiment code at the end of the document, install Fisica in processing, and make sure you can run the code. Read over the code and interact with the running project. Play with it a bit, try to break things!
 
 Change one of the ramps into a bucket-shaped FPoly that can catch the falling FBodies.
 
 Using traditional animation techniques, write code to create two clouds that travel across the screen. When they reach the end of the screen, make them jump back to their starting place. Draw one of the clouds behind the FBodies, and the other one in front of the FBodies.
 
 Change the green FBox objects into bouncy squares.
 Attach an image to the FBox the way that the red bird is
 attached to some of the FBodies in the starter code.
 Make sure to resize the image after loading it so that it fits perfectly on the FBox.
 
 Create two buttons and place them on the screen in front of the FBodies.
 Clicking on one button should turn on/off the world's gravity.
 Clicking on the other button should turn on/off the adding of new FBodies to the world.
 */
import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);

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

  //load resources
  redBird = loadImage("red-bird.png");
  mandelbrot = loadImage("mandelbrot.png");
  //mandelbrot.resize(25, 25);

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
  topPlatform.vertex(0, 0);
  topPlatform.vertex(25, 0);
  topPlatform.vertex(25, 250);
  topPlatform.vertex(275, 250);
  topPlatform.vertex(275, 0);
  topPlatform.vertex(300, 0);
  topPlatform.vertex(300, 275);
  topPlatform.vertex(0, 275);
  topPlatform.vertex(0, 275);

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
  bottomPlatform.vertex(width+100, height*0.6);
  bottomPlatform.vertex(300, height*0.8);
  bottomPlatform.vertex(300, height*0.8+100);
  bottomPlatform.vertex(width+100, height*0.6+100);
  //bottomPlatform.vertex(0, 500);
  //bottomPlatform.vertex(width, 500);
  //bottomPlatform.vertex(width, 600);
  //bottomPlatform.vertex(0, 600);


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

  if (frameCount % 20 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
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


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(256, 256);
  box.setPosition(random(width), -5);

  //set visuals
  //box.setStroke(0);
  //box.setStrokeWeight(2);
  //box.setFillColor(green);
  box.attachImage(mandelbrot);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  //box.setRestitution(0.25);
  box.setRestitution(5);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(8);
  bird.setFriction(1);
  bird.setRestitution(5);
  world.add(bird);
}
