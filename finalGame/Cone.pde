class Cone {
  /*
  Class variables
   */

  // declaring sign vars
  float coneX;
  float coneY;
  float coneW;
  float coneH;

  // Cone speed vars
  float coneSpeed;

  // declaring hitbox
  float coneLeft;
  float coneRight;
  float coneTop;
  float coneBottom;

  // declaring cone removing boolean
  boolean shouldRemoveCone;
  
  PImage coneImage;

  /*
  Constructor
   */
  Cone() {
    // initializing cone vars
    coneW = 20;
    coneH = 50;
    coneX = width - coneW/2;
    coneY = height - coneH/2;

    // initialize Cone speed
    coneSpeed = 5;

    // setting should remove boolean to false
    shouldRemoveCone = false;
    
    coneImage = loadImage("cone0.png");
    
    coneImage.resize(int(coneImage.width*2), int(coneImage.height*3));
  }

  void render() {
    // draw cone
    //fill(0);
    //rect(coneX, coneY, coneW, coneH);
    image(coneImage, int(coneX), int(coneY));
    

    // define hitbox vars
    coneLeft = coneX - coneW/2;
    coneRight = coneX + coneW/2;
    coneTop = coneY - coneH/2;
    coneBottom = coneY + coneH/2;
  }

  void move() {
      coneX -= coneSpeed;
  }

  void checkRemove() {
    if (coneX + coneW/2 <= 0) {
      shouldRemoveCone = true;
    }
  }

  void collision(Player p1) {
    // if the player touches the Cones hitbox
    // then print out something
    if (coneLeft < p1.pRight) {
      if (coneRight > p1.pLeft) {
        if (coneTop < p1.pBottom) {
          if (coneBottom > p1.pTop) {
            shouldRemoveCone = true;
            state += 1;
          }
        }
      }
    }
  }
}
