ArrayList<Mover> movers;
int count = 25;

void setup() {
  size(600, 600);
  movers = new ArrayList<Mover>();
  for (int i = 0; i < count; i++) {
    movers.add(new Mover());
  }
}

void draw() {
  background(100, 100, 255);
  for (Mover m : movers) {
    m.act();
    m.show();
    m.showConnections(movers);
  }
}
