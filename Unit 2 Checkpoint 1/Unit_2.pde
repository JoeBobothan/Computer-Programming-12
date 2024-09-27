Mover[] myMovers;
int n = 25;

void setup() {
  size(600, 600);
  myMovers = new Mover[n];
  for (int i = 0; i < n; i++) {
    myMovers[i] = new Mover();
  }
}

void draw() {
  //background(0);
  for (int i = 0; i < n; i++) {
    myMovers[i].act();
    myMovers[i].show();
  }
}
