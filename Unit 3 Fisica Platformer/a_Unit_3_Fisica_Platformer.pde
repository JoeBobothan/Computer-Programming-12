// Connor Tsoi
// Computer Programming 12
// Block 1-4
// November 4, 2024

import fisica.*;

//Palette
color red = color(255, 0, 0); //#FF0000 // Spike // Image, dangerous terrain
color green = color(0, 255, 0); //#00FF00 // Tree Leaves
color blue = color(0, 0, 255); //#0000FF // Water
color cyan = color(0, 255, 255); //#00FFFF // Ice // Image, low friction
color magenta = color(255, 0, 255); //#FF00FF //
color yellow = color(255, 255, 0); //#FFFF00 // Bounce // Image, higher restitution
color black = color(0); //#000000 // Ground // Image, higher friction
color white = color(255); //#FFFFFF //
color brown = color(154, 102, 51); // Tree Trunk

PImage map;
float zoom = 1.5;
boolean zoomOut = false;
boolean zoomIn = false;
int gridSize = 32;

// Terrain
PImage terrain;
PImage leftGround, middleGround, rightGround, topGround;
PImage leftSideGround, centerGround, rightSideGround, pillarGround;
ArrayList<PImage> groundTiles = new ArrayList<PImage>();

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
  loadTerrain();
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
      color n = map.get(x, y-1);
      color e = map.get(x+1, y);
      color s = map.get(x, y+1);
      color w = map.get(x-1, y);
      FBox b = new FBox(gridSize, gridSize);
      b.setPosition((x+0.5)*gridSize, (y+0.5)*gridSize);
      b.setStatic(true);
      if (c == black) {
        if (n != black) {
          if (e == black && w != black) b.attachImage(groundTiles.get(0)); // west end
          else if (e == black && w == black) b.attachImage(groundTiles.get(1)); // middle
          else if (e != black && w == black) b.attachImage(groundTiles.get(2)); // east end
          else if ( e != black && w != black) b.attachImage(groundTiles.get(3)); // top
        } else if (n == black) {
          if (e == black && w != black) b.attachImage(groundTiles.get(4)); // west side end
          else if (e == black && w == black) b.attachImage(groundTiles.get(5)); // center ground
          else if (e != black && w == black) b.attachImage(groundTiles.get(6)); // east side end
          else if (e != black && w != black) b.attachImage(groundTiles.get(7)); // pillar
        }
        //b.attachImage(ground);
        b.setFriction(4);
        b.setName("ground");
      }
      if (c == cyan) {
        //b.attachImage(ice);
        b.setFriction(0);
        b.setName("ice");
      }
      if (c == brown) {
        //b.attachImage(treeTrunk)
        b.setSensor(true);
        b.setName("tree trunk");
      }
      int gridX = x / 4;
      int gridY = y / 4;
      gridTiles[gridX][gridY].add(b);
      if (alpha(c) != 0) world.add(b);
    }
  }
}

void loadTerrain() {
  terrain = loadImage("data/Terrain.png");
  int s = 16;
  groundTiles.add(scaleImage(terrain.get(3*s, 0*s, s, s), gridSize, gridSize));
  groundTiles.add(scaleImage(terrain.get(4*s, 0*s, s, s), gridSize, gridSize));
  groundTiles.add(scaleImage(terrain.get(5*s, 0*s, s, s), gridSize, gridSize));
  groundTiles.add(scaleImage(terrain.get(6*s, 0*s, s, s), gridSize, gridSize));
  groundTiles.add(scaleImage(terrain.get(3*s, 1*s, s, s), gridSize, gridSize));
  groundTiles.add(scaleImage(terrain.get(4*s, 1*s, s, s), gridSize, gridSize));
  groundTiles.add(scaleImage(terrain.get(5*s, 1*s, s, s), gridSize, gridSize));
  groundTiles.add(scaleImage(terrain.get(6*s, 1*s, s, s), gridSize, gridSize));
}

PImage scaleImage(PImage img, int newWidth, int newHeight) {
  PGraphics pg = createGraphics(newWidth, newHeight);
  pg.noSmooth();  // Ensure no smoothing when drawing
  pg.beginDraw();
  pg.image(img, 0, 0, newWidth, newHeight);
  pg.endDraw();
  return pg.get();  // Return the scaled PImage
}
