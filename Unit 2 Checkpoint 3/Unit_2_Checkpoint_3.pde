Gif character, centiskorch;

void setup() {
  size(600, 600);
  imageMode(CENTER);
  //Gif(String before, String after, int numFrames, int speed, float x, float y{, float w, float });
  character = new Gif("data/Character/frame_", "_delay-0.17s.gif", 4, 5, width/2, height/2);
  centiskorch = new Gif("data/Centiskorch/", ".gif", 7, 30, width/2, height/2, 600, 600);
}
//5 small, 7 large, 15 small, 21 small, 

void draw() {
  background(128);
  centiskorch.show();
  character.show();
  PImage frame7 = loadImage("data/Centiskorch/7.gif");
  //image(frame7, width/2, height/2, width, height);
}
