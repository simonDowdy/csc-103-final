class Squirrel {
  /*
  Class variables
   */

  // declaring sign vars
  float sqX;
  float sqY;
  float sqW;
  float sqH;

  // squirrel speed vars
  float sqSpeed;

  // declaring hitbox
  float sqLeft;
  float sqRight;
  float sqTop;
  float sqBottom;

  // declaring squirrel removing boolean
  boolean shouldRemoveSquirrel;

  Animation animation;
  PImage deadSquirrel;

  /*
  Constructor
   */
  Squirrel() {
    // initializing squirrel vars
    sqW = 20;
    sqH = 20;
    sqX = width - sqW/2;
    sqY = height - sqH/2;

    // initialize squirrel speed
    sqSpeed = 5;

    // setting should remove boolean to false
    shouldRemoveSquirrel = false;

    PImage[] squirrelImages = new PImage[6];
    deadSquirrel = loadImage("deadSquirrel0.png");

    for (int i = 0; i<squirrelImages.length; i++) {
      squirrelImages[i] = loadImage("squirrel" + i + ".png");
    }
    animation = new Animation(squirrelImages, 0.2, 1);
  }

  void render() {
    // draw squirrel
    //fill(118, 83, 16);
    //rect(sqX, sqY, sqW, sqH);
    animation.display(int(sqX), int(sqY));

    // define hitbox vars
    sqLeft = sqX - sqW/2;
    sqRight = sqX + sqW/2;
    sqTop = sqY - sqH/2;
    sqBottom = sqY + sqH/2;
  }

  void move() {
    sqX -= sqSpeed;
    animation.isAnimating = true;
  }

  void checkRemove() {
    if (sqX + sqW/2 <= 0) {
      shouldRemoveSquirrel = true;
    }
  }

  void collision(Player aPlayer) {
    // if the player touches the squirrels hitbox
    // then print out something
    if (sqLeft < aPlayer.mRight) {
      if (sqTop < aPlayer.mBottom) {
        if (sqBottom > aPlayer.mTop) {
          if (aPlayer.isAttacking == true) {
            shouldRemoveSquirrel = true;
            game1Score += 1;
            image(deadSquirrel, int(sqX), int(sqY));
          }
        }
      }
    }
  }

  void squirrelAttack(Player aPlayer) {
    if (sqLeft < aPlayer.pRight) {
      if (sqRight > aPlayer.pLeft) {
        if (sqTop < aPlayer.pBottom) {
          if (sqBottom > aPlayer.pTop) {
            //println("squirrel got player");
          }
        }
      }
    }
  }
}
