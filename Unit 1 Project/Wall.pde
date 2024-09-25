class Wall {
  int Xpos, Ypos;
  int Width, Height;
  Wall (int x, int y, int w, int h) {
    Xpos = x;
    Ypos = y;
    Width = w;
    Height = h;
  }

  void show() {
    push();
    translate(Xpos, Ypos);
    stroke(0);
    strokeWeight(5);
    fill(255);
    rect(0, 0, Width, Height);
    //fill(255, 100);
    //rect(0, 0, Width + ballD, Height + ballD);
    //line(- Width/2 - 100, - Height/2 + 100, - Width/2 + 100, - Height/2 - 100);
    pop();
  }
}
