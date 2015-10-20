class Tile {
  PImage img;
  float currentX, currentY, xStep, yStep, finalX, finalY;
//float xStep, yStep;
//int currentX, currentY;
//int xStep, yStep;
//  int finalX, finalY;
  float angle, spinRate;
  float moveRate;
  boolean isDone;
  int idNum;
  
  Tile(PImage i, int finalX, int finalY) {
    img = i;
    this.finalX = finalX;
    this.finalY = finalY;
    
    isDone = false;
    
    currentX = (int) random(1, width);
    currentY = (int) random(1, height);
    
    moveRate = 1;
    
//    xStep = -1 / (currentX - finalX * moveRate);
//    yStep = -1 / (currentX - finalY * moveRate);
    
    float vectorLength = sqrt(pow(finalX-currentX,2.0) + pow(finalY-currentY,2.0));
    
//    xStep = 1 * Math.signum(finalX - currentX) / vectorLength;
//    yStep = -1 * Math.signum(finalX - currentX)/ vectorLength;

    
//    xStep = 10 / (finalX - currentX);
//    yStep = 10 / (finalY - currentY);
  xStep = Math.signum(finalX - currentX) * currentX / vectorLength;
  yStep = Math.signum(finalY - currentY) * currentY / vectorLength;

    
//    xStep = (finalX - currentX) / 100;
//    yStep = (finalY - currentY) / 100;
    
//    xStep = (int) Math.signum(finalX - currentX);
//    yStep = (int) Math.signum(finalY - currentY);
//    xStep = (finalX - currentX) / 4;
//    yStep = (finalY - currentY) / 4;
    
    angle = 0;
    spinRate = random(3, 10);
    
    idNum = id++;
  } //Tile (constructor)
  
  void update() {
    
    
    
    angle = (angle + spinRate) % 360;
    
//    if(currentX == finalX)
//      println("DONE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    
//    println(currentX + " " + finalX);
    
//    if(currentX != finalX) {
    if(abs(currentX - finalX) > 10) {
      currentX += xStep;  
//      xStep *= 1.01;
//      xStep = (finalX - currentX) / 2;
    }
    else {
      currentX = finalX;
    }
    if(abs(currentY - finalY) > 10) {
      currentY += yStep;
//      yStep *= 1.01;
//      yStep = (finalY - currentY) / 2;
    }
    else {
      currentY = finalY;
    }
    
    
//    if(idNum == 160) {
//    println(currentX + " " + finalX + " | " + currentY + " " + finalY);
//    if(currentX == finalX)
//    println("OMG");
//    
//    }

  } //update
  
  void drawTile() {
    pushMatrix();
//    translate(currentX+10, currentY+10);
//    if (isDone == false) {
//      rotate(radians(angle));
//    } //if

//    translate(currentX, currentY);    
//    translate(-10, -10);
//    image(img, 0, 0);
    image(img, currentX, currentY);
    popMatrix();
    update();

  } //drawTile
  
} //Tile (class)

