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

void makeBox() {
  FBox box = new FBox(64, 64);
  box.setPosition(random(width), -5);

  //set visuals
  box.attachImage(mandelbrot);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(0.1);
  box.setRestitution(0.25);
  world.add(box);
}

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), 5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(1);
  bird.setFriction(0);
  bird.setRestitution(1.65);
  world.add(bird);
}

void makeBird(float x, float y) {
  FCircle bird = new FCircle(48);
  bird.setPosition(x, y);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(1);
  bird.setFriction(0);
  bird.setRestitution(1.65);
  world.add(bird);
}
