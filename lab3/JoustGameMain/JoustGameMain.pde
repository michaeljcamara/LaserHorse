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

int score = 0;

Horse horse1, horse2; // Primary mobile elements of the scene
int count = 0;

final int TOP = 1, BOTTOM = -1;  // Indicate if horse is in top/bottom lane

float acceleration = 0;
float velocity = 0;
float initialVelocity = 0;
float xOffset = 0;

float yVelocity = 0, yAcceleration = 0, yOffset = 0, yInitialVelocity = 0, rotationOffset = 0;

final int RIGHT_DIR = 1, LEFT_DIR = -1;
int direction = RIGHT_DIR;

boolean isJumping = false, isMoving = false, maxHeightReached = false, minHeightReached = false, isKnightJumping = false;
float jumpHeight = 0;

float yKnightOffset = 0, yKnightAcceleration = 0, yKnightVelocity = 0, yKnightInitialVelocity = 0;
boolean maxKnightHeightReached = false;

final int MAX_JUMP_HEIGHT = -500;
final int MIN_JUMP_HEIGHT = -250;

final int INVERSION_OFFSET = -1200;

CollisionDetector detector;

ArrayList<Coin> coins = new ArrayList<Coin>();

long startTime;

CustomBackground cBackground;

void setup() {

  size(1440, 600);
  // Generate custom colors for horses/knights
  color crimson = color(160, 16, 16);
  color brightRed = color(255, 0, 0);;
  color darkBrown = color(139, 69, 19);

  // Create two horses: one in the top lane, one in the bottom lane
  horse1 = new Horse(darkBrown, crimson, brightRed, TOP);

  
  // Draw static background once full, then save image and keep loading that image
  cBackground = new CustomBackground();
  cBackground.drawBackground();

  // Create collision detector
  detector = new CollisionDetector();
  
  // Begin timer!
  startTime = System.currentTimeMillis();
}


void draw() {
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
  Float remainingTime = 4.0 - elapsedTime / 1000.0;

  text("Time Remaining: " + (new DecimalFormat("##.##").format(remainingTime)), 800, 50);
  popStyle();
  
  // End game if no time remaining on clock
  if(remainingTime <= 0) {
    try{
      endGame();
    } catch (Exception e) {
      System.out.println("Could not load high score list");
    }
    
  }

  // Control movement of horse
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
  for (int i = 0; i < coins.size(); i++) {
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

  
}

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

void keyReleased() {
  if (keyCode == RIGHT && direction == RIGHT_DIR || keyCode == LEFT && direction == LEFT_DIR) {
    isMoving = false;
  } else if (keyCode == 32) {
    isJumping = false;
  }
}

void endGame() throws IOException {
  File highScoreFile = new File("highScores.txt");
  //FileWriter writer = new FileWriter(highScoreFile);
  
  BufferedReader reader = createReader("highScores.txt");
  
  String highScoreList = reader.readLine();
  Scanner scan = new Scanner(highScoreList);
  scan.useDelimiter(";");
  
  ArrayList<String> scores = new ArrayList<String>();
  ArrayList<String> names = new ArrayList<String>();
  
  while(scan.hasNext()) {
    names.add(scan.next());
    scores.add(scan.next());
  }
  int rank = 0;
  for(int i = 0; i < scores.size(); i++) {
    if(score > Integer.parseInt(scores.get(i))) {
      rank = i+1;
    }
  }
  System.out.println(scores);
  System.out.println(names);
  
  scan.close();
  //writer.close();
  
  noLoop();
}