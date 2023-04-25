class Driver {
  /*
  Class variables
   */
  // driver vars
  float driverX;
  float driverY;
  float driverW;
  float driverH;

  // declare hitbox for driver
  float dLeft;
  float dRight;
  float dTop;
  float dBottom;

  /*
  Constructor
   */
  Driver() {
    // initialize driver vars
    driverX = width/2;
    driverY = height;
    driverW = 300;
    driverH = 460;
  }

  void render() {
    //fill(255);
    //rect(driverX, driverY, driverW, driverH);
    
    dTop = driverY - driverH/2;
    dBottom = driverY + driverH/2;
    dRight = driverX + driverW/2;
    dLeft = driverX - driverW/2;
  }

  void collision(Car aCar) {
    if (dTop < aCar.carBottom) {
      if (dBottom > aCar.carTop) {
        if (dRight > aCar.carLeft) {
          if (dLeft < aCar.carRight) {
            aCar.shouldRemoveCar = true;
            state = 6;
          }
        }
      }
    }
  }
}
