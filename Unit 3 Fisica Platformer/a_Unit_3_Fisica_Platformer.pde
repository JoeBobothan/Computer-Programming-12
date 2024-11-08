// Connor Tsoi
// Computer Programming 12
// Block 1-4
// November 4, 2024

import fisica.*;

//Palette
color red = color(255, 0, 0); //#FF0000 // Lava?
color green = color(0, 255, 0); //#00FF00 // Tree Leaves
color blue = color(0, 0, 255); //#0000FF // Water
color cyan = color(0, 255, 255); //#00FFFF // Ice
color magenta = color(255, 0, 255); //#FF00FF //
color yellow = color(255, 255, 0); //#FFFF00 // Bounce
color black = color(0); //#000000 // Ground
color white = color(255); //#FFFFFF //
color brown = color(154, 102, 51); // Tree Trunk

PImage map;
float zoom = 1.5;
boolean zoomOut = false;
boolean zoomIn = false;
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
float tolerance = 1; // For some reason player is always a few pixels away from the wall

ArrayList<FBox>[][] gridTiles = new ArrayList[8][8];

//Mode Framework
int mode = 1;
final int INTRO = 0;
final int GAME = 1;
final int WIN = 2;
final int PAUSE = 3;
final int FREEZE = 4;
boolean enterPauseMode = false;
boolean enterWinMode = false;
int freeze = 0;

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

  for (int i = 0; i < 8; i++) {
    for (int j = 0; j < 8; j++) {
      gridTiles[i][j] = new ArrayList<FBox>();
    }
  }

  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c == black) {
        //b.attachImage(ground);
        b.setFriction(4);
        //b.setRestitution(0.2);
        b.setName("ground");
      }
      if (c == cyan) {
        //b.attachImage(ground);
        b.setFriction(0);
        b.setName("ice");
      }
      int gridX = int(map(x, 0, 1024, 0, 7));
      int gridY = int(map(y, 0, 1024, 0, 7));
      //int gridX = x / 4;  // Calculate grid square X (e.g., 0-7)
      //int gridY = y / 4;  // Calculate grid square Y (e.g., 0-7)
      gridTiles[gridX][gridY].add(b);  // Add the ground tile to the correct grid
      if (alpha(c) != 0) world.add(b);
    }
  }
}
