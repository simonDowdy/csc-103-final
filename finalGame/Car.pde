class Car {
  /*
  Class variables
   */
  // declaring car vars
  float carX;
  float carY;
  float carW;
  float carH;
  color carC;

  // declare car speed
  float carSpeed;

  // declare booleans for car movement
  boolean isCarMoving;

  // declaring the movement booleans
  boolean isMovingLeft;
  boolean isMovingRight;

  // declare car turn away speed
  float veerSpeed;

  boolean shouldRemoveCar;

  // declaring hitbox
  float carLeft;
  float carRight;
  float carTop;
  float carBottom;

  float carDistance;

  // boolean for losing a life
  boolean shouldLoseLife;
  boolean isColorMatch;
  boolean isNotColorMatch;


  /*
  Constructor
   */
  Car() {
    // initialize car vars
    carX = width/2;
    carY = 13*height/30;
    carW = 10;
    carH = 10;
    carC = color(200);

    // declare car speed
    carSpeed = random(2, 4);

    // declare booleans for car movement
    isCarMoving = false;

    // setting movement booleans to false
    isMovingLeft = false;
    isMovingRight = false;

    // initializing car turn away speed
    veerSpeed = random(22, 25);

    // initialize removing boolean
    shouldRemoveCar = false;

    carDistance = random(25, 50);

    // setting boolean to false
    shouldLoseLife = false;
    isColorMatch = false;
    isNotColorMatch = false;
  }

  void render() {
    // draw car
    fill(carC);
    rect(carX, carY, carW, carH);
    //imageMode(CENTER);
    //image(redBMW, int(carX), int(carY));

    carBottom = carY + carH/2;
    carTop = carY - carH/2;
    carRight = carX + carW/2;
    carLeft = carX - carW/2;
  }

  void moveCloser() {
    // if the boolean is changed to true
    // then make the car come towards the driver
    if (isCarMoving == true) {
      carH += carSpeed;
      carW += carSpeed;
      //redBMW.loadPixels();
      //redBMW.resize(int(redBMW.height + carSpeed), int(redBMW.width + carSpeed));
      //redBMW.updatePixels();
    }
  }

  void moveLeft() {
    // if the driver moves left
    // then the oncoming traffic should veer off screen to the right
    if (isMovingLeft == true && carW >= carDistance) {
      carX += veerSpeed;
    }
  }

  void moveRight() {
    // if the driver moves right
    // then the car should veer off screen to the left
    if (isMovingRight == true && carW >= carDistance) {
      carX -= veerSpeed;
    }
  }

  void checkRemove() {
    if (carX - carW/2 >= width) {
      shouldRemoveCar = true;
      game2Score += 1;
    }

    if (carX + carW/2 <= 0) {
      shouldRemoveCar = true;
      game2Score += 1;
    }
  }

  void collision() {
    if (carLeft < 0 && shouldLoseLife == false && carC != car1C) {
      shouldLoseLife = true;
      startingLife -= 1;
    }

    if (carRight > width && shouldLoseLife == false && carC != car2C) {
      shouldLoseLife = true;
      startingLife -= 1;
    }
  }

  void loseLife() {
    if (startingLife <= 0) {
      state = 6;
    }
  }
}
