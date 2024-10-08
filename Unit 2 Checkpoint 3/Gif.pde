class Gif {

  //instance variables
  PImage[] frames;
  int numFrames;
  int speed;
  int currentFrame;
  float x, y, w, h;

  //constructors
  Gif(String b, String a, int n, int s, int _x, int _y) {
    frames = new PImage[n];
    numFrames = n;
    speed = s;
    currentFrame = 0;
    x = _x;
    y = _y;

    for (int i = 0; i < numFrames; i++) {
      frames[i] = loadImage(b + i + a);
      println("Frame " + i + " size: " + frames[i].width + "x" + frames[i].height);
    }

    w = frames[0].width;
    h = frames[0].height;
  }

  Gif(String b, String a, int n, int s, int _x, int _y, int _w, int _h) {
    this(b, a, n, s, _x, _y);
    w = _w;
    h = _h;
  }

  //behaviour functions
  void show() {
    if (currentFrame == numFrames) currentFrame = 0;
    image(frames[currentFrame], x, y, w, h);
    if (frameCount % speed == 0) currentFrame++;
  }
}
