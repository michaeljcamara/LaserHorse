/** This class represents a horse with separately moveable limbs.  The legs rotate
/*  in unison to simulate walking, while the actual horizontal movement is controlled
/*  in JoustGameMain.  Each horse has a unique rider as well, which further bobs up/down
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

    // Tail
    pushStyle();
    pushMatrix();
    stroke(0);
    strokeWeight(2);
    // Bob trunk up/down
    translate(0, sin(-acceleration / 10.0 - frameCount/20.0) * 8);
    translate(258, 209);
    beginShape();
      curveVertex(0, 0);
      curveVertex(0, 0);
      curveVertex(-129, 34);
      curveVertex(-161, 134);
      curveVertex(-161, 297);
      curveVertex(-153, 260);
      curveVertex(-150, 300);
      curveVertex(-136, 263);
      curveVertex(-137, 301);
      curveVertex(-120, 257);
      curveVertex(-115, 157);
      curveVertex(-103, 111);
      curveVertex(-78, 61);
      curveVertex(-69, 80);
    endShape(CLOSE);
    popStyle();
    popMatrix();

    // Trunk
    pushMatrix();
    // Bob trunk up/down
    translate(0, sin(-acceleration / 10.0 - frameCount/20.0) * 8);
    translate(237, 211);
    beginShape();
      curveVertex(0, 0);
      curveVertex(-17, 29);
      curveVertex(33, -6);
      curveVertex(94, -17);
      curveVertex(213, -2);
      curveVertex(311, 14);
      curveVertex(394, 15);
      curveVertex(448, -5);
      curveVertex(499, -14);
      curveVertex(620, 31);
      curveVertex(607, 112);
      curveVertex(611, 185);
      curveVertex(572, 238);
      curveVertex(485, 277);
      curveVertex(387, 274);
      curveVertex(291, 259);
      curveVertex(201, 234);
      curveVertex(141, 247);
      curveVertex(81, 255);
      curveVertex(-41, 245);
      curveVertex(-73, 172);
      curveVertex(-66, 84);
      curveVertex(-14, 28);
    endShape(CLOSE);
    popMatrix();
  }

  void drawHindBackLeg() {  

    // Hind back leg
    // Animate leg movement
    pushMatrix();
    translate(200, 350);
    if (acceleration == 0)
      rotate(sin(yAcceleration / 8.0)/3);
    else
      rotate(sin(acceleration / 8.0)/3);
    translate(50, 50);
    beginShape();
      curveVertex(0, 0);
      curveVertex(100, 0);
      curveVertex(100, 50);
      curveVertex(0, 150);
      curveVertex(0, 250);
      curveVertex(25, 275);
      curveVertex(35, 300);
      curveVertex(-45, 300);
      curveVertex(-45, 275);
      curveVertex(-65, 250);
      curveVertex(-65, 150);
      curveVertex(-75, 130);
      curveVertex(-30, 75);
      curveVertex(-30, 0);
      curveVertex(0, 0);
    endShape(CLOSE);
    popMatrix();

    // Hind back hoof
    pushStyle();
    fill(255);
    pushMatrix();
    translate(200, 350);
    if (acceleration == 0)
      rotate(sin(yAcceleration / 8.0)/3);
    else
      rotate(sin(acceleration / 8.0)/3);
    translate(50, 50);
    beginShape();
      curveVertex(0, 250);
      curveVertex(0, 250);
      curveVertex(25, 275);
      curveVertex(35, 300);
      curveVertex(-45, 300);
      curveVertex(-45, 275);
      curveVertex(-65, 250);
    endShape(CLOSE);
    popMatrix();
    popStyle();
  }

  void drawHindForeLeg() {

    // Hind fore leg
    //Animate leg movement
    pushMatrix();
    translate(150, 350);
    if (acceleration == 0)
      rotate(-sin(yAcceleration / 8.0)/3);
    else
      rotate(-sin(acceleration / 8.0)/3);
    translate(50, 50);
    beginShape();
      curveVertex(0, 0);
      curveVertex(100, -50);
      curveVertex(100, 50);
      curveVertex(0, 150);
      curveVertex(0, 250);
      curveVertex(25, 275);
      curveVertex(35, 300);
      curveVertex(-45, 300);
      curveVertex(-45, 275);
      curveVertex(-65, 250);
      curveVertex(-65, 150);
      curveVertex(-75, 130);
      curveVertex(-50, 75);
      curveVertex(-50, 0);
      curveVertex(-35, -50);
      curveVertex(-35, -100);
    endShape();
    popMatrix();

    // Hind fore hoof
    pushStyle();
    pushMatrix();
    fill(255);
    translate(150, 350);
    if (acceleration == 0)
      rotate(-sin(yAcceleration / 8.0)/3);
    else
      rotate(-sin(acceleration / 8.0)/3);
    translate(50, 300);
    beginShape();
      curveVertex(0, 0);
      curveVertex(0, 0);
      curveVertex(25, 25);
      curveVertex(35, 50);
      curveVertex(-45, 50);
      curveVertex(-45, 25);
      curveVertex(-65, 0);
    endShape();
    popStyle();
    popMatrix();
  }

  //////////////////////////////////////////////////////////////////////////////////////////////
  // Note: I stopped modifying the code here, trying to keep all shapes drawn at the origin and
  //      using solely transformations for change.  This was taking a large amount of time to
  //      correct the original code to achieve the same end results, so I focused more on the 
  //      function of my program instead.
  //////////////////////////////////////////////////////////////////////////////////////////////
  
  void drawFrontForeLeg() {

    // Animate leg movement
    int legOffsetX = 795;
    int legOffsetY = 344;
    pushMatrix();
    translate(legOffsetX, legOffsetY);

    if (acceleration == 0)
      rotate(sin(yAcceleration / 8.0)/3);
    else
      rotate(sin(acceleration / 8.0)/3);

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

    if (acceleration == 0)
      rotate(sin(-yAcceleration / 8.0)/3);
    else
      rotate(sin(-acceleration / 8.0)/3);

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

    //rotate(sin(-frameCount/4.0)/40);
    rotate(sin(-acceleration/10.0 - frameCount/20.0)/40);

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