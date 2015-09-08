//*********************************************************************************
// Honor Code: The work I am submitting is a result of my own thinking and efforts.
// Michael Camara
// CMPSC 382 Fall 2015 (Professor Wenskovitch)
// Lab # 1
// Date: 9/1/15
// 
// Purpose: Create a scene that includes animation.  The scene depicted here is
//          a medieval jousting match between two rival knights.
//********************************************************************************

/** The setup() and draw() methods are controlled here.  The CustomBackground is
/*  first created, and then the horses are created and continually moved horizontally 
/*  across the screen using different transforms.  This is meant to represent
/*  a medieval jousting scene, with two knights battling for fame and glory! */

Horse horse1, horse2; // Primary mobile elements of the scene

// Store global variables to control horse movement
int count;
int direction;
float velocity;
float acceleration;
float initialVelocity;
float xOffset;
float reverseOffset;

// Background containing various static items
CustomBackground cBackground;

final int TOP = 1, BOTTOM = -1;  // Indicate if horse is in top/bottom lane
final int LEFT = -1, RIGHT = 1;  // Indicate if horse if moving left/right

void setup() {
  size(1080, 720);
  count = 0;          // Representation of time
  direction = RIGHT;  // Set the initial relative direction of the horses
  velocity = 0;       // How fast the horse is moving at a given count
  acceleration = 0;   // How fast the horse is increasing in velocity
  initialVelocity = 0;
  xOffset = 0;
  reverseOffset = 0;
  
  // Generate custom colors for horses/knights
  color crimson = color(160, 16, 16);
  color navy = color(14, 46, 201);
  color brightRed = color(255, 0, 0);
  color brightBlue = color(0, 0, 255);
  color darkBrown = color(139, 69, 19);
  color lightBrown = color(169, 99, 49);
  color lightGrey = color(200);

  // Create two horses: one in the top lane, one in the bottom lane
  horse1 = new Horse(darkBrown, crimson, brightRed, TOP);
  horse2 = new Horse(lightGrey, navy, brightBlue, BOTTOM);
  
  // Set initial background (before horses are added);
  cBackground = new CustomBackground();
  cBackground.drawBackground();
}

void draw() {
  
  // Redraw custom background (everything except horses/knights)
  cBackground.drawBackground();

  // Control horse movement:
  // Top horse moves left to right.  Speeds up until middle of screen,
  // then slows down, eventually flipping horizontally and continuing
  if (count == 0) {
    velocity = 0;
    initialVelocity = 0;
    acceleration = 0;
    direction = RIGHT;
  } else if (count == 179) {
    velocity = 0;
    initialVelocity = 0;
    acceleration = 0;
    direction = LEFT;
    reverseOffset = xOffset;
  }

   // Acceleration controlled at intervals across screen
  if (count < 89) {
    acceleration++;
  } else if (count < 179) {
    acceleration--;
  } else if (count < 269) {
    acceleration--;
  } else if (count < 359) {
    acceleration++;
  }
  
  // Count incremented with each draw frame
  count++;
  
  // Use basic acceleration/velocity formula, adjusted for desired look and feel
  velocity = initialVelocity + acceleration * ((count % 182) / 180.0) * 1.15;
  xOffset = initialVelocity * (count % 182 /10.0) + (0.5 * acceleration) * pow(count % 182 /10.0, 2);
  initialVelocity = velocity; 

  // Control movement of each horse individually, based on its current direction
  if (direction == RIGHT) {

    // Move top horse
    pushMatrix();
    translate(xOffset / 100.0, 350);
    scale(0.22, 0.22);
    horse1.drawHorse();
    popMatrix();

    // Move bottom horse
    pushMatrix();
    translate(-xOffset / 100.0 + 1050, 450);
    scale(-0.22, 0.22);
    horse2.drawHorse();
    popMatrix();
  } 
  else if (direction == LEFT) {

    // Move top horse
    pushMatrix();
    translate(xOffset / 100.0 + reverseOffset / 100.0 + 250, 350);
    scale(-0.22, 0.22);
    horse1.drawHorse();
    popMatrix();
    
    // Move bottom horse
    pushMatrix();
    translate(-xOffset / 100.0, 450);
    scale(0.22, 0.22);
    horse2.drawHorse();
    popMatrix();
  }

  // Keep count in range of 0 - 359
  count = frameCount % 360;
}