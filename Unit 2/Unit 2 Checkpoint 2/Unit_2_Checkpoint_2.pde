ArrayList <Button> myButtons;

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

PImage mandelbrot;

void setup() {
  size(600, 600);
  mandelbrot = loadImage("data/Mandelbrot.png");
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  myButtons = new ArrayList<Button>();
  myButtons.add(new Button("Blue", width/4, height/4, width/3, height/3, blue, green));
  myButtons.add(new Button("Purple", width*3/4, height/4, width/3, height/3, purple, pink));
  myButtons.add(new Button("Red", width/4, height*3/4, width/3, height/3, red, yellow));
  myButtons.add(new Button(mandelbrot, width*3/4, height*3/4, width/3, height/3, black, white));
}

void draw() {
  click();
  background(bgColour);
  for (int i = 0; i < myButtons.size(); i++) {
    if (myButtons.get(i).clicked) {
      bgColour = myButtons.get(i).normal;
    }
    myButtons.get(i).show();
  }
}
