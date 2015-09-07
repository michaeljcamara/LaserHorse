class CustomBackground {

  PImage img;
  
  CustomBackground() {
    
    //background(0,255,0);
    
    pushStyle();
    pushMatrix();
    
    fill(0, 140, 0);
    stroke(0, 200, 0);
    rect(0,0,width,height);
    fill(0,255,0); 
    
    strokeWeight(1);

   for(int i = 0; i < width; i += 12) {
     for(int j = 0; j < height; j += 12) {
        
       beginShape();
       curveVertex(0 + i, 23 + j);
       curveVertex(0 + i, 23 + j);
       curveVertex(7 + i, 15 + j);
       curveVertex(15+  i, 12 + j);
       curveVertex(20 + i, 12 + j);
       endShape();    
     }
   }
   
   ellipseMode(CENTER);
   fill(0, 200, 0);
   ellipse(width/2.0, height * (2/3.0) + 50, width, height/2.5);
   fill(127, 84, 23, 200);
   ellipse(width/2.0, height * (2/3.0) + 50, width, height/2.5);
   
     // Blue Sky
    fill(7, 247, 229);
    rect(0,0,width,200);
    
    popStyle();
    popMatrix();
    save("grassBackground.png");
    
    img = loadImage("grassBackground.png");
  }
  void drawBackground() {
    
    pushStyle();
    noStroke();
    
    background(img);
    drawStand();
    // Day/night cycle
//    fill(0,0,0,sin(frameCount/100.0) * 125);
//    rect(0,0,width,height);
    
    popStyle();
    
    
  }
  
  void drawStand() {
    pushStyle();
    stroke(0);
    rectMode(CENTER);
    ellipseMode(CENTER);
    
    //Brown arch
    fill(152, 110, 46);
    arc(width/2, 200, 450, 400, PI, TWO_PI);
    
    // Blue sky cut-out
    fill(7, 247, 229);
    arc(width/2, 200, 325, 375, PI, TWO_PI);
    
    fill(152, 110, 46);
    // Brown box
    rect(width/2.0, height/3.0 + 30, 450, 150);
    
    for(int i = 0; i < 5; i++) {
       rect(width/2.0, height/3.0 + 30, 90 * i, 150);
    }
    
    // Yellow throne
    fill(240, 233, 12);
    beginShape();
    curveVertex(500, 197);  // Bottom left leg
    curveVertex(500, 197);  // Bottom left leg
    curveVertex(489, 148);  // Left armrest
    curveVertex(489, 148);  // Left armrest
    curveVertex(502, 134);
    
    curveVertex(504, 72);  // Upper left corner
    curveVertex(504, 72);  // Upper left corner
    curveVertex(554, 84);  // Middle groove
    curveVertex(604, 72);  // Upper right corner
    curveVertex(604, 72);  // Upper right corner
    curveVertex(598, 134);
    curveVertex(611, 148);  // Right armrest
    curveVertex(611, 148);  // Right armrest
    curveVertex(600, 197);  // Bottom right leg
    curveVertex(600, 197);  // Bottom right leg
    endShape(CLOSE);
    
    // Red cushion (top)
    fill(255, 0, 0);
    beginShape();
      curveVertex(520, 146);
      curveVertex(520, 146);
      curveVertex(519, 93);
      curveVertex(551, 102);  //Middle
      curveVertex(583, 93);
      curveVertex(582, 146);
      curveVertex(582, 146);
    endShape(CLOSE);
    
    // Red cushion (bottom)
    ellipse(551, 157, 75, 35);
    
    // Add stairs to side?
    
    popStyle();
    
  }
  
}
