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
  smooth();
  drawFlower(150, 175, 9, day, 1, false);
  drawFlower(400, 175, 7, day, 1, false);
  drawFlower(650, 175, 8, day, 1, false);
}
