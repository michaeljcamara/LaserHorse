//**********************************************************************
// Michael Camara
// Honor Code Pledge: This work is mine unless otherwise cited
// CMPSC 382: Professor Wenskovitch
// Lab 6: More Image Exploration
//**********************************************************************

/** This class represents a rectangular section of some original image.  It will start at a
/*  randomized location and then gradually travel to its proper location, while rotating at
/*  the same time.  The image will also start out gray and gradually transition to its proper
/*  color.  Once the tile has reached its destination, it will stop traveling and rotating. */
class Tile {
  PImage img;                // Image representing this tile
  float tileWidth, tileHeight;  // The width and height of this tile
  float currentX, currentY;  // The current x,y location of this tile
  float finalX, finalY;      // The target x,y location that the tile moves toward
  float xStep, yStep;        // The amount the tile will move per-step in x, y directions
  float angle, angleStep;    // The current angle and angle increment per step
  float duration;            // The total number of steps until tile reaches destination
  int stepCounter;           // The number of steps that have currently been executed
  float grayStep;            // Current grayscale counter (255 = max grayscale, 0 = normal)
  boolean isDone;            // Indicate whether tile has reached its destination

  // Create Tile with given final parameters and random starting parameters
  Tile(PImage img, int finalX, int finalY, int tileWidth, int tileHeight) {

    this.img = img;
    this.finalX = finalX;
    this.finalY = finalY;
    this.tileWidth = tileWidth;
    this.tileHeight = tileHeight;
    isDone = false;
    stepCounter = 0;
    grayStep = 255;

    // Randomize initial location of tile
    currentX = random(0, width);
    currentY = random(0, height);

    // Calculate distances between final/current x and y positions
    float distanceX = abs(finalX - currentX);
    float distanceY = abs(finalY - currentY);

    // Randomize how long the tile will travel from original location to destination
    // NOTE: This controls the relative order that tiles are "placed" back on the image.
    duration = (int) random(distanceX / SPEED, distanceY / SPEED);

    // Calculate distance for each step, such that it finishes moving when
    // the stepCounter equals the duration
    xStep = (finalX - currentX) / duration;
    yStep = (finalY - currentY) / duration;

    // Randomize starting angle, and set angleStep such that it will finish rotating
    // and have the correct orientation when stepCounter equals the duration
    angle = (int) random(1, 360);
    angleStep = (360 - angle) / duration;
  }

  // Calculate the tile's current position and angle
  void update() {

    // Keep traveling and rotating until the duration has been reached
    if (stepCounter != duration) {
      currentX += xStep;
      currentY += yStep;
      angle += angleStep;
      
      stepCounter++;
    } 
    
    // If duration of travel has been reached, stop rotation and travel
    else {
      angle = 0;
      currentX = finalX;
      currentY = finalY;
    }
  }

  void drawTile() {

    // If destination reached, simply draw the original image at destination
    if (isDone == true) {
      image(img, finalX, finalY);
    }
    
    else {
      // Calculate new position and angle
      update();
      
      pushMatrix();
      
      // Translate to new position and rotate to new angle
      translate(currentX + tileWidth / 2.0, currentY + tileHeight / 2.0);
      rotate(radians(angle));
      translate(-tileWidth / 2.0, -tileHeight / 2.0);
      image(img, 0, 0);
      
      // Draw a grayscale rectangle over the image;
      // The alpha channel becomes more transparent over time, becoming completely transparent when
      // the destination has been reached.  (I found this gave me more control over
      // the grayscale transitioning than using the image.filter() or image.tint() methods)
      grayStep -= 255 / duration;
      fill(100, grayStep);
      rect(0, 0, tileWidth, tileHeight);
      popMatrix();
    }
  }
}