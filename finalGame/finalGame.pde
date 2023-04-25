
// var representing what state we are in
int state = 0;

// declaring classes
Player p1;
Catcher c1;
Driver d1;

// declaring buttons
Button b1;
Button b2;
Button b3;

// Animation vars
Animation ninjaAnimation;
PImage[] ninjaImages = new PImage[2];

ArrayList<PImage> squirrelImages = new ArrayList<PImage>();

// declaring arrayList
ArrayList<Cone> cones;
ArrayList<Sign> signs;
ArrayList<Squirrel> squirrels;
ArrayList<Droplet> droplets;
ArrayList<Car> cars;

// declaring image vars
PImage carSeatImage;
PImage carWindshield;
PImage redBMW;
PImage rainGameImage;
PImage carGameImage;
PImage ninjaGameImage;
PImage handCatcher;

// declaring vars to use for player parameters
int p1StartingX;
int p1StartingY;
int p1StartingW;
int p1StartingH;

// declaring vars to use for catcher parameters
int c1StartingX;
int c1StartingY;
int c1StartingW;
int c1StartingH;

// vars representing timer
int startTime;
int currentTime;
int interval;

// declaring global vars for games starting score
int game1Score;
int game2Score;
int game3Score;


// declaring score positions for games
int scoreX;
int scoreY;

// declaring lives for player
int startingLife;

// declaring end screen colors
color scoreC;
color endScreenC;

// declaring game 1 intervals
int lowInterval;
int highInterval;

// draw color bar
color car1C;
color car2C;
int barX;
color barC;






////////////////////////////////////////////////////////
// Section: setup function
////////////////////////////////////////////////////////

void setup() {
  // settings
  size(800, 600);
  rectMode(CENTER);

  // initializing player parameter vars
  p1StartingH = 50;
  p1StartingW = 50;
  p1StartingX = width/4;
  p1StartingY = height - p1StartingH/2;

  // initializing catcher parameter vars
  c1StartingH = 50;
  c1StartingW = 200;
  c1StartingX = width/2;
  c1StartingY = 7*height/8;

  // initializing regular classes
  p1 = new Player(p1StartingX, p1StartingY, p1StartingW, p1StartingH, ninjaAnimation);
  c1 = new Catcher(c1StartingX, c1StartingY, c1StartingW, c1StartingH);
  d1 = new Driver();

  // initialize buttons
  b1 = new Button(3*width/4, 4*height/5, 100, 50, color(255));
  b2 = new Button(3*width/4, 4*height/5, 100, 50, color(255));
  b3 = new Button(1*width/4, 4*height/5, 100, 50, color(255));

  // initializing ArrayLists
  cones = new ArrayList<Cone>();
  signs = new ArrayList<Sign>();
  squirrels = new ArrayList<Squirrel>();
  droplets = new ArrayList<Droplet>();
  cars = new ArrayList<Car>();

  imageMode(CENTER);

  // animation setup stuff
  for (int index=0; index<2; index++) {
    ninjaImages[index] = loadImage("ninjaSprite_" + index + ".png");
  }

  ninjaAnimation = new Animation(ninjaImages, .1, 2);

  //for (int index=0; index<6; index++) {
  //  squirrelImages[index] = loadImage("squirrel" + index + ".png");
  //}

  // initializing image vars
  carSeatImage = loadImage("carseats.jpg");
  carWindshield = loadImage("carWindshield.jpg");
  redBMW = loadImage("BMWred0.png");
  rainGameImage = loadImage("rainyWindow.jpg");
  carGameImage = loadImage("middleSeat.jpg");
  ninjaGameImage = loadImage("rightSeat.jpeg");
  handCatcher = loadImage("hand0.png");
  smooth();

  // set image scale
  float carSeatScale = 3.2;
  carSeatImage.resize(int(carSeatImage.width*carSeatScale),
    int(carSeatImage.height*carSeatScale));

  carWindshield.resize(int(carWindshield.width*3.6),
    int(carWindshield.height*4));
    
  redBMW.resize(int(redBMW.width*.1), int(redBMW.height*.1));

  rainGameImage.resize(int(rainGameImage.width*3),
    int(rainGameImage.height*3));

  carGameImage.resize(int(carGameImage.width*3),
    int(carGameImage.height*3.4));

  ninjaGameImage.resize(int(ninjaGameImage.width*5),
    int(ninjaGameImage.height*5.3));

  handCatcher.resize(int(handCatcher.width*3.125),
    int(handCatcher.height*3));

    // starts the stopwatch
    startTime = millis();

  // represents the time between timer triggers
  interval = 1000;

  // initializing game1 score
  game1Score = 0;
  game2Score = 0;
  game3Score = 0;

  // initializing starting lives
  startingLife = 3;


  // initializing game1 score
  scoreX = 50;
  scoreY = 75;

  // initialize end screen colors
  scoreC = color(255);
  endScreenC = color(0);

  // initializing game 1 intervals
  lowInterval = 1000;
  highInterval = 1500;

  // initialize car color picker
  car1C = color(200, 0, 0);
  car2C = color(100, 0, 150);
}





////////////////////////////////////////////////////////
// Section: draw function
////////////////////////////////////////////////////////

void draw() {
  // call finite state machine
  finiteState();
}






////////////////////////////////////////////////////////
// Section: keyboard functions
////////////////////////////////////////////////////////

void keyPressed() {

  if (key == 'm') {
    if (state == 1) {
      menuReset();
    }
    if (state == 2) {
      menuReset();
    }
    if (state == 3) {
      menuReset();
    }
    if (state == 4) {
      menuReset();
    }
    if (state == 5) {
      menuReset();
    }
    if (state == 6) {
      menuReset();
    }
    if (state == 7) {
      menuReset();
    }
    if (state == 8) {
      menuReset();
    }
    if (state == 9) {
      menuReset();
    }
  }




  ////////////////////////////////////////////////////////
  // Section: if statements case 2
  ////////////////////////////////////////////////////////

  if (state == 2) {

    // if the w key is pressed
    // and if the player is not in the middle of a jump
    // then jump and stop falling
    if (key == 'w' && p1.isJumping == false) {
      p1.isJumping = true;
    }

    // if the m key is pressed
    // and if the player is not in the middle of an attack
    // then start attacking
    if (key == 'd' && p1.isDucking == false
      && p1.isStanding == false
      && p1.isJumping == false) {
      p1.isAttacking = true;
    }

    // if the s key is pressed
    // and if the player is not in the middle of a crouch
    // then the player crouches
    if (key == 's' && p1.isDucking == false
      && p1.isStanding == false) {
      p1.isDucking = true;
    }
  }






  ////////////////////////////////////////////////////////
  // Section: if statements case 3
  ////////////////////////////////////////////////////////

  if (state == 3) {
    if (key == 'r') {
      resetPlayerPosition();
      removeObstacles();
      startTime = millis();
      game1Score = 0;
      state = 2;
    }
  }







  ////////////////////////////////////////////////////////
  // Section: if statements case 5
  ////////////////////////////////////////////////////////

  if (state == 5) {
    for (Car aCar : cars) {
      if (key == 'a' && aCar.isMovingRight == false) {
        aCar.isMovingLeft = true;
      }

      if (key == 'd' && aCar.isMovingLeft == false) {
        aCar.isMovingRight = true;
      }
    }
  }






  ////////////////////////////////////////////////////////
  // Section: if statements case 6
  ////////////////////////////////////////////////////////

  if (state == 6) {
    if (key == 'r') {
      removeObstacles();
      startTime = millis();
      game2Score = 0;
      startingLife = 3;
      state = 5;
    }
  }






  ////////////////////////////////////////////////////////
  // Section: if statements case 8
  ////////////////////////////////////////////////////////

  if (state == 8) {
    // is the a key is pressed
    // then the catch platform moves left
    if (key == 'a') {
      c1.isMovingLeft = true;
    }

    // is the d key is pressed
    // then the catch platform moves right
    if (key == 'd') {
      c1.isMovingRight = true;
    }
  }





  ////////////////////////////////////////////////////////
  // Section: if statements case 9
  ////////////////////////////////////////////////////////

  if (state == 9) {
    if (key == 'r') {
      resetCatcherPosition();
      removeObstacles();
      startTime = millis();
      game3Score = 0;
      startingLife = 3;
      state = 8;
    }
  }
}






void keyReleased() {
  ////////////////////////////////////////////////////////
  // Section: if statements case 2
  ////////////////////////////////////////////////////////

  if (state == 2) {
    if (key == 'd') {
      p1.isAttacking = false;
    }
  }






  ////////////////////////////////////////////////////////
  // Section: if statements case 8
  ////////////////////////////////////////////////////////

  if (state == 8) {
    // if the a key is released
    // then the catching platform stops moving left
    if (key == 'a') {
      c1.isMovingLeft = false;
    }

    // if the d key is released
    // then the catching platform stops moving right
    if (key == 'd') {
      c1.isMovingRight = false;
    }
  }
}






////////////////////////////////////////////////////////
// Section: mouse pressed
////////////////////////////////////////////////////////

void mousePressed() {
  if (state == 0) {
    if (mouseX < 2*width/5) {
      state = 1;
    }
    if (mouseX > 2*width/5 && mouseX < 3*width/5) {
      state = 4;
    }
    if (mouseX > 3*width/5) {
      state = 7;
    }
  }
}






////////////////////////////////////////////////////////
// Section: key pressed functions
////////////////////////////////////////////////////////

void menuReset() {
  resetPlayerPosition();
  resetCatcherPosition();
  removeObstacles();
  startTime = millis();
  game1Score = 0;
  startingLife = 3;
  state = 0;
}



////////////////////////////////////////////////////////
// Section: reset the game functions
////////////////////////////////////////////////////////

void resetPlayerPosition() {
  p1.px = p1StartingX;
  p1.py = p1StartingY;
  p1.pw = p1StartingW;
  p1.ph = p1StartingH;

  p1.isJumping = false;
  p1.isAttacking = false;
  p1.isDucking = false;
  p1.isStanding = false;
}

void resetCatcherPosition() {
  c1.catcherX = c1StartingX;
  c1.catcherY = c1StartingY;
  c1.catcherW = c1StartingW;
  c1.catcherH = c1StartingH;

  c1.isMovingLeft = false;
  c1.isMovingRight = false;
}

void removeObstacles() {
  for (Cone aCone : cones) {
    aCone.shouldRemoveCone = true;
  }

  for (Sign aSign : signs) {
    aSign.shouldRemoveSign = true;
  }

  for (Squirrel aSquirrel : squirrels) {
    aSquirrel.shouldRemoveSquirrel = true;
  }

  for (Droplet aDroplet : droplets) {
    aDroplet.shouldRemoveDroplet = true;
  }

  for (Car aCar : cars) {
    aCar.shouldRemoveCar = true;
  }
}

void removeCone() {
  // for loop that removes unwanted cones
  for (int i = cones.size()-1; i >= 0; i--) {
    Cone aCone = cones.get(i);

    if (aCone.shouldRemoveCone == true) {
      cones.remove(aCone);
    }
  }
}

void removeSign() {
  // for loop that removes unwanted signs
  for (int i = signs.size()-1; i >= 0; i--) {
    Sign aSign = signs.get(i);

    if (aSign.shouldRemoveSign== true) {
      signs.remove(aSign);
    }
  }
}

void removeSquirrel() {
  // for loop that removes unwanted squirrels
  for (int i = squirrels.size()-1; i >= 0; i--) {
    Squirrel aSquirrel = squirrels.get(i);

    if (aSquirrel.shouldRemoveSquirrel== true) {
      squirrels.remove(aSquirrel);
    }
  }
}

void removeDroplet() {
  for (int i = droplets.size()-1; i >= 0; i--) {
    Droplet aDroplet = droplets.get(i);

    if (aDroplet.shouldRemoveDroplet == true) {
      droplets.remove(aDroplet);
    }
  }
}

void removeCar() {
  // for loop that removes unwanted cars
  for (int i = cars.size()-1; i >= 0; i--) {
    Car aCar = cars.get(i);

    if (aCar.shouldRemoveCar == true) {
      cars.remove(aCar);
    }
  }
}






////////////////////////////////////////////////////////
// Section: finite state machine functions
////////////////////////////////////////////////////////

void drawGameScore(int score, int x, int y, color aColor) {
  textSize(50);
  fill(aColor);
  text(score, x, y);
}

void drawLives() {
  int lifeX = width - 50;
  int lifeY = scoreY;

  textSize(50);
  fill(255);
  text(startingLife, lifeX, lifeY);
}



///////////////////////////////// State: CASE 0 ///////////////////////////////////

void drawMenuScreen() {
  image(carSeatImage, width/2, height/2);

  fill(39);
  textSize(80);
  text("Choose Your Chair", width/8, height/8);

  strokeWeight(3);
  stroke(0);
}





///////////////////////////////// State: CASE 1 ///////////////////////////////////

void game1StartScreen() {
  int textY = 50;
  int textX = 30;


  image(ninjaGameImage, width/2, height/2);
  fill(255);

  textSize(50);
  text("Controls", 45, 50);

  textSize(25);
  text("press 'w' key to jump", textX, 2*textY);
  text("press 's' key to duck", textX, 3*textY);
  text("press 'd' key to attack", textX, 4*textY);
}




///////////////////////////////// State: CASE 4///////////////////////////////////

void game2StartScreen() {
  int textY = 50;
  int textX = 30;

  image(carGameImage, width/2, height/2);
  fill(255);

  textSize(50);
  text("Controls", 45, 50);

  textSize(25);
  text("press 'a' key to swerve left", textX, 2*textY);
  text("press 'd' key to swerve right", textX, 3*textY);
}



///////////////////////////////// State: CASE 7 ///////////////////////////////////

void game3StartScreen() {
  int textY = 50;
  int textX = 30;

  image(rainGameImage, width/2, height/2);
  fill(255);

  textSize(50);
  text("Controls", 45, 50);

  textSize(25);
  text("press 'a' key to move left", textX, 2*textY);
  text("press 'd' key to move right", textX, 3*textY);
}


///////////////////////////////// State: CASE 3,6,9 ///////////////////////////////////

void gameEndScreen(int score, color aColor, color backColor) {
  background(backColor);
  fill(aColor);
  textSize(100);
  text("Score: " + score, width/4, height/2);

  textSize(30);
  text("press 'r' to play again", 10, height - 50);
  text("press 'm' to go to menu", 10, 50);
}





///////////////////////////////// State: CASE 2 ///////////////////////////////////

void playerFunctions() {
  // calling player class functions
  p1.render();
  p1.gravJump();
  p1.attack();

  // player crouch functions
  p1.crouching();
  p1.crouchPosition();
  p1.standing();
  p1.standPosition();
}

void obstacleFunctions() {
  // handle everything in Cone ArrayList
  for (Cone aCone : cones) {
    aCone.render();
    aCone.move();
    aCone.collision(p1);
    aCone.checkRemove();
  }

  // handle everything in sign ArrayList
  for (Sign aSign : signs) {
    aSign.render();
    aSign.move();
    aSign.collision(p1);
    aSign.checkRemove();
  }

  // handle everything in squirrel ArrayList
  for (Squirrel aSquirrel : squirrels) {
    aSquirrel.render();
    aSquirrel.move();
    aSquirrel.checkRemove();
    aSquirrel.collision(p1);
    aSquirrel.squirrelAttack(p1);
  }

  // call remove functions
  removeCone();
  removeSign();
  removeSquirrel();
}

void endTimerGame1() {
  getFasterOb();

  if (currentTime - startTime > interval) {
    int n = int(random(0, 3));

    interval = int(random(lowInterval, highInterval));

    if (n == 0) {
      cones.add(new Cone());
    }
    if (n == 1) {
      signs.add(new Sign());
    }
    if (n == 2) {
      squirrels.add(new Squirrel());
    }

    startTime = millis();
  }
}

void getFasterOb() {
  if (game1Score >= 3 && game1Score <= 5) {
    lowInterval = 900;
    highInterval = 1400;
    for (Cone aCone : cones) {
      aCone.coneSpeed = 7;
    }
    for (Sign aSign : signs) {
      aSign.signSpeed = 7;
    }
    for (Squirrel aSquirrel : squirrels) {
      aSquirrel.sqSpeed = 7;
    }
  }

  if (game1Score >= 6 && game1Score <= 9) {
    lowInterval = 800;
    highInterval = 1300;
    for (Cone aCone : cones) {
      aCone.coneSpeed = 8;
    }
    for (Sign aSign : signs) {
      aSign.signSpeed = 8;
    }
    for (Squirrel aSquirrel : squirrels) {
      aSquirrel.sqSpeed = 8;
    }
  }

  if (game1Score >= 10 && game1Score <= 15) {
    lowInterval = 700;
    highInterval = 1100;
    for (Cone aCone : cones) {
      aCone.coneSpeed = 9;
    }
    for (Sign aSign : signs) {
      aSign.signSpeed = 9;
    }
    for (Squirrel aSquirrel : squirrels) {
      aSquirrel.sqSpeed = 9;
    }
  }

  if (game1Score >= 16 && game1Score <= 20) {
    lowInterval = 600;
    highInterval = 900;
    for (Cone aCone : cones) {
      aCone.coneSpeed = 10;
    }
    for (Sign aSign : signs) {
      aSign.signSpeed = 10;
    }
    for (Squirrel aSquirrel : squirrels) {
      aSquirrel.sqSpeed = 10;
    }
  }

  if (game1Score >= 21 && game1Score <= 30) {
    lowInterval = 400;
    highInterval = 700;
    for (Cone aCone : cones) {
      aCone.coneSpeed = 11;
    }
    for (Sign aSign : signs) {
      aSign.signSpeed = 11;
    }
    for (Squirrel aSquirrel : squirrels) {
      aSquirrel.sqSpeed = 11;
    }
  }

  if (game1Score > 30) {
    lowInterval = 200;
    highInterval = 500;
    for (Cone aCone : cones) {
      aCone.coneSpeed = 12;
    }
    for (Sign aSign : signs) {
      aSign.signSpeed = 12;
    }
    for (Squirrel aSquirrel : squirrels) {
      aSquirrel.sqSpeed = 12;
    }
  }
}

void playGame1() {
  playerFunctions();
  obstacleFunctions();
}

///////////////////////////////// State: CASE 5 //////////////////////////////////

void carDriverFunctions() {
  // handle everything in Car ArrayList
  for (Car aCar : cars) {
    aCar.render();
    aCar.moveCloser();
    aCar.moveLeft();
    aCar.moveRight();
    aCar.checkRemove();
    aCar.collision();
    aCar.loseLife();
    d1.collision(aCar);
  }

  // call driver functions
  d1.render();

  // call remove functions
  removeCar();
}

void endTimerGame2() {
  getFasterCar();

  if (currentTime - startTime > interval) {
    interval = int(random(lowInterval, highInterval));
    int n = int(random(0, 2));

    for (int i = cars.size(); i <= 0; i++) {
      cars.add(new Car());

      for (Car aCar : cars) {
        if (n == 0) {
          aCar.carC = color(car1C);
        }

        if (n == 1) {
          aCar.carC = color(car2C);
        }

        aCar.isCarMoving = true;
      }
    }
    startTime = millis();
  }
}



void drawBar(int ax, color ac) {
  // declare local color bar vars
  int w = width/2;
  int h = 30;
  int x = ax;
  int y = height - h/2;
  color c = ac;

  // draw color bar
  stroke(c);
  fill(c);
  rect(x, y, w, h);
}

void getFasterCar() {
  if (game2Score >= 5 && game2Score <= 10) {
    lowInterval = 900;
    highInterval = 1300;
    for (Car aCar : cars) {
      aCar.carSpeed = random(2, 5);
      aCar.veerSpeed = random(20, 25);
      aCar.carDistance = random(40, 60);
    }
  }

  if (game2Score >= 11 && game2Score <= 15) {
    lowInterval = 800;
    highInterval = 1100;
    for (Car aCar : cars) {
      aCar.carSpeed = random(3, 5);
      aCar.veerSpeed = random(18, 23);
      aCar.carDistance = random(50, 70);
    }
  }

  if (game2Score >= 16 && game2Score <= 20) {
    lowInterval = 650;
    highInterval = 900;
    for (Car aCar : cars) {
      aCar.carSpeed = random(3, 6);
      aCar.veerSpeed = random(15, 20);
      aCar.carDistance = random(50, 100);
    }
  }

  if (game2Score >= 21 && game2Score <= 25) {
    lowInterval = 500;
    highInterval = 700;
    for (Car aCar : cars) {
      aCar.carSpeed = random(4, 7);
      aCar.veerSpeed = random(13, 17);
      aCar.carDistance = random(70, 100);
    }
  }

  if (game2Score >= 26 && game2Score <= 30) {
    lowInterval = 400;
    highInterval = 600;
    for (Car aCar : cars) {
      aCar.carSpeed = random(5, 8);
      aCar.veerSpeed = random(12, 16);
      aCar.carDistance = random(80, 100);
    }
  }

  if (game2Score >= 31) {
    lowInterval = 400;
    highInterval = 500;
    for (Car aCar : cars) {
      aCar.carSpeed = random(5, 8);
      aCar.veerSpeed = random(12, 15);
      aCar.carDistance = random(90, 100);
    }
  }
}

void playGame2() {
  //image(outTheWinshield, width/2, height/4);
  image(carWindshield, width/2, height/2);
  carDriverFunctions();
  drawLives();
  drawBar(width/4, car1C);
  drawBar(3*width/4, car2C);
}



///////////////////////////////// State: CASE 8 ////////////////////////////////////

void dropletCatcherFunctions() {
  // calling droplet functions
  for (Droplet aDroplet : droplets) {
    aDroplet.render();
    aDroplet.drip();
    aDroplet.loseLife();
    c1.collision(aDroplet);

    for (Droplet otherDroplet : droplets) {
      if (aDroplet != otherDroplet) {
        aDroplet.collision(otherDroplet);
        aDroplet.checkRemove(otherDroplet);
      }
    }
  }

  // calling catcher functions
  c1.render();
  c1.moveLeft();
  c1.moveRight();

  // call remove functions
  removeDroplet();
}

void endTimerGame3() {
  getFasterDrop();

  if (currentTime - startTime > interval) {
    interval = int(random(lowInterval, highInterval));
    droplets.add(new Droplet());

    for (Droplet aDroplet : droplets) {
      if (droplets.size() >= 1) {
        aDroplet.dropletIsFalling = true;
      }
    }
    startTime = millis();
  }
}

void getFasterDrop() {
  if (game3Score >= 5 && game3Score <= 10) {
    lowInterval = 900;
    highInterval = 1400;
    for (Droplet aDroplet : droplets) {
      aDroplet.dripSpeed = random(1, 4);
    }
  }

  if (game3Score >= 11 && game3Score <= 20) {
    lowInterval = 800;
    highInterval = 1300;
    for (Droplet aDroplet : droplets) {
      aDroplet.dripSpeed = random(1, 5);
    }
  }

  if (game3Score >= 21 && game3Score <= 30) {
    lowInterval = 650;
    highInterval = 1100;
    for (Droplet aDroplet : droplets) {
      aDroplet.dripSpeed = random(2, 5);
    }
  }

  if (game3Score >= 31 && game3Score <= 40) {
    lowInterval = 500;
    highInterval = 900;
    for (Droplet aDroplet : droplets) {
      aDroplet.dripSpeed = random(3, 6);
    }
  }

  if (game3Score >= 41 && game3Score <= 50) {
    lowInterval = 400;
    highInterval = 700;
    for (Droplet aDroplet : droplets) {
      aDroplet.dripSpeed = random(4, 7);
    }
  }

  if (game3Score >= 51 && game3Score <= 60) {
    lowInterval = 200;
    highInterval = 500;
    for (Droplet aDroplet : droplets) {
      aDroplet.dripSpeed = random(5, 8);
    }
  }

  if (game3Score >= 61) {
    lowInterval = 100;
    highInterval = 400;
    for (Droplet aDroplet : droplets) {
      aDroplet.dripSpeed = random(6, 9);
    }
  }
}

void playGame3() {
  dropletCatcherFunctions();
}






////////////////////////////////////////////////////////
// Section: finite state machine function
////////////////////////////////////////////////////////

void finiteState() {
  switch(state) {
  case 0:
    background(42);
    drawMenuScreen();
    stroke(0);
    strokeWeight(1);
    break;

  case 1:
    game1StartScreen();
    b1.render();
    b1.drawText();
    if (b1.isPressed() == true) {
      state = 2;
    }
    break;

  case 2:
    //draw background
    background(100, 160, 50);
    stroke(0);
    strokeWeight(1);
    // update the current time
    currentTime = millis();
    // timer to end game
    endTimerGame1();
    // draw score
    drawGameScore(game1Score, scoreX, scoreY, scoreC);
    // play game
    playGame1();
    break;

  case 3:
    // call score screen
    gameEndScreen(game1Score, color(scoreC), color(endScreenC));

    break;

  case 4:
    game2StartScreen();
    b2.render();
    b2.drawText();
    if (b2.isPressed() == true) {
      state = 5;
    }
    break;

  case 5:
    background(0);
    // update the current time
    currentTime = millis();
    playGame2();
    // timer to switch states
    endTimerGame2();
    // draw score
    drawGameScore(game2Score, scoreX, scoreY, scoreC);
    // play game
    break;

  case 6:
    // call score screen
    gameEndScreen(game2Score, color(scoreC), color(endScreenC));
    break;

  case 7:
    game3StartScreen();
    b3.render();
    b3.drawText();
    if (b3.isPressed() == true) {
      state = 8;
    }
    break;

  case 8:
    stroke(0);
    strokeWeight(1);
    // draw background
    background(121, 167, 203);
    // update the current time
    currentTime = millis();
    // timer to switch states
    endTimerGame3();
    // draw score
    drawGameScore(game3Score, scoreX, scoreY, scoreC);
    drawLives();
    // game 3 functions
    dropletCatcherFunctions();
    break;

  case 9:
    // score screen
    gameEndScreen(game3Score, color(scoreC), color(endScreenC));
    break;
  }
}
