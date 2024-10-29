// Connor Tsoi
// Computer Programming 12
// Block 1-4
// October 22, 2024

import fisica.*;

//Palette
color red = color(255, 51, 51);
color orange = color(255, 128, 51);
color yellow = color(255, 255, 51);
color green = color(51, 153, 51);
color blue = color(51, 51, 255);
color purple = color(128, 51, 128);
color brown = color(102, 51, 0);
color pink = color(255, 153, 204);
color grey = color(128, 128, 128);
color black = color(0);
color white = color(255);

//Keyboard Booleans
boolean wKey = false;
boolean aKey = false;
boolean sKey = false;
boolean dKey = false;
boolean upKey = false;
boolean leftKey = false;
boolean downKey = false;
boolean rightKey = false;

//Fisica
FWorld world;
FBox leftPlatform;
FBox rightPlatform;
FCircle[] leftPlayers = new FCircle[3];
FCircle[] rightPlayers = new FCircle[3];
int playerD = 48;
FPoly leftNet;
FPoly rightNet;
FCircle ball;
int ballD = 24;
int ballChangeCooldown = 0;
FBody newPossessor;
float closest = 1000;
ArrayList<PVector> leftNetVertices;
ArrayList<PVector> rightNetVertices;

//Player Controller
int leftControlling = 0;
int rightControlling = 0;
FBody hasBall = null;

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
  leftNetVertices = new ArrayList<PVector>();
  rightNetVertices = new ArrayList<PVector>();
  leftNetVertices.add(new PVector(-75, -250));
  leftNetVertices.add(new PVector(75, -250));
  leftNetVertices.add(new PVector(75, -225));
  leftNetVertices.add(new PVector(-50, -225));
  leftNetVertices.add(new PVector(-50, 225));
  leftNetVertices.add(new PVector(75, 225));
  leftNetVertices.add(new PVector(75, 250));
  leftNetVertices.add(new PVector(-75, 250));
  rightNetVertices.add(new PVector(75, -250));
  rightNetVertices.add(new PVector(-75, -250));
  rightNetVertices.add(new PVector(-75, -225));
  rightNetVertices.add(new PVector(50, -225));
  rightNetVertices.add(new PVector(50, 225));
  rightNetVertices.add(new PVector(-75, 225));
  rightNetVertices.add(new PVector(-75, 250));
  rightNetVertices.add(new PVector(75, 250));
  createWorld();
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
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

void score(boolean blueScored) {
  if (blueScored) blueScore++;
  else redScore++;
  freeze = 100;
  mode = FREEZE;
  //leftPlayers[0].setPosition(width/2 - 500, height/2);
  //leftPlayers[1].setPosition(width/2 - 750, height/2 - 75);
  //leftPlayers[2].setPosition(width/2 - 750, height/2 + 75);
  //rightPlayers[0].setPosition(width/2 + 500, height/2);
  //rightPlayers[1].setPosition(width/2 + 750, height/2 - 75);
  //rightPlayers[2].setPosition(width/2 + 750, height/2 + 75);
  //leftPlayers[0].setRotation(0);
  //leftPlayers[1].setRotation(0);
  //leftPlayers[2].setRotation(0);
  //rightPlayers[0].setRotation(PI);
  //rightPlayers[1].setRotation(PI);
  //rightPlayers[2].setRotation(PI);
  //ball.setPosition(width/2, height/2);
  world.clear();
  world.setEdges();
  world.setEdgesRestitution(1);
  makePlayers();
  makeNets();
  makeBall();
  wKey = aKey = sKey = dKey = upKey = leftKey = downKey = rightKey = false;
  hasBall = null;
  game();
}

void createWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 0);
  world.setEdges();
  world.setEdgesRestitution(1);
  makePlayers();
  makeNets();
  makeBall();
}
