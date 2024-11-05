ArrayList<Mover> movers;
int count = 0;
boolean centerHeld = false;
float connectionDist = 150;

void setup() {
  //size(960, 1080);
  //size(640, 360);
  fullScreen();
  surface.setResizable(true);
  movers = new ArrayList<Mover>();
  for (int i = 0; i < count; i++) {
    movers.add(new Mover());
  }
}

void draw() {
  //background(100, 100, 255);
  background(0);
  int i = 0;
  while (i < movers.size()) {
    Mover m = movers.get(i);
    m.act();
    m.show();
    m.showConnections(movers);
    m.touchingMouse();
    if (m.kill) {
      movers.remove(i);
    } else i++;
  }
  if (centerHeld) {
    fill(255, 50);
    stroke(255);
    strokeWeight(2);
    circle(mouseX, mouseY, connectionDist*2);
    line(mouseX, mouseY+connectionDist, mouseX, mouseY-connectionDist);
    line(mouseX, mouseY+connectionDist, mouseX, mouseY-connectionDist);
  }
}

void mousePressed() {
  if (mouseButton == LEFT) movers.add(new Mover(mouseX, mouseY));
  if (mouseButton == CENTER) centerHeld = true;
}

void mouseReleased() {
  if (mouseButton == CENTER) centerHeld = false;
}
