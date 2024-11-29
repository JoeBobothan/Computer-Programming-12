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
color magenta = color(255, 0, 255); // Bridge

PImage map;
float zoom = 1.5;
boolean cameraFollow = true;
boolean drawGrid = false;
int gridSize = 32;

// Terrain
PImage ice, spike, trampoline, bridge;
PImage treeTrunk, treeIntersect, treetopCenter, treetopE, treetopW;
ArrayList<PImage> grounds = new ArrayList<PImage>();
ArrayList<PImage> lavas = new ArrayList<PImage>();
ArrayList<PImage> waters = new ArrayList<PImage>();

// Character Animations
PImage[] idle = new PImage[4];
PImage[] jump = new PImage[2];
PImage[] run = new PImage[6];
PImage[] action;

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
ArrayList<FGameObject> terrain = new ArrayList<FGameObject>();
ArrayList<FBridge> fallingBridge = new ArrayList<FBridge>();

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
  fullScreen(P2D);
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
  for (int y = 0; y < map.height; y++) {
    for (int x = 0; x < map.width; x++) {
      color c = map.get(x, y);
      color n = map.get(x, y-1);
      color e = map.get(x+1, y);
      color s = map.get(x, y+1);
      color w = map.get(x-1, y);
      if (c != magenta && c != red && c!= blue) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition((x+0.5)*gridSize, (y+0.5)*gridSize);
        b.setStatic(true);
        if (c == black) {
          setGroundImage(b, n, e, s, w);
          b.setFriction(4);
          b.setName("ground");
        } else if (c == cyan) {
          b.attachImage(ice);
          b.setFriction(0.1);
          b.setName("ice");
        } else if (c == white) {
          b.attachImage(spike);
          b.setName("spike");
        } else if (c == yellow) {
          b.attachImage(trampoline);
          b.setRestitution(1.25);
          b.setName("trampoline");
        } else if (c == brown) {
          b.attachImage(treeTrunk);
          b.setSensor(true);
          b.setName("tree trunk");
        } else if (c == green) {
          setTreetopImage(b, e, s, w);
          b.setName("treetop");
        }
        if (alpha(c) != 0) world.add(b);
      } else if (c == magenta) {
        FBridge br = new FBridge((x+0.5)*gridSize, (y+0.5)*gridSize);
        terrain.add(br);
        world.add(br);
      } else if (c == red) {
        FLava la = new FLava((x+0.5)*gridSize, (y+0.5)*gridSize);
        terrain.add(la);
        world.add(la);
      } else if (c == blue) {
        FWater wa = new FWater((x+0.5)*gridSize, (y+0.5)*gridSize);
        terrain.add(wa);
        world.add(wa);
      }
    }
  }
}

void loadImages() {
  ice = loadImage("data/mario_terrain/blueBlock.png");
  ice.resize(gridSize, gridSize);
  spike = loadImage("data/enemies_and_more/spike.png");
  trampoline = loadImage("data/enemies_and_more/trampoline.png");
  bridge = loadImage("data/mario_terrain/bridge_center.png");
  treeIntersect = loadImage("data/mario_terrain/tree_intersect.png");
  treeTrunk = loadImage("data/mario_terrain/tree_trunk.png");
  treetopCenter = loadImage("data/mario_terrain/treetop_center.png");
  treetopE = loadImage("data/mario_terrain/treetop_e.png");
  treetopW = loadImage("data/mario_terrain/treetop_w.png");
  for (int i = 0; i <= 6; i++) lavas.add(loadImage("data/mario_terrain/lava" + i + ".png"));
  for (int i = 1; i <= 4; i++) waters.add(loadImage("data/mario_terrain/water" + i + ".png"));
  for (int i = 1; i <= 9; i++) grounds.add(loadImage("data/mario_terrain/brick_" + i + ".png"));
  grounds.add(loadImage("data/mario_terrain/brick_endcap_n.png"));
  grounds.add(loadImage("data/mario_terrain/brick_endcap_s.png"));
  lavas.get(5).resize(lavas.get(5).width, lavas.get(5).height);
  idle[0] = loadImage("data/mario_sprites/idleRight0.png");
  idle[1] = loadImage("data/mario_sprites/idleRight1.png");
  idle[2] = loadImage("data/mario_sprites/idleLeft0.png");
  idle[3] = loadImage("data/mario_sprites/idleLeft1.png");
  jump[0] = loadImage("data/mario_sprites/jump0.png");
  jump[1] = loadImage("data/mario_sprites/jump1.png");
  run[0] = loadImage("data/mario_sprites/runright0.png");
  run[1] = loadImage("data/mario_sprites/runright1.png");
  run[2] = loadImage("data/mario_sprites/runright2.png");
  run[3] = loadImage("data/mario_sprites/runleft0.png");
  run[4] = loadImage("data/mario_sprites/runleft1.png");
  run[5] = loadImage("data/mario_sprites/runleft2.png");
  action = idle;
}

void setGroundImage(FBody b, color n, color e, color s, color w) {
  if      ((n != black && n != white) && (e == black || e == white) && (s == black || s == white) && (w != black && w != white)) b.attachImage(grounds.get(0));// 3x3 Grid
  else if ((n != black && n != white) && (e == black || e == white) && (s == black || s == white) && (w == black || w == white)) b.attachImage(grounds.get(1));//   *
  else if ((n != black && n != white) && (e != black && e != white) && (s == black || s == white) && (w == black || w == white)) b.attachImage(grounds.get(2));//   *
  else if ((n == black || n == white) && (e == black || e == white) && (s == black || s == white) && (w != black && w != white)) b.attachImage(grounds.get(3));//   *
  else if ((n == black || n == white) && (e == black || e == white) && (s == black || s == white) && (w == black || w == white)) b.attachImage(grounds.get(4));//   *
  else if ((n == black || n == white) && (e != black && e != white) && (s == black || s == white) && (w == black || w == white)) b.attachImage(grounds.get(5));//   *
  else if ((n == black || n == white) && (e == black || e == white) && (s != black && s != white) && (w != black && w != white)) b.attachImage(grounds.get(6));//   *
  else if ((n == black || n == white) && (e == black || e == white) && (s != black && s != white) && (w == black || w == white)) b.attachImage(grounds.get(7));//   *
  else if ((n == black || n == white) && (e != black && e != white) && (s != black && s != white) && (w == black || w == white)) b.attachImage(grounds.get(8));// 3x3 Grid
  else if ((n != black && n != white) && (e == black || e == white) && (s != black && s != white) && (w == black || w == white)) b.attachImage(grounds.get(1));// Hoizontal Pillar
  else if ((n == black || n == white) && (e != black && e != white) && (s == black || s == white) && (w != black && w != white)) b.attachImage(grounds.get(10));//Vertical Pillar
  else if ((n != black && n != white) && (e != black && e != white) && (s == black || s == white) && (w != black && w != white)) b.attachImage(grounds.get(9));// North Endcap
  else if ((n == black || n == white) && (e != black && e != white) && (s != black && s != white) && (w != black && w != white)) b.attachImage(grounds.get(10));//South Endcap
  else if ((n != black && n != white) && (e == black || e == white) && (s != black && s != white) && (w != black && w != white)) b.attachImage(grounds.get(0));// West Endcap
  else if ((n != black && n != white) && (e != black && e != white) && (s != black && s != white) && (w == black || w == white)) b.attachImage(grounds.get(2));// East Endcap
  else if ((n != black && n != white) && (e != black && e != white) && (s != black && s != white) && (w != black && w != white)) b.attachImage(grounds.get(9));// Standalone

  // well damn it still looks odd, next time: use the brick_all.png to find the old top layer of bricks
  // and for the other layers of brick, get rid of the 'larger' layer by reverting it to normal height, and increase the dark grey by 1 px to 3 px
}

void setTreetopImage(FBody b, color e, color s, color w) {
  if (s == brown) b.attachImage(treeIntersect);
  else if (e == green && w == green) b.attachImage(treetopCenter);
  else if (w != green) b.attachImage(treetopW);
  else if (e != green) b.attachImage(treetopE);
}
