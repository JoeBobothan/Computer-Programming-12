import fisica.*;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color white    = color(255);
color black = color(0);

//Keyboard Booleans
boolean wKey = false;
boolean aKey = false;
boolean sKey = false;
boolean dKey = false;
boolean upKey = false;
boolean leftKey = false;
boolean downKey = false;
boolean rightKey = false;

//Score
int leftScore;
int rightScore;

//Fisica
FWorld world;
FBox leftPlatform;
FBox rightPlatform;
FBox leftPlayer;
FBox rightPlayer;
FBox net;
FCircle ball;

void setup() {
  size(1000, 750);
  createWorld();
}

void draw() {
  background(yellow);
  handlePlayerInput();
  if (hitGround(leftPlatform)) {
    rightScore++;
    reset();
  }
  if (hitGround(rightPlatform)) {
    leftScore++;
    reset();
  }
  world.step();
  world.draw();
  fill(0);
  textSize(30);
  text(leftScore, width/2 - 100, 50);
  text(rightScore, width/2 + 100, 50);
}

void createWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 981);
  world.setEdges();
  makeFloor();
  makePlayers();
  makeNet();
  makeBall();
}

void reset() {
  net.setPosition(width/2, 549);
  leftPlayer.setPosition(width/4, 599);
  rightPlayer.setPosition(width*3/4, 599);
  ball.setPosition(width/2, 0);
  leftPlatform.setPosition(width/4, 700);
  rightPlatform.setPosition(width*3/4, 700);
}
