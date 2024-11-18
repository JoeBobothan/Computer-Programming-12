// Connor Tsoi
// Computer Programming 12
// Block 1-4
// November 4, 2024

import fisica.*;

//Palette
color black = color(0); // Ground
color cyan = color(0, 255, 255); // Ice
color white = color(255); // Spike
color yellow = color(255, 255, 0); // Trampoline
color brown = color(153, 102, 51); // Tree Trunk
color green = color(0, 255, 0); // Treetop

color red = color(255, 0, 0); // Lava
color blue = color(0, 0, 255); // Water
color magenta = color(255, 0, 255); //

PImage map;
float zoom = 1.5;
boolean cameraFollow = false;
boolean drawGrid = false;
int gridSize = 32;
int maxdoubleJumps = 1;
int doubleJumps = 1;

// Terrain
PImage ground, ice, spike, trampoline;
PImage treeTrunk, treeIntersect, treetopCenter, treetopE, treetopW;
//PImage bridge
ArrayList<PImage> lavas = new ArrayList<PImage>();
ArrayList<PImage> waters = new ArrayList<PImage>();

//Keyboard Booleans
boolean wKey = false;
boolean aKey = false;
boolean sKey = false;
boolean dKey = false;
boolean upKey = false;
boolean leftKey = false;
boolean downKey = false;
boolean rightKey = false;
boolean qKey = false;
boolean eKey = false;
boolean spaceKey = false;
boolean zoomOut = false;
boolean zoomIn = false;


//Fisica
FWorld world;
FPlayer player;
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
  map = loadImage("data/map1.png");
  loadImages();
  loadMap(map);
  player = new FPlayer();
  world.add(player);
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
      color e = map.get(x+1, y);
      color s = map.get(x, y+1);
      color w = map.get(x-1, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition((x+0.5)*gridSize, (y+0.5)*gridSize);
      b.setStatic(true);
      if (c == black) {
        b.attachImage(ground);
        b.setFriction(4);
        b.setName("ground");
      }
      if (c == cyan) {
        b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
      }
      if (c == white) {
        b.attachImage(spike);
        b.setName("spike");
      }
      if (c == yellow) {
        b.attachImage(trampoline);
        b.setRestitution(1.25);
        b.setName("trampoline");
      }
      if (c == brown) {
        b.attachImage(treeTrunk);
        b.setSensor(true);
        b.setName("tree trunk");
      }
      if (c == green) {
        setTreetopImage(b, c, e, s, w);
        b.setName("treetop");
      }
      if (c == red) {
        b.attachImage(lavas.get(int(random(0, lavas.size()))));
        b.setName("lava");
      }
      if (c == blue) {
        b.attachImage(waters.get(int(random(0, waters.size()))));
        b.setName("water");
      }
      int gridX = x / 4;
      int gridY = y / 4;
      gridTiles[gridX][gridY].add(b);
      if (alpha(c) != 0) world.add(b);
    }
  }
}

void loadImages() {
  ground = loadImage("data/mario_terrain/brick.png");
  ice = loadImage("data/mario_terrain/blueBlock.png");
  ice.resize(gridSize, gridSize);
  spike = loadImage("data/enemies_and_more/spike.png");
  trampoline = loadImage("data/enemies_and_more/trampoline.png");
  treeIntersect = loadImage("data/mario_terrain/tree_intersect.png");
  treeTrunk = loadImage("data/mario_terrain/tree_trunk.png");
  treetopCenter = loadImage("data/mario_terrain/treetop_center.png");
  treetopE = loadImage("data/mario_terrain/treetop_e.png");
  treetopW = loadImage("data/mario_terrain/treetop_w.png");
  for (int i = 0; i < 6; i++) {
    lavas.add(loadImage("data/mario_terrain/lava" + i + ".png"));
  }
  for (int i = 1; i < 5; i++) {
    waters.add(loadImage("data/mario_terrain/water" + i + ".png"));
  }
}

void setTreetopImage(FBody b, color c, color e, color s, color w) {
  if (s == brown) b.attachImage(treeIntersect);
  else if (e == green && w == green) b.attachImage(treetopCenter);
  else if (w != green) b.attachImage(treetopW);
  else if (e != green) b.attachImage(treetopE);
}
