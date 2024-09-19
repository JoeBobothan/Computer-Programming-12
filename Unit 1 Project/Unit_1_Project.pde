// Connor Tsoi
// Computer Programming 12
// Block 1-4
// September 18, 2024

int mode;
final int INTRO = 0;
final int GAME = 1;
final int WIN = 2;

int map;
final int M0 = 0;
final int M1 = 1;
final int M2 = 2;
final int M3 = 3;
final int M4 = 4;
final int M5 = 5;
final int M6 = 6;
final int M7 = 7;
final int M8 = 8;
final int M9 = 9;

ArrayList<Wall> walls;

float ballX, ballY;
int ballD;
boolean draggingBall = false;
PVector ballV = new PVector(0, 0);

String debugger = "hi";

void setup() {
  size(750, 1000);
  rectMode(CENTER);
  walls = new ArrayList<Wall>();
  
  // Ball Variables
  ballX = width/2;
  ballY = 850;
  ballD = 50;
  
  mode = GAME;
}

void draw() {
  push();
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == WIN) {
    win();
  } else {
    println("Invalid mode");
    noLoop();
  }
  pop();
}
