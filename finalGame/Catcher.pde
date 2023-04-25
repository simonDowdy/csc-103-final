class Catcher {
  /*
  Class variables
   */
  // declaring catcher vars
  int catcherX;
  int catcherY;
  int catcherW;
  int catcherH;

  // declare speed vars
  int cSpeed;

  // declare movement booleans
  boolean isMovingLeft;
  boolean isMovingRight;

  // declare hitbox
  float cLeft;
  float cRight;
  float cTop;
  float cBottom;

  /*
  Constructor
   */
  Catcher(int startingX, int startingY, int startingW, int startingH) {
    // initializing the catchers vars
    catcherX = startingX;
    catcherY = startingY;
    catcherW = startingW;
    catcherH = startingH;

    // initialize speed
    cSpeed = 15;

    // set boolean to false
    isMovingLeft = false;
    isMovingRight = false;
  }

  void render() {
    // draw catcher
    //fill(100, 0, 150);
    //rect(catcherX, catcherY, catcherW, catcherH);
    image(handCatcher, catcherX, catcherY);

    // define hitbox vars
    cLeft = catcherX - catcherW/2;
    cRight = catcherX + catcherW/2;
    cTop = catcherY - catcherH/2;
    cBottom = catcherY + catcherH/2;
  }

  void moveLeft() {
    // if the key is pressed
    // then move catcher to the left
    if (isMovingLeft == true && catcherX - catcherW/2 >= 0) {
      catcherX -= cSpeed;
    }
  }

  void moveRight() {
    // if the key is pressed
    // then move catcher to the right
    if (isMovingRight == true && catcherX + catcherW/2 <= width) {
      catcherX += cSpeed;
    }
  }

  void collision(Droplet aDroplet) {
    // if the catcher and the water hitboxes touch
    // then print out something
    if (cTop < aDroplet.dropBottom) {
      if (cBottom > aDroplet.dropTop) {
        if (cLeft < aDroplet.dropRight) {
          if (cRight > aDroplet.dropLeft) {
            aDroplet.shouldRemoveDroplet = true;
            game3Score += 1;
          }
        }
      }
    }
  }
}
