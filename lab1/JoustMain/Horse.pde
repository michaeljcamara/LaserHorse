class Horse {
  
  int x, y;
  
  Horse(int x, int y) {
    this.x = x;
    this.y = y;
    
  }
  
  void drawHorse() {
    ellipseMode(CORNER);
    
//  rect(x + 100, y + 200, 300, 200);

    pushMatrix();  // Save default transform
    
    drawTrunk();

//    line(x + 100, y + 200, x + 500, y + 200);
//    line(x + 100, y + 400, x + 500, y + 400);
//    ellipse(x + 100, y + 200, 100, 200);
//    ellipse(x + 400, y + 200, 100, 200);
    
    popMatrix();
    
    drawHindForeLeg();
    
    
  }
  
  void drawTrunk() {
    int bodyOffsetX = 100;
    int bodyOffsetY = 200;
    
    translate(bodyOffsetX, bodyOffsetY);

//    line(x, y, x + 500, y );
//    line(x, y + 200, x + 500, y + 200);
    rect(x + 50, y, 400, 200);
    ellipse(x, y, 100, 200);
    ellipse(x + 400, y, 100, 200);
  }
  
  void drawHindForeLeg() {
//    int legOffsetX = 300;
//    int legOffsetY = 350;
    
    strokeJoin(ROUND);
    
//    shearX(-PI/8);
//    translate(legOffsetX, legOffsetY);
//    rect(x + 100, y + 350, 100, 150);
//    rect(x, y, 100, 150);
//    quad(x, y, x + 100, y,
//    beginShape();
//      vertex(x, y);
//      vertex(x + 100, y);
//      vertex(x + 100, y + 50);
//      vertex(x + 50, y + 150);
//      vertex(x, y + 150);
//     endShape(CLOSE);

    int legOffsetX = 150;
    int legOffsetY = 350;
    
    translate(legOffsetX, legOffsetY);


//    beginShape();
//      vertex(x, y);
//      vertex(x + 100, y);
//      vertex(x + 100, y + 50);
//      vertex(x + 50, y + 150);
//      vertex(x + 50, y + 250);
//      vertex(x + 75, y + 275);
//      vertex(x + 85, y + 300);
//      vertex(x + 15, y + 300);
//      vertex(x + 15, y + 275);
//      vertex(x - 15, y + 250);
//      vertex(x - 15, y + 150);
//      vertex(x - 15, y + 150);
//     endShape(CLOSE);

    beginShape();
      vertex(x, y);
      vertex(x + 100, y);
      vertex(x + 100, y + 50);
      vertex(x, y + 150);
      vertex(x, y + 250);
      vertex(x + 25, y + 275);
      vertex(x + 35, y + 300);
      vertex(x - 45, y + 300);
      vertex(x - 45, y + 275);
      vertex(x - 65, y + 250);
      vertex(x - 65, y + 150);
      vertex(x - 65, y + 150);
     endShape(CLOSE);
  }
  
}
