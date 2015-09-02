class Horse {

  int x, y;

  Horse(int x, int y) {
    this.x = x;
    this.y = y;

    fill(139, 69, 19);
  }

  void drawHorse() {
    ellipseMode(CORNER);

    //  rect(x + 100, y + 200, 300, 200);

    pushMatrix();  // Save default transform



    //    line(x + 100, y + 200, x + 500, y + 200);
    //    line(x + 100, y + 400, x + 500, y + 400);
    //    ellipse(x + 100, y + 200, 100, 200);
    //    ellipse(x + 400, y + 200, 100, 200);

    popMatrix();



    strokeWeight(3);
    drawHindBackLeg();
    drawTrunk();
    drawHindForeLeg();
  }

  void drawTrunk() {
    int bodyOffsetX = 100;
    int bodyOffsetY = 200;

    pushMatrix();

    translate(bodyOffsetX, bodyOffsetY);

    //    line(x, y, x + 500, y );
    //    line(x, y + 200, x + 500, y + 200);

//    noStroke();
//    ellipse(x, y, 100, 200);
//    ellipse(x + 400, y, 100, 200);
//    rect(x + 50, y, 400, 200);
//    stroke(0);

    beginShape();
      curveVertex(x, y);
      curveVertex(x, y);
      curveVertex(x + 75, y - 40);
      curveVertex(x + 175, y + 20);
      curveVertex(x + 250, y - 30);  // shoulder
      curveVertex(x + 300, y + 100);
      curveVertex(x + 325, y + 150);
      curveVertex(x + 150, y + 150);
      curveVertex(x + 75, y + 100);
      curveVertex(x + 50, y + 150);
      curveVertex(x, y + 150);
      curveVertex(x - 25, y + 75);
      curveVertex(x - 25, y + 75);
    endShape(CLOSE);

    popMatrix();
  }

  void drawHindBackLeg() {  
    strokeJoin(ROUND);

    int legOffsetX = 200;
    int legOffsetY = 350;

    pushMatrix();

    translate(legOffsetX, legOffsetY);
//    rotate(sin(frameCount/4.0)/3);

    beginShape();
      curveVertex(x, y);
      curveVertex(x + 100, y);
      curveVertex(x + 100, y + 50);
      curveVertex(x, y + 150);
      curveVertex(x, y + 250);
      curveVertex(x + 25, y + 275);
      curveVertex(x + 35, y + 300);
      curveVertex(x - 45, y + 300);
      curveVertex(x - 45, y + 275);
      curveVertex(x - 65, y + 250);
      curveVertex(x - 65, y + 150);
      curveVertex(x - 75, y + 130);
      curveVertex(x - 30, y + 75);
      curveVertex(x - 30, y);
      curveVertex(x, y);
    endShape();
    
    pushStyle();
    fill(255);
    beginShape();
      curveVertex(x, y + 250);
      curveVertex(x, y + 250);
      curveVertex(x + 25, y + 275);
      curveVertex(x + 35, y + 300);
      curveVertex(x - 45, y + 300);
      curveVertex(x - 45, y + 275);
      curveVertex(x - 65, y + 250);
    endShape();
    popStyle();

    popMatrix();
  }

  void drawHindForeLeg() {

    strokeJoin(ROUND);

    int legOffsetX = 150;
    int legOffsetY = 350;



    pushMatrix();
    translate(legOffsetX, legOffsetY);
//    rotate(-sin(frameCount/4.0)/3);

    beginShape();
      curveVertex(x, y);
      curveVertex(x + 100, y);
      curveVertex(x + 100, y + 50);
      curveVertex(x, y + 150);
      curveVertex(x, y + 250);
      curveVertex(x + 25, y + 275);
      curveVertex(x + 35, y + 300);
      curveVertex(x - 45, y + 300);
      curveVertex(x - 45, y + 275);
      curveVertex(x - 65, y + 250);
      curveVertex(x - 65, y + 150);
      curveVertex(x - 75, y + 130);
      curveVertex(x - 30, y + 75);
      curveVertex(x - 30, y);
      curveVertex(x, y);
    endShape();
    
    pushStyle();
    fill(255);
    beginShape();
      curveVertex(x, y + 250);
      curveVertex(x, y + 250);
      curveVertex(x + 25, y + 275);
      curveVertex(x + 35, y + 300);
      curveVertex(x - 45, y + 300);
      curveVertex(x - 45, y + 275);
      curveVertex(x - 65, y + 250);
    endShape();
    popStyle();

    popMatrix();
  }
}

