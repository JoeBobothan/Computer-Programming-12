Button[] myButtons;
int n = 4;

// colour pallette
color red = color(255, 51, 51);
color orange = color(255, 128, 51);
color yellow = color(255, 255, 51);
color green = color(51, 255, 51);
color blue = color(51, 51, 255);
color purple = color(128, 51, 128);
color brown = color(102, 51, 0);
color pink = color(255, 153, 204);
color grey = color(128, 128, 128);
color black = color(0, 0, 0);
color white = color(255, 255, 255);

boolean mouseReleased;
boolean wasPressed;

color bgColour = white;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  myButtons = new Button[4];
  myButtons[0] = new Button("Blue", width/4, height/4, width/3, height/3, blue, green);
  myButtons[1] = new Button("Purple", width*3/4, height/4, width/3, height/3, purple, pink);
  myButtons[2] = new Button("Red", width/4, height*3/4, width/3, height/3, red, yellow);
  myButtons[3] = new Button("Black", width*3/4, height*3/4, width/3, height/3, black, white);
}

void draw() {
  background(bgColour);
  click();
  for (int i = 0; i < n; i++) {
    if (myButtons[i].clicked) {
      bgColour = myButtons[i].normal;
    }
    myButtons[i].show();
  }
}
