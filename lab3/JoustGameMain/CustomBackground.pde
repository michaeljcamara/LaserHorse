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

/** This class represents most of the staic objects on the screen that constitute
/*  the background, including: the sky, the ground, and the platform holding the
/*  the king above the jousting field. */

class CustomBackground {

  // Image of original background scene after constructor finishes 
  PImage img;

  CustomBackground() {

    pushStyle();
    pushMatrix();

    // Create grass texture on majority of screen
    strokeWeight(1);
    fill(0, 140, 0);
    stroke(0, 200, 0);
    rect(0, 0, width, height);
    fill(0, 255, 0); 

    for (int i = 0; i < width; i += 12) {
      for (int j = 0; j < height; j += 12) {
        // Fill screen with small grass blades
        beginShape();
          curveVertex(0 + i, 23 + j);
          curveVertex(0 + i, 23 + j);
          curveVertex(7 + i, 15 + j);
          curveVertex(15+  i, 12 + j);
          curveVertex(20 + i, 12 + j);
        endShape();
      }
    }

    // Dirt patch in middle of horse movement area
    ellipseMode(CENTER);
    fill(0, 200, 0);
    ellipse(width/2.0, height * (2/3.0) + 50, width, height/2.5);
    fill(127, 84, 23, 200);
    ellipse(width/2.0, height * (2/3.0) + 50, width, height/2.5);

    // Blue Sky
    fill(7, 247, 229);
    rect(0, 0, width, 200);

    // King platform in background of jousting scene
    drawKingPlatform();

    // Draw some clouds
    drawClouds();

    // Save the previous scene as a separate image
    save("joustBackground.png");
    img = loadImage("joustBackground.png");
    
    popStyle();
    popMatrix();
  }
  
  void drawBackground() {

    // Draw previously saved image (to avoid performance delays from redundant grass generation)
    background(img);

    //Day/night cycle
    //fill(0,0,0,sin(frameCount/100.0) * 125);
    //rect(0,0,width,height);
  }

  void drawKingPlatform() {  // Raised structure where king sits
    
    pushStyle();
    stroke(0);
    strokeWeight(4);
    rectMode(CENTER);
    ellipseMode(CENTER);
    strokeJoin(ROUND);

    //Brown arch over throne
    fill(152, 110, 46);
    arc(width/2, 200, 450, 400, PI, TWO_PI);

    // Blue sky cut-out for arch
    fill(7, 247, 229);
    arc(width/2, 200, 325, 375, PI, TWO_PI);

    // Brown platform with vertical columns
    fill(152, 110, 46);
    for (int i = 0; i < 5; i++) {
      rect(width/2.0, height/3.0 + 30, 450 - (i * 100), 145);
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
    
    
    // The King! (Very simple human figure)
    
    // Center and shrink the king by a small offset
    pushMatrix();
    translate(115, 40);
    scale(0.8, 0.8);
    
    // King's red gown
    fill(200,0,0); 
    beginShape();
      curveVertex(542, 91);
      curveVertex(542, 91);
      curveVertex(512, 97);
      curveVertex(491, 137);
      curveVertex(507, 145);
      curveVertex(525, 119);
      curveVertex(525, 148);
      curveVertex(511, 189);
      curveVertex(534, 192);
      curveVertex(544, 155);
      curveVertex(555, 192);
      curveVertex(580, 190);
      curveVertex(568, 154);
      curveVertex(567, 117);
      curveVertex(586, 142);
      curveVertex(609, 132);
      curveVertex(580, 97);
      curveVertex(580, 97);
    endShape(CLOSE);
    
    // King's head
    fill(255,218,185);
    ellipse(550, 80, 40, 40);
    
    // King's crown
    fill(240, 233, 12);
    beginShape();
      curveVertex(532, 66);
      curveVertex(532, 66);
      curveVertex(536, 46);
      curveVertex(545, 57);
      curveVertex(556, 41);
      curveVertex(560, 60);
      curveVertex(573, 42);
      curveVertex(568, 67);
      curveVertex(568, 67);
    endShape(CLOSE);

    /// King's face
    strokeWeight(7);
    point(543, 77);
    point(558, 77);
    beginShape();
      curveVertex(542, 87);
      curveVertex(542, 87);
      curveVertex(548, 95);
      curveVertex(557, 87);
      curveVertex(557, 87);
    endShape();

    popStyle();
    popMatrix();
  }
  
  void drawClouds() {
    
    pushMatrix();
    pushStyle();
    
    // Create light white-gray cloud
    fill(215);
    stroke(90);
    beginShape();
      curveVertex(104, 73);
      curveVertex(103, 48);
      curveVertex(131, 23);
      curveVertex(162, 50);
      curveVertex(189, 31);
      curveVertex(230, 37);
      curveVertex(218, 66);
      curveVertex(269, 74);
      curveVertex(275, 99);
      curveVertex(254, 130);
      curveVertex(212, 129);
      curveVertex(193, 118);
      curveVertex(162, 125);
      curveVertex(127, 134);
      curveVertex(123, 109);
      curveVertex(86, 122);
      curveVertex(51, 105);
      curveVertex(71, 81);
      curveVertex(60, 80);
      curveVertex(40, 60);
      curveVertex(73, 45);
      curveVertex(112, 76);
    endShape(CLOSE);
    
    // Create another cloud on other side of sky
    translate(800, 20);
    
    beginShape();
      curveVertex(104, 73);
      curveVertex(103, 48);
      curveVertex(131, 23);
      curveVertex(162, 50);
      curveVertex(189, 31);
      curveVertex(230, 37);
      curveVertex(218, 66);
      curveVertex(269, 74);
      curveVertex(275, 99);
      curveVertex(254, 130);
      curveVertex(212, 129);
      curveVertex(193, 118);
      curveVertex(162, 125);
      curveVertex(127, 134);
      curveVertex(123, 109);
      curveVertex(86, 122);
      curveVertex(51, 105);
      curveVertex(71, 81);
      curveVertex(60, 80);
      curveVertex(40, 60);
      curveVertex(73, 45);
      curveVertex(112, 76);
    endShape(CLOSE);

    popStyle();
    popMatrix();
    
  }
}