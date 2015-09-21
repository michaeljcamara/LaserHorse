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

/** This class represents a simple knight, or jouster, who is placed on top of a
/*  horse.  The knight is overall static, but the cape and lance move slightly
/*  with each joust.  The knight also bobs up/down counter to the horse's rhythm. */

class Knight {

  color capeColor, lanceColor;  // Custom colors for cape and lance
  int position;  // Top or bottom, depending on which lane the horse/knight is in
  final int TOP = 1, BOTTOM = -1;
  
  Knight(color capeColor, color lanceColor, int position) {
    
    // Adjust this knight's color scheme
    this.capeColor = capeColor;
    this.lanceColor = lanceColor;
    
    // Indicate whether the knight is in the top or bottom lane
    this.position = position;
  }

  void drawKnight() {
    pushStyle();
    pushMatrix();
    fill(125);
    curveTightness(0.75);  // Ensure rigid lines, due to armor

    // Bob knight up/down with horse
    translate(0, cos(frameCount/4.0)*8 - 200);

    //Legs
    beginShape();
      curveVertex(477, 336);
      curveVertex(477, 336);
      curveVertex(453, 423);
      curveVertex(565, 484);
      curveVertex(521, 640);
      curveVertex(614, 694);
      curveVertex(637, 684);
      curveVertex(631, 653);
      curveVertex(594, 627);
      curveVertex(638, 492);
      curveVertex(655, 451);
      curveVertex(629, 420);
      curveVertex(579, 355);
      curveVertex(579, 355);
    endShape(CLOSE);

    // Torso
    beginShape();
      curveVertex(446, 181);
      curveVertex(446, 181);
      curveVertex(451, 144);
      curveVertex(512, 145);
      curveVertex(576, 173);
      curveVertex(603, 208);
      curveVertex(581, 356);
      curveVertex(478, 336);
      curveVertex(478, 336);
    endShape(CLOSE);

    // Lance
    pushStyle();
    pushMatrix();
    fill(lanceColor);  // Custom lance color from constructor
    
    if(position == TOP) {
      rotate(abs(sin(radians(acceleration)) / 8.0));
      translate(0,-40);
    }
    else {
      rotate(-abs(sin(radians(acceleration)) / 8.0));
      translate(0,40);
    }
    beginShape();
      vertex(189, 260);
      vertex(189, 300);
      vertex(1289, 285);
      vertex(1289, 275);
    endShape(CLOSE);
    
    ///////////////////////////////////////////////////
    fill(200, 50);
    rect(1089, 234, 200, 75);
    detector.addHitBox(new HitBox("lance", 1089, 234, 200, 75)); 
    ///////////////////////////////////////////////////
    
    popStyle();
    popMatrix();

    // Arm
    beginShape();
      curveVertex(475, 146);
      curveVertex(447, 185);
      curveVertex(461, 232);
      curveVertex(426, 298);
      curveVertex(460, 333);
      curveVertex(547, 337);
      curveVertex(619, 329);
      curveVertex(645, 282);
      curveVertex(630, 262);
      curveVertex(621, 290);
      curveVertex(611, 264);
      curveVertex(604, 292);
      curveVertex(589, 269);
      curveVertex(588, 292);
      curveVertex(515, 293);
      curveVertex(531, 239);
      curveVertex(555, 195);
      curveVertex(544, 158);
    endShape(CLOSE);

    // Cape
    pushMatrix();
    pushStyle();
    translate(575, 205);

    // Simulate cape moving with the wind during travel
    rotate(abs(sin(radians(velocity)/26.0)));

    fill(capeColor); // Custom cape color from constructor
    beginShape();
      curveVertex(0, 0);
      curveVertex(-12, -31);
      curveVertex(-52, -52);
      curveVertex(-95, -64);
      curveVertex(-146, -42);
      curveVertex(-197, 13);
      curveVertex(-215, 50);
      curveVertex(-253, 183);
      curveVertex(-287, 282);
      curveVertex(-271, 340);
      curveVertex(-246, 325);
      curveVertex(-222, 349);
      curveVertex(-182, 334);
      curveVertex(-158, 351);
      curveVertex(-131, 320);
      curveVertex(-105, 105);
      curveVertex(-58, 10);
    endShape(CLOSE);
    popStyle();
    popMatrix();

    // Helmet
    beginShape();
      curveVertex(497, 130);
      curveVertex(497, 130);
      curveVertex(480, 72);
      curveVertex(498, 37);
      curveVertex(543, 18);
      curveVertex(586, 24);
      curveVertex(614, 51);
      curveVertex(615, 79);
      curveVertex(520, 58);   // Upper left visor
      curveVertex(597, 150);  // Bottom right visor
      curveVertex(616, 83);
      curveVertex(596, 132);
      curveVertex(571, 170);
      curveVertex(571, 170);
    endShape(CLOSE);

    // Visor
    pushStyle();
    strokeWeight(5);
    beginShape();
      vertex(615, 79);
      vertex(520, 58);   // Upper left visor
      vertex(597, 150);  // Bottom right visor
    endShape(CLOSE);
    
    // Slits in visor
    line(553, 66, 553, 98);
    line(576, 72, 576, 123);
    line(598, 76, 598, 140);
    popStyle();

    popStyle();
    popMatrix();
    
    // Reset curve tightness
    curveTightness(0);
  }
}