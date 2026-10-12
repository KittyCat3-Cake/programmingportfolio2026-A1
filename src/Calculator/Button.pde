class Button {
  // Member Variables
  float x, y, w, h;
  color c1, c2;
  char val;
  boolean hover;

  // Constructor
  Button(float x, float y, float w, float h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    c1 = color(#48E1ED);
    c2 = color (#E341F0);
    this.val = val;
    hover = false;
  }

  // Member Methods
  void display () {
    if (hover == true) {
      fill(c1);
    } else {
      fill(c2);
    }
    rect(x, y, w, h);
    fill(0);
    if (val == 's') {
      text("x²", x+15, y+25);
    } else {
      text(val, x+15, y+25);
      textSize(25);
    }
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX > x-w/2 && tempX < x+w/2 && tempY > y-h/2 && tempY < y+h/2) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
