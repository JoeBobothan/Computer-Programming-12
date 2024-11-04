// Connor Tsoi
// Computer Programming 12
// Block 1-4
// November 4, 2024

import fisica.*;

//Palette
color red = color(255, 0, 0); //#FF0000 //
color green = color(0, 255, 0); //#00FF00 //
color blue = color(0, 0, 255); //#0000FF //
color cyan = color(0, 255, 255); //#00FFFF // Ice
color magenta = color(255, 0, 255); //#FF00FF //
color yellow = color(255, 255, 0); //#FFFF00 //
color black = color(0); //#000000 // Ground
color white = color(255); //#FFFFFF //

PImage map;
float zoom = 1.5;
int gridSize = 32;

//Keyboard Booleans
boolean wKey = false;
boolean aKey = false;
boolean sKey = false;
boolean dKey = false;

boolean qKey = false;
boolean eKey = false;
boolean spaceKey = false;

boolean upKey = false;
boolean leftKey = false;
boolean downKey = false;
boolean rightKey = false;

//Fisica
FWorld world;
FPlayer leftPlayer;
FPlayer rightPlayer;
int playerD = 48;

//Mode Framework
int mode;
final int INTRO = 0;
final int GAME = 1;
final int WIN = 2;
final int PAUSE = 3;
final int FREEZE = 4;
boolean enterPauseMode = false;
boolean enterWinMode = false;
int freeze = 0;

//Score
int redScore = 0;
int blueScore = 0;
boolean blueWins = false;

void setup() {
  fullScreen();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  Fisica.init(this);
  map = loadImage("data/map.png");
  loadMap(map);
  makePlayers();
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == WIN) {
    win();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == FREEZE) {
    freeze();
  } else {
    println("Invalid mode");
    noLoop();
  }
}

void loadMap(PImage img) {
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 981);

  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c == black) {
        //b.attachImage(ground);
        b.setFriction(4);
        b.setName("ground");
      }
      if (c == cyan) {
        //b.attachImage(ground);
        b.setFriction(0);
        b.setName("ice");
      }
      world.add(b);
    }
  }
}
