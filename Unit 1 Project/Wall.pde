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
    rect(0, 0, Width, Height);
    pop();
  }
  
  
  
}
