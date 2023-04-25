class Droplet {
  /*
  Class variables
   */

  // declaring droplet vars
  float dropletX;
  float dropletY;
  float dropletD;
  color dropletC;

  // droplet speed
  float dripSpeed;

  // declare boolean for if droplet is dropping
  boolean dropletIsFalling;

  // declare hitbox
  float dropLeft;
  float dropRight;
  float dropTop;
  float dropBottom;

  // boolean to remove unwanted droplets
  boolean shouldRemoveDroplet;
  boolean isDropletTooLow;

  /*
  Constructor
   */

  Droplet() {
    // initializing my water specs
    dropletX = random(dropletD, width-dropletD);
    dropletY = random(0, height/2);
    dropletD = random(10, 40);
    dropletC = color(47, 64, 234);

    // initialize speed var
    dripSpeed = random(1, 3);

    // set boolean to false
    dropletIsFalling = false;

    // setting remove boolean to false
    shouldRemoveDroplet = false;
    isDropletTooLow = false;
  }

  void render() {
    // draw droplet droplets
    //fill(dropletC);
    fill(rainGameImage.get(100, 100));
    circle(dropletX, dropletY, dropletD);

    // define hitbox vars
    dropLeft = dropletX - dropletD/2;
    dropRight = dropletX + dropletD/2;
    dropTop = dropletY - dropletD/2;
    dropBottom = dropletY + dropletD/2;
  }

  void drip() {
    // if the key is pressed
    // then the droplet should start to fall
    if (dropletIsFalling == true) {
      dropletY += dripSpeed;
    }
  }

  void checkRemove(Droplet otherDroplet) {
    if (dropletY == otherDroplet.dropletY) {
      if (dropletX == otherDroplet.dropletX) {
        shouldRemoveDroplet = true;
      } else if (otherDroplet.dropletY == dropletY) {
        if (otherDroplet.dropletX == dropletX) {
          shouldRemoveDroplet = true;
        }
      }
    }

    if (dropBottom >= height && isDropletTooLow == false) {
      isDropletTooLow = true;
      startingLife -= 1;
    }
  }

  void loseLife() {
    if (startingLife <= 0) {
      state = 9;
    }
  }

  void collision(Droplet otherDroplet) {
    if (dropTop < otherDroplet.dropBottom) {
      if (dropBottom > otherDroplet.dropTop) {
        if (dropLeft < otherDroplet.dropRight) {
          if (dropRight > otherDroplet.dropLeft) {
            // if the current droplet is to the above the otherDroplet
            if (dropletY <= otherDroplet.dropletY) {
              dropletY = otherDroplet.dropletY; // combine the droplets
              dropletX = otherDroplet.dropletX;

              if (dripSpeed > otherDroplet.dripSpeed) {
                otherDroplet.dripSpeed = dripSpeed;
              }

              if (dropletD <= otherDroplet.dropletD) {
                dropletD = otherDroplet.dropletD;
              } else {
                otherDroplet.dropletD = dropletD;
              }
            }
          }
        }
      }
    }
  }
}
