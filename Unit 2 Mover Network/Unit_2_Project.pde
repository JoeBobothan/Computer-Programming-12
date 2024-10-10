ArrayList<Mover> movers;
int count = 100;

void setup() {
  //size(600, 600);
  fullScreen();
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
}

void mousePressed() {
  if (mouseButton == LEFT) movers.add(new Mover(mouseX, mouseY));
}
