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

/** This class represents a horse with separately moveable limbs.  The legs rotate
/*  in unison to simulate walking, while the actual horizontal movement is controlled
/*  in JoustMain.  Each horse has a unique rider as well, which further bobs up/down
/*  as the horse animates. */

class Horse {

  Knight knight;     // Unique knight riding this horse
  color horseColor;  // Primary color of this horse

  Horse(color horseColor, color capeColor, color lanceColor, int position) {
    
    // Adjust this horse's color
    this.horseColor = horseColor;
    fill(horseColor);
    
    // Add a knight to ride this horse
    knight = new Knight(capeColor, lanceColor, position);
  }

  void drawHorse() {
    strokeWeight(4);
    
    fill(horseColor);
    drawHindBackLeg();   // Background 
    drawFrontBackLeg();  // Foreground
    drawTrunk();
    drawHindForeLeg();   // Background
    drawFrontForeLeg();  // Foreground
    drawHead();

    knight.drawKnight(); // Draw knight on top of horse
  }

  void drawTrunk() {
    
    // Bob trunk up/down
    pushMatrix();
    translate(0, sin(frameCount/4.0)*8);

    // Tail
    pushStyle();
    stroke(0);
    strokeWeight(2);
    beginShape();
      curveVertex(258, 209);
      curveVertex(258, 209);
      curveVertex(129, 243);
      curveVertex(97, 343);
      curveVertex(97, 506);
      curveVertex(105, 469);
      curveVertex(108, 509);
      curveVertex(122, 472);
      curveVertex(121, 510);
      curveVertex(138, 466);
      curveVertex(143, 366);
      curveVertex(155, 320);
      curveVertex(180, 270);
      curveVertex(189, 289);
    endShape(CLOSE);
    popStyle();

    // Trunk
    beginShape();
      curveVertex(237, 211);
      curveVertex(220, 240);
      curveVertex(270, 205);
      curveVertex(331, 194);
      curveVertex(450, 209);
      curveVertex(548, 225);
      curveVertex(631, 226);
      curveVertex(685, 206);
      curveVertex(736, 197);
      curveVertex(857, 242); // Upper right corner
      curveVertex(844, 323);
      curveVertex(848, 396);
      curveVertex(809, 449);
      curveVertex(722, 488);
      curveVertex(624, 485);
      curveVertex(528, 470);
      curveVertex(438, 445);
      curveVertex(378, 458);
      curveVertex(318, 466);
      curveVertex(196, 456);
      curveVertex(164, 383);
      curveVertex(171, 295);
      curveVertex(223, 239);
    endShape(CLOSE);

    popMatrix();
  }

  void drawHindBackLeg() {  

    // Animate leg movement
    int legOffsetX = 200;
    int legOffsetY = 350;
    pushMatrix();
    translate(legOffsetX, legOffsetY);
    rotate(sin(frameCount/4.0)/3);

    // Hind back leg
    beginShape();
      curveVertex(50, 50);
      curveVertex(150, 50);
      curveVertex(150, 100);
      curveVertex(50, 200);
      curveVertex(50, 300);
      curveVertex(75, 325);
      curveVertex(85, 350);
      curveVertex(5, 350);
      curveVertex(5, 325);
      curveVertex(-15, 300);
      curveVertex(-15, 200);
      curveVertex(-25, 180);
      curveVertex(20, 125);
      curveVertex(20, 50);
      curveVertex(50, 50);
    endShape();

    // Hind back hoof
    pushStyle();
    fill(255);
    beginShape();
      curveVertex(50, 300);
      curveVertex(50, 300);
      curveVertex(75, 325);
      curveVertex(85, 350);
      curveVertex(5, 350);
      curveVertex(5, 325);
      curveVertex(-15, 300);
    endShape();
    popStyle();
    popMatrix();
  }

  void drawHindForeLeg() {
    
    //Animate leg movement
    int legOffsetX = 150;
    int legOffsetY = 350;
    pushMatrix();
    translate(legOffsetX, legOffsetY);
    rotate(-sin(frameCount/4.0)/3);

    // Hind fore leg
    beginShape();
      curveVertex(50, 50);
      curveVertex(150, 0);
      curveVertex(150, 100);
      curveVertex(50, 200);
      curveVertex(50, 300);
      curveVertex(75, 325);
      curveVertex(85, 350);
      curveVertex(5, 350);
      curveVertex(5, 325);
      curveVertex(-15, 300);
      curveVertex(-15, 200);
      curveVertex(-25, 180);
      curveVertex(0, 125);
      curveVertex(0, 50);
      curveVertex(15, 0);
      curveVertex(15, -50);
    endShape();

    // Hind fore hoof
    pushStyle();
    fill(255);
    beginShape();
      curveVertex(50, 300);
      curveVertex(50, 300);
      curveVertex(75, 325);
      curveVertex(85, 350);
      curveVertex(5, 350);
      curveVertex(5, 325);
      curveVertex(-15, 300);
    endShape();
    popStyle();
    popMatrix();
  }

  void drawFrontForeLeg() {

    // Animate leg movement
    int legOffsetX = 795;
    int legOffsetY = 344;
    pushMatrix();
    translate(legOffsetX, legOffsetY);
    rotate(sin(frameCount/4.0)/3);
    
    // Front fore leg
    beginShape();
      curveVertex(0, 0);
      curveVertex(25, 23);
      curveVertex(35, 60);
      curveVertex(35, 92);
      curveVertex(28, 181);
      curveVertex(35, 201); // Right elbow edge
      curveVertex(25, 231);
      curveVertex(32, 302); // Begin hoof
      curveVertex(40, 316); 
      curveVertex(65, 361);
      curveVertex(29, 366);
      curveVertex(-35, 361);
      curveVertex(-26, 328); 
      curveVertex(-36, 307); // End hoof
      curveVertex(-34, 229);
      curveVertex(-45, 205);
      curveVertex(-39, 179);
      curveVertex(-70, 145);
      curveVertex(-101, 122);
      curveVertex(-127, 88);
      curveVertex(-143, 42);
    endShape();

    // Front fore hoof
    pushStyle();
    fill(255);
    beginShape();
      curveVertex(32, 302); // Begin hoof
      curveVertex(40, 316); 
      curveVertex(65, 361);
      curveVertex(29, 366);
      curveVertex(-35, 361);
      curveVertex(-26, 328); 
      curveVertex(-36, 307); // End hoof
    endShape(CLOSE);
    popStyle();
    popMatrix();
  }

  void drawFrontBackLeg() {
    
    // Animate leg movement
    int legOffsetX = 815;
    int legOffsetY = 344;
    pushMatrix();
    translate(legOffsetX, legOffsetY);
    rotate(sin(-frameCount/4.0)/3);

    // Front back leg
    beginShape();
      curveVertex(0, 0);
      curveVertex(25, 23);
      curveVertex(35, 60);
      curveVertex(35, 92);
      curveVertex(28, 181);
      curveVertex(35, 201); // Right elbow edge
      curveVertex(25, 231);
      curveVertex(32, 302); // Begin hoof
      curveVertex(40, 316); 
      curveVertex(65, 361);
      curveVertex(29, 366);
      curveVertex(-35, 361);
      curveVertex(-26, 328); 
      curveVertex(-36, 307); // End hoof
      curveVertex(-34, 229);
      curveVertex(-45, 205);
      curveVertex(-39, 179);
      curveVertex(-70, 145);
      curveVertex(-101, 122);
      curveVertex(-127, 88);
      curveVertex(-143, 42);
    endShape();

    // Front back hoof
    pushStyle();
    fill(255);
    beginShape();
      curveVertex(32, 302); // Begin hoof
      curveVertex(40, 316); 
      curveVertex(65, 361);
      curveVertex(29, 366);
      curveVertex(-35, 361);
      curveVertex(-26, 328); 
      curveVertex(-36, 307); // End hoof
    endShape(CLOSE);
    popStyle();
    popMatrix();
  }

  void drawHead() {

    // Bob head while moving
    pushMatrix();
    rotate(sin(-frameCount/4.0)/40);

    // Neck and head
    beginShape();
      curveVertex(700, 210);
      curveVertex(700, 210);
      curveVertex(717, 189);
      curveVertex(751, 153);
      curveVertex(774, 131);
      curveVertex(793, 103);
      curveVertex(816, 79);
      curveVertex(847, 62);
      curveVertex(875, 47);
      curveVertex(895, 41);
      curveVertex(923, 11);
      curveVertex(915, 46);
      curveVertex(923, 46);
      curveVertex(942, 14);
      curveVertex(937, 44);
      curveVertex(954, 50);
      curveVertex(968, 59);
      curveVertex(979, 72);
      curveVertex(1001, 117);
      curveVertex(1016, 148);
      curveVertex(1040, 165);
      curveVertex(1061, 191);
      curveVertex(1062, 231);
      curveVertex(1042, 259);
      curveVertex(1020, 264);  // Rostro-caudal border
      curveVertex(995, 254);
      curveVertex(969, 239);
      curveVertex(913, 231);
      curveVertex(895, 220);  // Ramus
      curveVertex(880, 204);
      curveVertex(856, 287);
      curveVertex(832, 315);
    endShape();

    // Draw mane along length of neck
    pushStyle();
    stroke(199, 99, 39);
    fill(horseColor);
    for (int i = 0, offset = -10; i < 20; i++, offset += 8) {
      // Draw many repeating hairs
      beginShape();
        curveVertex(709+ offset, 180 - offset);
        curveVertex(709+ offset, 180 - offset);
        curveVertex(700+ offset, 205 - offset);
        curveVertex(711+ offset, 217 - offset);
        curveVertex(706+ offset, 230 - offset);
        curveVertex(715+ offset, 237 - offset);
        curveVertex(712+ offset, 251 - offset);
        curveVertex(721+ offset, 263 - offset);
      endShape();
    }

    // Draw mane along dorsal neck behind ears
    for (int i = 0, offsetX = 150, offsetY = 150; i < 5; i++, offsetX += 8, offsetY += 2) {
      // Draw many repeating hairs
      beginShape();
        curveVertex(709+ offsetX, 180 - offsetY);
        curveVertex(709+ offsetX, 180 - offsetY);
        curveVertex(700+ offsetX, 205 - offsetY);
        curveVertex(711+ offsetX, 217 - offsetY);
        curveVertex(706+ offsetX, 230 - offsetY);
        curveVertex(715+ offsetX, 237 - offsetY);
        curveVertex(712+ offsetX, 251 - offsetY);
        curveVertex(721+ offsetX, 263 - offsetY);
      endShape();
    }

    // Eye
    stroke(0);
    fill(179, 79, 19);
    ellipseMode(RADIUS);
    ellipse(965, 105, 20, 10);
    fill(0);
    ellipseMode(CENTER);
    ellipse(975, 105, 10, 17);

    // Nostril
    ellipse(1047, 190, 25, 20);

    // Shade muzzle slightly darker shade
    fill(0, 70);
    beginShape();
    curveVertex(1001, 117);
    curveVertex(1016, 148);
    curveVertex(1040, 165);
    curveVertex(1061, 191);
    curveVertex(1062, 231);
    curveVertex(1042, 259);
    curveVertex(1020, 264);  // Rostro-caudal border
    curveVertex(995, 254);
    curveVertex(969, 239);
    curveVertex(913, 231);
    endShape();

    // Mouth
    strokeWeight(10);
    beginShape();
    curveVertex(1002, 222);
    curveVertex(1012, 234);
    curveVertex(1027, 247);
    curveVertex(1038, 253);
    curveVertex(1038, 253);
    endShape();

    popStyle();
    popMatrix();
  }
}