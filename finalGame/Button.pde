class Button {
  int bx;
  int by;
  int bw;
  int bh;
  color bc;

  Button(int aButX, int aButY, int aButW, int aButH, color aButC) {
    bx = aButX;
    by = aButY;
    bw = aButW;
    bh = aButH;
    bc = aButC;
  }

  //draws the button
  void render() {
    fill(bc);
    stroke(bc);
    rect(bx, by, bw, bh, 10);
  }

  void drawText() {
    int size = 40;

    fill(0);
    textSize(size);
    text("PLAY", bx-size, by+1*size/3);
  }

  boolean isPressed() {
    if (mousePressed == true && isInButton() == true) {
      return true;
    } else {
      return false;
    }
  }

  boolean isBetween(int num, int min, int max) {
    if (num >= min && num <= max) {
      return true;
    } else {
      return false;
    }
  }

  boolean isInButton() {
    int left = bx - bw/2;
    int right = bx + bw/2;
    int top = by - bh/2;
    int bottom = by + bh/2;
    if (isBetween(mouseX, left, right) == true
      && isBetween(mouseY, top, bottom) == true) {
      return true;
    } else {
      return false;
    }
  }
}
