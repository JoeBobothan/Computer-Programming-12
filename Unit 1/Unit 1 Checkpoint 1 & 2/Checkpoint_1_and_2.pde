// Connor Tsoi
// Computer Programming 12
// Block 1-4
// September 5, 2024

float time = 1200;

boolean pastSunrise = false;
color day = color(100, 200, 255);
color night = color(0, 0, 25);
color sky;

void setup() {
  size(800, 450);
  background(night);

  // Borders
  stroke(0);
  strokeWeight(5);

  // Sun
  drawSun();

  // Moon
  drawMoon();

  // House
  drawHouse();

  // Tree
  drawTree();

  // Green Grass
  drawGrass();
}

void draw() {
  time+=3;
  //time = map(mouseX, 0, width, 0, 2400);
  if (time >= 2400) time = 0;
  if (time >= 900) {
    pastSunrise = true;
  } else if (time >= 0) {
    pastSunrise = false;
  }
  float map = 0;
  if (!pastSunrise) map = map(time, 600, 900, 0, 1);
  if (pastSunrise) map = 1 - map(time, 1600, 1900, 0, 1);
  sky = lerpColor(night, day, map);
  background(sky);

  pushMatrix();
  translate(width/2, height-100);
  rotate(map(time, 0, 2400, 0, 2*PI));
  drawSun();
  drawMoon();
  popMatrix();

  drawHouse();
  drawTree();
  drawGrass();
}
