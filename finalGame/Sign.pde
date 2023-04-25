class Sign {
  /*
  Class variables
   */

  // declaring sign vars
  float signW;
  float signH;
  float signX;
  float signY;

  // declare sign speed
  float signSpeed;

  // declaring hitbox
  float signLeft;
  float signRight;
  float signTop;
  float signBottom;

  // declaring cone removing boolean
  boolean shouldRemoveSign;
  
  PImage signImage;

  /*
  Constructor
   */
  Sign() {
    // initialize sign vars
    signW = 20;
    signH = 50;
    signX = width - signW/2;
    signY = 15*height/16 - signH/2;

    // initializing speed
    signSpeed = 5;

    // setting should remove boolean to false
    shouldRemoveSign = false;
    
    signImage = loadImage("sign0.png");
    
    signImage.resize(int(signImage.width), int(signImage.height));
  }

  void render() {
    // draw sign
    stroke(54, 147, 46);
    fill(54, 147, 46);
    rect(signX, signY, signW, signH);
    image(signImage, int(signX), int(signY));

    // define hitbox vars
    signLeft = signX - signW/2;
    signRight = signX + signW/2;
    signTop = signY - signH/2;
    signBottom = signY + signH/2;
  }

  void move() {
    signX -= signSpeed;
  }

  void checkRemove() {
    if (signX + signW/2 <= 0) {
      shouldRemoveSign = true;
    }
  }

  void collision(Player p1) {
    // if the player touches the Cones hitbox
    // then print out something
    if (signLeft < p1.pRight) {
      if (signRight > p1.pLeft) {
        if (signTop < p1.pBottom) {
          if (signBottom > p1.pTop) {
            shouldRemoveSign = true;
            state += 1;
          }
        }
      }
    }
  }
}
