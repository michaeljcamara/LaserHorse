//*********************************************************************************
// Honor Code: The work I am submitting is a result of my own thinking and efforts.
// Michael Camara
// CMPSC 382 Fall 2015 (Professor Wenskovitch)
// Lab # 3
// Due Date: 9/22/15
// 
// Purpose: Modify scene from Lab 1 to include different transformations.
//          I kept the Horse and Knight classes more-or-less the same, but changed
//          the scenery and added controls for a game to collect the most coins
//          possible within 60 seconds!
//********************************************************************************

import java.text.*;
import java.io.*;

// Create a controllable horse and rider!
Horse horse1;

// Variables for x movement
float acceleration = 0, velocity = 0, initialVelocity = 0, xOffset = 0;

// variables for y movement
float yVelocity = 0, yAcceleration = 0, yOffset = 0, yInitialVelocity = 0, rotationOffset = 0;
boolean isJumping = false, isMoving = false, maxHeightReached = false, minHeightReached = false, isKnightJumping = false, 
maxKnightHeightReached = false;
float jumpHeight = 0, yKnightOffset = 0, yKnightAcceleration = 0, yKnightVelocity = 0, yKnightInitialVelocity = 0;

// Misc. constants for horse movement
final int RIGHT_DIR = 1, LEFT_DIR = -1;
final int MAX_JUMP_HEIGHT = -500;
final int MIN_JUMP_HEIGHT = -250;
final int INVERSION_OFFSET = -1200;
final int TOP = 1, BOTTOM = -1;

// Direction horse is moving
int direction = RIGHT_DIR;

// Create collision detector (detects when lance touches a coin)
CollisionDetector detector;

// List containing coins, used for determining score
ArrayList<Coin> coins = new ArrayList<Coin>();

// Start time for this game
long startTime;

// Static background (sunset with field of grass)
CustomBackground cBackground;

// Keep list of previous high scores and their associated names
ArrayList<Integer> scores;
ArrayList<String> names;

// Current score for the player
int score = 0;

// The lowest score that is on the high score list
int lowestScore;

// The player's rank on the high score list
int rank;

// Initials of the player
String initials = "";

// Indicate if the game has finished
boolean gameOver = false;

void setup() {

  // Set size of screen
  size(1200, 600);

  // Generate custom colors for horse/knight
  color crimson = color(160, 16, 16);
  color brightRed = color(255, 0, 0);
  ;
  color darkBrown = color(139, 69, 19);

  // Create one horse with red colors
  horse1 = new Horse(darkBrown, crimson, brightRed, TOP);

  // Draw static background once fully, then save image and keep loading that image
  cBackground = new CustomBackground();
  cBackground.drawBackground();

  // Create collision detector
  detector = new CollisionDetector();

  // Begin timer!
  startTime = System.currentTimeMillis();

  // Retrieve the high score list to compare with score this game
  try {
    getHighScores();
  }
  catch(Exception e) {
    println("Could not access highScores.txt");
  }
}

void draw() {

  pushMatrix();
  // Draw static background
  cBackground.drawBackground();

  // Immediately detect for any collisions (i.e. if lance has contacted a coin);
  detector.detectCollisions();

  // Create timer and score card
  pushStyle();
  fill(0, 255, 0);
  textSize(50);
  text("Score: " + score, 50, 50);

  long currentTime = System.currentTimeMillis();
  Long elapsedTime = (currentTime - startTime);
  Float remainingTime = 60.0 - elapsedTime / 1000.0;

  text("Time Remaining: " + (new DecimalFormat("##.##").format(remainingTime)), 600, 50);
  popStyle();

  // End game if no time remaining on clock
  if (remainingTime <= 0) {
    try {
      endGame();
    } 
    catch (Exception e) {
      System.out.println("Could not load high score list");
    }
  }

  // Control movement of horse **************************
  // Control acceleration in x direction
  if (isMoving == true) {
    if (direction == RIGHT_DIR) {
      acceleration += 2.0;
    } else if (direction == LEFT_DIR) {
      acceleration -= 2.0;
    }
  } else if (isMoving == false) {
    if (abs(acceleration) <= 1.5)
      acceleration = 0;
    else if (acceleration < 0) {
      acceleration += 1.5;
    } else if (acceleration > 0) {
      acceleration -= 1.5;
    }
  }

  // Ensure that horse always jumps a minimum height, and never exceeds a maximum height
  if (yOffset < MIN_JUMP_HEIGHT) {
    minHeightReached = true;
    if (yOffset < MAX_JUMP_HEIGHT) {
      maxHeightReached = true;
    }
  } else if (yOffset >= 0) {
    maxHeightReached = false;
    minHeightReached = false;
  }

  // Control acceleration in y direction
  if ((isJumping == true && maxHeightReached == false) || (isJumping == false && minHeightReached == false && yAcceleration < 0) ) {
    yAcceleration -= 4;
  } else if (isJumping == false && yOffset != 0 || maxHeightReached == true) {
    yAcceleration += 2;
  }

  // Adjust x and y velocity and ultimately their offsets, based on simple movement equations
  velocity = initialVelocity + acceleration;
  xOffset = initialVelocity + (0.5 * acceleration);
  initialVelocity = velocity; 

  yVelocity = yInitialVelocity + yAcceleration;
  yOffset = yInitialVelocity + (0.5 * yAcceleration);
  yInitialVelocity = yVelocity;

  // Ensure that all vertical movement is stopped once horse hits the "floor"
  if (yOffset > 0) {
    yVelocity = 0;
    yInitialVelocity = 0;
    yAcceleration = 0;
    yOffset = 0;
  }

  // Use the above calculatons to control where the horse appears on the screen
  translate(0, 400);
  scale(0.2, 0.2);

  // Draw all currently created coins (3 should always appear)
  for (int i = 0; i < coins.size (); i++) {
    coins.get(i).drawCoin();
  }

  // Control whether horse looks left or right
  if (direction == LEFT_DIR) {
    scale(-1.0, 1.0);
    translate(INVERSION_OFFSET, 0);
  }

  // Translate the horse to the correct position, then draw
  translate(xOffset * direction, yOffset);
  horse1.drawHorse();

  // Ensure that the horse does not move off the edge of the screen
  if (xOffset > width * 5 - 1200) {
    acceleration = -30;
  } else if (xOffset < 0) {
    acceleration = +30;
  }

  popMatrix();
}

// Control movement/jumping when the appropriate keys are pressed
void keyPressed() {

  if (keyCode == RIGHT) {
    direction = RIGHT_DIR;
    isMoving = true;
  } else if (keyCode == LEFT) {
    direction = LEFT_DIR;
    isMoving = true;
  } else if (keyCode == 32) {
    isJumping = true;
  } else if (keyCode == UP) {
    isKnightJumping = true;
  } else if (keyCode == DOWN) {
    rotationOffset += 5;
  }
}

// Stop movement/jumping when the appropriate keys are released
void keyReleased() {
  if (keyCode == RIGHT && direction == RIGHT_DIR || keyCode == LEFT && direction == LEFT_DIR) {
    isMoving = false;
  } else if (keyCode == 32) {
    isJumping = false;
  }
}

// Retrieve the current score list, including the scores and their corresponding names
void getHighScores() throws IOException {
  File highScoreFile = new File("highScores.txt");

  BufferedReader reader = createReader("highScores.txt");

  String highScoreList = reader.readLine();

  Scanner scan = new Scanner(highScoreList);
  scan.useDelimiter(";");

  ArrayList<Integer> scores = new ArrayList<Integer>();
  ArrayList<String> names = new ArrayList<String>();

  while (scan.hasNext ()) {
    names.add(scan.next());
    scores.add(scan.nextInt());
  }

  lowestScore = scores.get(9);
}

// Retrieve the players rank in the high score list
int getRank() {
  int rank = 99;
  for (int i = 0; i < scores.size (); i++) {
    if (score > scores.get(i)) {
      rank = i;
      break;
    }
  }

  return rank;
}


// THIS METHOD IS STILL IN PROGRESS!!
void endGame() throws IOException {

  gameOver = true;
  if (score > lowestScore) {
    //rank = getRank();

    pushStyle();
    pushMatrix();
    fill(0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("You got a high score!", width/2, height/6);
    popStyle();
    popMatrix();
  }
  else {
    pushStyle();
    pushMatrix();
    fill(0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("You did not get a high score ='(", width/2, height/6);
    popStyle();
    popMatrix();
  }
  /*
  String name = "";
  Scanner scanName = new Scanner(System.in);
  if (rank <= 9) {
    //println("Congrats! Enter your initials!");

    while (name.length () < 3) {

      if (keyPressed) {
        char asdasd = key;
        println(asdasd);
      }
    }
  }

  if (rank == 9) {
    scores.set(9, score);
    names.set(9, name);
  } else {
    scores.set(9, score);
    names.set(9, name);

    for (int i = scores.size () - 1; i > rank; i--) {
      int scoreTemp1 = scores.get(i);
      int scoreTemp2 = scores.get(i-1);
      String nameTemp1 = names.get(i);
      String nameTemp2 = names.get(i-1);

      scores.set(i, scoreTemp2);
      scores.set(i-1, scoreTemp1);
      names.set(i, nameTemp2);
      names.set(i-1, nameTemp1);
    }
  }

  System.out.println(scores);
  System.out.println(names);
  println(rank);

  //scan.close();
  //writer.close();

  fill(0);
  rect(500, 0, 500, 500);

  //noLoop();
  */
  noLoop();
}

