// Connor Tsoi
// Computer Programming 12
// Block 1-4
// September 5, 2024

// 0 is midnight and 240 is noon
// 60 is sunrise and 
float time = 0;

boolean PM = false;
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
  fill(100, 255, 100);
  rect(-3, 350, width+6, height+3);
}

void draw() {
  time++;
  if (time >= 240) time = 0;
  if (time >= 120) {
    PM = true;
  }
  if (time <= 0) {
    PM = false;
  }
  
  
  
  if (!PM) sky = lerpColor(night, day, time/60);
  if (PM) sky = lerpColor(night, day, (240-time)/60);
  // sunrise 60, sunset 180
  background(sky);
  
  // Sun
  drawSun();
  
  // Moon
  drawMoon();
  
  textAlign(CENTER, CENTER);
  text(time, width/2, height/2);
  
}
