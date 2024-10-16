class Button {

  //instance variables
  float x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;
  PImage img;
  boolean invertColours = false;

  //constructor
  Button(String t, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    highlight = high;
    normal = norm;
    clicked = false;
  }

  Button(PImage pic, int _x, int _y, int _w, int _h, color norm, color high) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    highlight = high;
    normal = norm;
    clicked = false;
    img = pic;
  }

  //behaviour functions
  boolean touchingMouse() {
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) return true;
    else return false;
  }
  
  void invertColours() {
    color placeHolder = color(red(normal), green(normal), blue(normal));
    normal = color(red(highlight), green(highlight), blue(highlight));
    highlight = placeHolder;
  }

  void show() {
    drawRect();
    drawLabel();
    checkForClick();
  }

  void drawRect() {
    if (/*touchingMouse()*/!invertColours) {
      fill(highlight);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    int r;
    if (img != null) r = 0;
    else r = 30;
    rect(x, y, w, h, r);
  }
  void drawLabel() {
    if (/*touchingMouse()*/!invertColours) {
      fill(normal);
    } else {
      fill(highlight);
    }
    if (img == null) {
      textSize(w/5);
      text(text, x, y);
    } else {
      image(img, x, y, w, h);
    }
  }
  void checkForClick() {
    if (mouseReleased && touchingMouse()) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
