class Player {
  /*
  Class variables
   */
  // player vars
  float px;
  float py;
  float pw;
  float ph;

  // movement booleans
  boolean isJumping;
  boolean isAttacking;
  boolean isDucking;
  boolean isStanding;

  // speed vars
  float crouchSpeed;
  float standSpeed;

  // jump var
  float initialVel;
  float initialY;
  float jumpVel;
  float jumpGrav;

  // declare melee hitbox starting vars
  float meleeX;
  float meleeY;

  // crouching height
  float crouchY;
  float crouchHeight;
  float standY;
  float standingHeight;

  // declaring player hitbox
  float pLeft;
  float pRight;
  float pTop;
  float pBottom;

  // declaring melee hitbox
  float mLeft;
  float mRight;
  float mTop;
  float mBottom;

  Animation animation;

  /*
  Constructor
   */

  Player(float startingX, float startingY, float startingW, float startingH, Animation startingAnimation) {
    // initialize value of all the vars
    px = startingX;
    py = startingY;
    pw = startingW;
    ph = startingH;

    // movment booleans set to false
    isJumping = false;
    isAttacking = false;
    isDucking = false;
    isStanding = false;

    // initializing speed vars
    crouchSpeed = 3;
    standSpeed = 2;

    // initialize jump vars
    initialVel = 10;
    initialY = height - ph/2;
    jumpVel = initialVel;
    jumpGrav = 0.5;

    // initialize crouching vars
    crouchY = py + ph/4;
    crouchHeight = height + ph/4;
    standY = py;
    standingHeight = ph;

    // initializing melee hitbox starting vars
    meleeX = px + pw;
    meleeY = py;

    animation = startingAnimation;
  }

  /*
  draws the player
   */
  void render() {
    // draw player
    ninjaAnimation.isAnimating = true;
    ninjaAnimation.display(int(px), int(py));

    // define hitbox vars
    pLeft = px - pw/2;
    pRight = px + pw/2;
    pTop = py - ph/2;
    pBottom = py + ph/2;
  }

  ////////////////////////////////////////////////////////
  // Section: player jump functions
  ////////////////////////////////////////////////////////

  void gravJump() {
    if (isJumping == true) {
      py -= jumpVel;
      jumpVel -= jumpGrav;
      if (py > height - ph/2) {
        isJumping = false;
        jumpVel = initialVel;
        py = height - ph/2;
      }
    }
  }

  ////////////////////////////////////////////////////////
  // Section: player crouch functions
  ////////////////////////////////////////////////////////

  void crouching() {
    // if the key is pressed
    // then start ducking
    if (isDucking == true) {
      py += crouchSpeed;
    }
  }

  void crouchPosition() {
    // if player y has reached crouch height
    // then stop crouching
    if (py >= crouchHeight) {
      isStanding = true;
      isDucking = false;
    }
  }

  void standing() {
    // if no longer crouching
    // then start standing
    if (isStanding == true) {
      py -= standSpeed;
    }
  }

  void standPosition() {
    // if the y value of player is back to original value
    // then stop increasing height
    if (py <= height - ph/2) {
      isStanding = false;
    }
  }

  ////////////////////////////////////////////////////////
  // Section: player attack functions
  ////////////////////////////////////////////////////////

  void attack() {
    if (isAttacking == true) {
      // define melee hitbox vars
      mLeft = meleeX - pw/2;
      mRight = meleeX + pw/2;
      mTop = meleeY - ph/2;
      mBottom = meleeY + ph/2;
    }
  }
}
