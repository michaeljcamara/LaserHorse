class Tile {
  PImage img;
  float currentX, currentY, xStep, yStep, finalX, finalY;
  //float xStep, yStep;
  //int currentX, currentY;
  //int xStep, yStep;
  //int finalX, finalY;
  float angle, spinRate;
  float moveRate;
  boolean isDone;
  int idNum;
  int counter;
  float duration;
  int stepCounter;

  Tile(PImage i, int finalX, int finalY) {
    img = i;
    this.finalX = finalX;
    this.finalY = finalY;

    isDone = false;

//    currentX = (int) random(1, width);
//    currentY = (int) random(1, height);

    //duration = 100.0;
    duration = (int) random(50, 200);

    currentX = random(-width, width);
    currentY = random(-height, height);

    xStep = (finalX - currentX) / duration;
    yStep = (finalY - currentY) / duration;

    //angle = random(0, TWO_PI);
    angle = 0;
    //spinRate = (int) random(5, 15);
    spinRate = duration / 15.0;

    idNum = id++;
    counter = 0;
    stepCounter = 0;
  } //Tile (constructor)

  void update() {
    
    if(stepCounter != duration) {
      currentX += xStep;
      currentY += yStep;
      stepCounter++;
      angle = (angle + spinRate) % 360;
    }
    else {
      if(angle < spinRate) {
        angle = 0;
      }
      else {
        angle = (angle + spinRate) % 360;
        println("angle = " + angle);
        println("spinRate = " + spinRate);
      }
    }
    
  } //update

  void drawTile() {
    update();
    pushMatrix();

    translate(currentX + 10, currentY + 10);
    rotate(radians(angle));
    translate(-10, -10);
    image(img, 0, 0);
    popMatrix();
    
  } //drawTile
} //Tile (class)

