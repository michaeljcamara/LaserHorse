class Horse {

  int x, y;
  

  //Horse(int x, int y) {
  //  this.x = x;
  //  this.y = y;

  //  fill(139, 69, 19);
  //}
  
  Horse() {
    x = 50;
    y = 50;
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
    drawFrontBackLeg();
    drawTrunk();
    drawHindForeLeg();
    drawFrontForeLeg();
    drawHead();
  }

  void drawTrunk() {
    //int bodyOffsetX = 50;
    //int bodyOffsetY = 50;

    pushMatrix();

    //translate(bodyOffsetX, bodyOffsetY);
    //translate(0, sin(frameCount/4.0)*4); // Bob trunk up/down
    
    //beginShape();
    //curveVertex(187, 161);
    //curveVertex(170, 190);
    //curveVertex(220, 155);
    //curveVertex(281, 144);
    //curveVertex(400, 159);
    //curveVertex(498, 175);
    //curveVertex(581, 176);
    //curveVertex(635, 156);
    //curveVertex(686, 147);
    //curveVertex(806, 227);
    //curveVertex(794, 273);
    //curveVertex(798, 346);
    //curveVertex(759, 399);
    //curveVertex(672, 438);
    //curveVertex(574, 435);
    //curveVertex(478, 420);
    //curveVertex(388, 395);
    //curveVertex(328, 408);
    //curveVertex(268, 416);
    //curveVertex(146, 406);
    //curveVertex(114, 333);
    //curveVertex(121, 245);
    //curveVertex(173, 189);
    //endShape(CLOSE);
    
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
    curveVertex(856, 277);
    curveVertex(844, 323);
    curveVertex(848, 396);
    curveVertex(809, 449);
    curveVertex(722, 488);
    curveVertex(624, 485);
    curveVertex(528, 470);
    //curveVertex(438, 429);
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
    strokeJoin(ROUND);

    int legOffsetX = 200;
    int legOffsetY = 350;

    pushMatrix();

    translate(legOffsetX, legOffsetY);
    rotate(sin(frameCount/4.0)/3);
    
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

    //beginShape();
    //  curveVertex(x, y);
    //  curveVertex(x + 100, y);
    //  curveVertex(x + 100, y + 50);
    //  curveVertex(x, y + 150);
    //  curveVertex(x, y + 250);
    //  curveVertex(x + 25, y + 275);
    //  curveVertex(x + 35, y + 300);
    //  curveVertex(x - 45, y + 300);
    //  curveVertex(x - 45, y + 275);
    //  curveVertex(x - 65, y + 250);
    //  curveVertex(x - 65, y + 150);
    //  curveVertex(x - 75, y + 130);
    //  curveVertex(x - 30, y + 75);
    //  curveVertex(x - 30, y);
    //  curveVertex(x, y);
    //endShape();
    
    //pushStyle();
    //fill(255);
    //beginShape();
    //  curveVertex(x, y + 250);
    //  curveVertex(x, y + 250);
    //  curveVertex(x + 25, y + 275);
    //  curveVertex(x + 35, y + 300);
    //  curveVertex(x - 45, y + 300);
    //  curveVertex(x - 45, y + 275);
    //  curveVertex(x - 65, y + 250);
    //endShape();
    //popStyle();

    popMatrix();
  }

  void drawHindForeLeg() {

    strokeJoin(ROUND);

    int legOffsetX = 150;
    int legOffsetY = 350;



    pushMatrix();
    translate(legOffsetX, legOffsetY);
   rotate(-sin(frameCount/4.0)/3);

    //beginShape();
    //  curveVertex(x, y);
    //  curveVertex(x + 100, y);
    //  curveVertex(x + 100, y + 50);
    //  curveVertex(x, y + 150);
    //  curveVertex(x, y + 250);
    //  curveVertex(x + 25, y + 275);
    //  curveVertex(x + 35, y + 300);
    //  curveVertex(x - 45, y + 300);
    //  curveVertex(x - 45, y + 275);
    //  curveVertex(x - 65, y + 250);
    //  curveVertex(x - 65, y + 150);
    //  curveVertex(x - 75, y + 130);
    //  curveVertex(x - 30, y + 75);
    //  curveVertex(x - 30, y);
    //  curveVertex(x, y);
    //endShape();
    
    beginShape();
      curveVertex(x, y);
      curveVertex(x + 100, y - 50);
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
      curveVertex(x - 50, y + 75);
      curveVertex(x - 50, y);
      curveVertex(x - 35, y - 50);
      curveVertex(x - 35, y - 100);
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
  
  void drawFrontForeLeg() {
   
    int legOffsetX = 795;
    int legOffsetY = 344;
    
    //beginShape();
    //curveVertex(786, 349);
    //curveVertex(815, 391);
    //curveVertex(828, 436);
    //curveVertex(824, 518);
    //curveVertex(829, 558);
    //curveVertex(820, 585);
    //curveVertex(831, 660);
    //curveVertex(859, 671);
    //curveVertex(884, 695);
    //curveVertex(773, 703);
    //curveVertex(771, 673);
    //curveVertex(760, 650);
    //curveVertex(761, 581);
    //curveVertex(752, 548);
    //curveVertex(753, 512);
    //curveVertex(722, 466);
    //curveVertex(668, 429);
    //curveVertex(640, 372);
    //endShape();
    
    pushMatrix();
    translate(legOffsetX, legOffsetY);
    rotate(sin(frameCount/4.0)/3);
    
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
    
      //beginShape();
      //curveVertex(795 - legOffsetX, 344 - legOffsetY);
      //curveVertex(820 - legOffsetX, 367 - legOffsetY);
      //curveVertex(830 - legOffsetX, 404 - legOffsetY);
      //curveVertex(830 - legOffsetX, 436 - legOffsetY);
      //curveVertex(823 - legOffsetX, 525 - legOffsetY);
      //curveVertex(830 - legOffsetX, 545 - legOffsetY); // Right elbow edge
      //curveVertex(820 - legOffsetX, 575 - legOffsetY);
      //curveVertex(827 - legOffsetX, 646 - legOffsetY); // Begin hoof
      //curveVertex(835 - legOffsetX, 660 - legOffsetY); 
      //curveVertex(860 - legOffsetX, 705 - legOffsetY);
      //curveVertex(824 - legOffsetX, 710 - legOffsetY);
      //curveVertex(764 - legOffsetX, 705 - legOffsetY);
      //curveVertex(769 - legOffsetX, 672 - legOffsetY); 
      //curveVertex(759 - legOffsetX, 651 - legOffsetY); // End hoof
      //curveVertex(761 - legOffsetX, 573 - legOffsetY);
      //curveVertex(750 - legOffsetX, 549 - legOffsetY);
      //curveVertex(756 - legOffsetX, 523 - legOffsetY);
      //curveVertex(725 - legOffsetX, 489 - legOffsetY);
      //curveVertex(694 - legOffsetX, 466 - legOffsetY);
      //curveVertex(668 - legOffsetX, 432 - legOffsetY);
      //curveVertex(652 - legOffsetX, 386 - legOffsetY);
      //endShape();
      
      //pushStyle();
      //fill(255);
      //beginShape();
      //curveVertex(827 - legOffsetX, 646 - legOffsetY); // Begin hoof
      //curveVertex(835 - legOffsetX, 660 - legOffsetY);
      //curveVertex(860 - legOffsetX, 705 - legOffsetY);
      //curveVertex(824 - legOffsetX, 710 - legOffsetY);
      //curveVertex(764 - legOffsetX, 705 - legOffsetY);
      //curveVertex(769 - legOffsetX, 672 - legOffsetY); 
      //curveVertex(759 - legOffsetX, 651 - legOffsetY); // End hoof
      //endShape(CLOSE);
      //popStyle();
      
      popMatrix();

  }
  
  void drawFrontBackLeg() {
    int legOffsetX = 815;
    int legOffsetY = 344;
    
    pushMatrix();
    translate(legOffsetX, legOffsetY);
    rotate(sin(-frameCount/4.0)/3);
    
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
    
    //beginShape();
    //  curveVertex(795 - legOffsetX, 344 - legOffsetY);
    //  curveVertex(820 - legOffsetX, 367 - legOffsetY);
    //  curveVertex(830 - legOffsetX, 404 - legOffsetY);
    //  curveVertex(830 - legOffsetX, 436 - legOffsetY);
    //  curveVertex(823 - legOffsetX, 525 - legOffsetY);
    //  curveVertex(830 - legOffsetX, 545 - legOffsetY); // Right elbow edge
    //  curveVertex(820 - legOffsetX, 575 - legOffsetY);
    //  curveVertex(827 - legOffsetX, 646 - legOffsetY); // Begin hoof
    //  curveVertex(835 - legOffsetX, 660 - legOffsetY); 
    //  curveVertex(860 - legOffsetX, 705 - legOffsetY);
    //  curveVertex(824 - legOffsetX, 710 - legOffsetY);
    //  curveVertex(764 - legOffsetX, 705 - legOffsetY);
    //  curveVertex(769 - legOffsetX, 672 - legOffsetY); 
    //  curveVertex(759 - legOffsetX, 651 - legOffsetY); // End hoof
    //  curveVertex(761 - legOffsetX, 573 - legOffsetY);
    //  curveVertex(750 - legOffsetX, 549 - legOffsetY);
    //  curveVertex(756 - legOffsetX, 523 - legOffsetY);
    //  curveVertex(725 - legOffsetX, 489 - legOffsetY);
    //  curveVertex(694 - legOffsetX, 466 - legOffsetY);
    //  curveVertex(668 - legOffsetX, 432 - legOffsetY);
    //  curveVertex(652 - legOffsetX, 386 - legOffsetY);
    //  endShape();
      
    //  pushStyle();
    //  fill(255);
    //  beginShape();
    //  curveVertex(827 - legOffsetX, 646 - legOffsetY); // Begin hoof
    //  curveVertex(835 - legOffsetX, 660 - legOffsetY);
    //  curveVertex(860 - legOffsetX, 705 - legOffsetY);
    //  curveVertex(824 - legOffsetX, 710 - legOffsetY);
    //  curveVertex(764 - legOffsetX, 705 - legOffsetY);
    //  curveVertex(769 - legOffsetX, 672 - legOffsetY); 
    //  curveVertex(759 - legOffsetX, 651 - legOffsetY); // End hoof
    //  endShape(CLOSE);
    //  popStyle();
    
    //beginShape();
    //  curveVertex(795 + legOffsetX, 344);
    //  curveVertex(820 + legOffsetX, 367);
    //  curveVertex(830 + legOffsetX, 404);
    //  curveVertex(830 + legOffsetX, 436);
    //  curveVertex(823 + legOffsetX, 525);
    //  curveVertex(830 + legOffsetX, 545); // Right elbow edge
    //  curveVertex(820 + legOffsetX, 575);
    //  curveVertex(827 + legOffsetX, 646); // Begin hoof
    //  curveVertex(835 + legOffsetX, 660);
    //  curveVertex(860 + legOffsetX, 705);
    //  curveVertex(824 + legOffsetX, 710);
    //  curveVertex(764 + legOffsetX, 705);
    //  curveVertex(769 + legOffsetX, 672); 
    //  curveVertex(759 + legOffsetX, 651);// End hoof
    //  curveVertex(761 + legOffsetX, 573);
    //  curveVertex(750 + legOffsetX, 549);
    //  curveVertex(756 + legOffsetX, 523);
      
    //  curveVertex(725 + legOffsetX, 489);
    //  curveVertex(694 + legOffsetX, 466);
    //  curveVertex(668 + legOffsetX, 432);
    //  curveVertex(652 + legOffsetX, 386);
    //endShape(); 
    
    //pushStyle();
    //fill(255);
    //beginShape();
    //  curveVertex(827 + legOffsetX, 646); // Begin hoof
    //  curveVertex(835 + legOffsetX, 660);
    //  curveVertex(860 + legOffsetX, 705);
    //  curveVertex(824 + legOffsetX, 710);
    //  curveVertex(764 + legOffsetX, 705);
    //  curveVertex(769 + legOffsetX, 672); 
    //  curveVertex(759 + legOffsetX, 651); // End hoof
    //endShape(CLOSE);
    //popStyle();
    
    popMatrix();
  }
  
  void drawHead() {
    
    pushMatrix();
    //translate(legOffsetX, legOffsetY);
    rotate(sin(-frameCount/4.0)/40);
    
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
      curveVertex(883, 204);
      curveVertex(857, 287);
      curveVertex(831, 306);
    endShape();
    
    pushStyle();
    stroke(199, 99, 39);
    fill(179, 79, 19);
    
    // Draw mane along length of neck
    for(int i = 0, offset = 0; i < 19; i++, offset += 8) {
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
    for(int i = 0, offsetX = 150, offsetY = 150; i < 5; i++, offsetX += 8, offsetY += 2) {
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
    
    // Draw eye
    stroke(0);
    fill(179, 79, 19);
    ellipseMode(RADIUS);
    ellipse(965, 105, 20, 10);
    fill(0);
    ellipseMode(CENTER);
    ellipse(970, 105, 7, 20);
    
    //Draw nostril
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

    //Draw mouth
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