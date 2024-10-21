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
FPoly leftPlayer;
FPoly rightPlayer;
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
  PVector ballVelocity = new PVector(ball.getVelocityX(), ball.getVelocityY());
  if (ballVelocity.mag() > 1000) {
    ballVelocity.limit(1000);
    ball.setVelocity(ballVelocity.x, ballVelocity.y);
  }
  world.step();
  if (leftPlayer.getX() > width/2 - 60) leftPlayer.setPosition(width/2 - 60, leftPlayer.getY());
  if (rightPlayer.getX() < width/2 + 60) rightPlayer.setPosition(width/2 + 60, rightPlayer.getY());
  world.draw();
  fill(0);
  textSize(30);
  text(leftScore, width/2 - 100, 50);
  text(rightScore, width/2 + 100, 50);
  textSize(10);
  textAlign(CENTER, CENTER);
  if (wKey) text("w held", mouseX, mouseY-25);
  if (aKey) text("a held", mouseX-35, mouseY-10);
  if (sKey) text("s held", mouseX, mouseY-10);
  if (dKey) text("d held", mouseX+35, mouseY-10);
  //text(ballVelocity.mag(), width/2, 30);
}

void createWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 981);
  world.setEdges();
  world.setEdgesRestitution(0.1);
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

  net.setVelocity(0, 0);
  leftPlayer.setVelocity(0, 0);
  rightPlayer.setVelocity(0, 0);
  ball.setVelocity(0, 0);
  leftPlatform.setVelocity(0, 0);
  rightPlatform.setVelocity(0, 0);

  net.resetForces();
  leftPlayer.resetForces();
  rightPlayer.resetForces();
  ball.resetForces();
  leftPlatform.resetForces();
  rightPlatform.resetForces();
}
