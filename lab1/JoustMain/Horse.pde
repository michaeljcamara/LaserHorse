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
    drawFrontBackLeg();
    drawTrunk();
    drawHindForeLeg();
    drawFrontForeLeg();
  }

  void drawTrunk() {
    //int bodyOffsetX = 100;
    //int bodyOffsetY = 200;

    int bodyOffsetX = 50;
    int bodyOffsetY = 50;

    pushMatrix();

    translate(bodyOffsetX, bodyOffsetY);
    //translate(0, sin(frameCount/4.0)*4); // Bob trunk up/down

    //    line(x, y, x + 500, y );
    //    line(x, y + 200, x + 500, y + 200);

//    noStroke();
//    ellipse(x, y, 100, 200);
//    ellipse(x + 400, y, 100, 200);
//    rect(x + 50, y, 400, 200);
//    stroke(0);

    //beginShape();
    //  curveVertex(x, y);
    //  curveVertex(x, y);
    //  curveVertex(x + 150, y - 20);
    //  curveVertex(x + 250, y + 20);
    //  curveVertex(x + 325, y - 30);  // shoulder
    //  curveVertex(x + 375, y + 100);
    //  curveVertex(x + 400, y + 150);
    //  curveVertex(x + 225, y + 150);
    //  curveVertex(x + 150, y + 100);
    //  curveVertex(x + 125, y + 150);
    //  curveVertex(x, y + 150);
    //  curveVertex(x - 25, y + 75);
    //  curveVertex(x - 25, y + 75);
    //endShape(CLOSE);
    
    beginShape();
    curveVertex(187, 161);
    curveVertex(170, 190);
    curveVertex(220, 155);
    curveVertex(281, 144);
    curveVertex(400, 159);
    curveVertex(498, 175);
    curveVertex(581, 176);
    curveVertex(635, 156);
    curveVertex(686, 147);
    curveVertex(806, 227);
    curveVertex(794, 273);
    curveVertex(798, 346);
    curveVertex(759, 399);
    curveVertex(672, 438);
    curveVertex(574, 435);
    curveVertex(478, 420);
    //curveVertex(388, 379);
    curveVertex(388, 395);
    curveVertex(328, 408);
    curveVertex(268, 416);
    curveVertex(146, 406);
    curveVertex(114, 333);
    curveVertex(121, 245);
    curveVertex(173, 189);

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
    translate(legOffsetX,350);
    rotate(sin(frameCount/4.0)/3);
    
      beginShape();
      curveVertex(795 - legOffsetX, 344 - legOffsetY);
      curveVertex(820 - legOffsetX, 367 - legOffsetY);
      curveVertex(830 - legOffsetX, 404 - legOffsetY);
      curveVertex(830 - legOffsetX, 436 - legOffsetY);
      curveVertex(823 - legOffsetX, 525 - legOffsetY);
      curveVertex(830 - legOffsetX, 545 - legOffsetY); // Right elbow edge
      curveVertex(820 - legOffsetX, 575 - legOffsetY);
      curveVertex(827 - legOffsetX, 646 - legOffsetY); // Begin hoof
      curveVertex(835 - legOffsetX, 660 - legOffsetY); 
      curveVertex(860 - legOffsetX, 705 - legOffsetY);
      curveVertex(824 - legOffsetX, 710 - legOffsetY);
      curveVertex(764 - legOffsetX, 705 - legOffsetY);
      curveVertex(769 - legOffsetX, 672 - legOffsetY); 
      curveVertex(759 - legOffsetX, 651 - legOffsetY); // End hoof
      curveVertex(761 - legOffsetX, 573 - legOffsetY);
      curveVertex(750 - legOffsetX, 549 - legOffsetY);
      curveVertex(756 - legOffsetX, 523 - legOffsetY);
      curveVertex(725 - legOffsetX, 489 - legOffsetY);
      curveVertex(694 - legOffsetX, 466 - legOffsetY);
      curveVertex(668 - legOffsetX, 432 - legOffsetY);
      curveVertex(652 - legOffsetX, 386 - legOffsetY);
      endShape();
      
      pushStyle();
      fill(255);
      beginShape();
      curveVertex(827 - legOffsetX, 646 - legOffsetY); // Begin hoof
      curveVertex(835 - legOffsetX, 660 - legOffsetY);
      curveVertex(860 - legOffsetX, 705 - legOffsetY);
      curveVertex(824 - legOffsetX, 710 - legOffsetY);
      curveVertex(764 - legOffsetX, 705 - legOffsetY);
      curveVertex(769 - legOffsetX, 672 - legOffsetY); 
      curveVertex(759 - legOffsetX, 651 - legOffsetY); // End hoof
      endShape(CLOSE);
      popStyle();
  
      //beginShape();
      //curveVertex(795, 344);
      //curveVertex(820, 367);
      //curveVertex(830, 404);
      //curveVertex(830, 436);
      //curveVertex(823, 525);
      //curveVertex(830, 545); // Right elbow edge
      //curveVertex(820, 575);
      //curveVertex(827, 646); // Begin hoof
      //curveVertex(835, 660); 
      //curveVertex(860, 705);
      //curveVertex(824, 710);
      //curveVertex(764, 705);
      //curveVertex(769, 672); 
      //curveVertex(759, 651); // End hoof
      //curveVertex(761, 573);
      //curveVertex(750, 549);
      //curveVertex(756, 523);
      //curveVertex(725, 489);
      //curveVertex(694, 466);
      //curveVertex(668, 432);
      //curveVertex(652, 386);
      //endShape();
      
      //pushStyle();
      //fill(255);
      //beginShape();
      //curveVertex(827, 646); // Begin hoof
      //curveVertex(835, 660);
      //curveVertex(860, 705);
      //curveVertex(824, 710);
      //curveVertex(764, 705);
      //curveVertex(769, 672); 
      //curveVertex(759, 651); // End hoof
      //endShape(CLOSE);
      //popStyle();
      
      popMatrix();

  }
  
  void drawFrontBackLeg() {
    int legOffsetX = 695;
    int legOffsetY = 344;
    
    pushMatrix();
    translate(legOffsetX, legOffsetY);
    rotate(sin(-frameCount/4.0)/3);
    
    beginShape();
      curveVertex(795 - legOffsetX, 344 - legOffsetY);
      curveVertex(820 - legOffsetX, 367 - legOffsetY);
      curveVertex(830 - legOffsetX, 404 - legOffsetY);
      curveVertex(830 - legOffsetX, 436 - legOffsetY);
      curveVertex(823 - legOffsetX, 525 - legOffsetY);
      curveVertex(830 - legOffsetX, 545 - legOffsetY); // Right elbow edge
      curveVertex(820 - legOffsetX, 575 - legOffsetY);
      curveVertex(827 - legOffsetX, 646 - legOffsetY); // Begin hoof
      curveVertex(835 - legOffsetX, 660 - legOffsetY); 
      curveVertex(860 - legOffsetX, 705 - legOffsetY);
      curveVertex(824 - legOffsetX, 710 - legOffsetY);
      curveVertex(764 - legOffsetX, 705 - legOffsetY);
      curveVertex(769 - legOffsetX, 672 - legOffsetY); 
      curveVertex(759 - legOffsetX, 651 - legOffsetY); // End hoof
      curveVertex(761 - legOffsetX, 573 - legOffsetY);
      curveVertex(750 - legOffsetX, 549 - legOffsetY);
      curveVertex(756 - legOffsetX, 523 - legOffsetY);
      curveVertex(725 - legOffsetX, 489 - legOffsetY);
      curveVertex(694 - legOffsetX, 466 - legOffsetY);
      curveVertex(668 - legOffsetX, 432 - legOffsetY);
      curveVertex(652 - legOffsetX, 386 - legOffsetY);
      endShape();
      
      pushStyle();
      fill(255);
      beginShape();
      curveVertex(827 - legOffsetX, 646 - legOffsetY); // Begin hoof
      curveVertex(835 - legOffsetX, 660 - legOffsetY);
      curveVertex(860 - legOffsetX, 705 - legOffsetY);
      curveVertex(824 - legOffsetX, 710 - legOffsetY);
      curveVertex(764 - legOffsetX, 705 - legOffsetY);
      curveVertex(769 - legOffsetX, 672 - legOffsetY); 
      curveVertex(759 - legOffsetX, 651 - legOffsetY); // End hoof
      endShape(CLOSE);
      popStyle();
    
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
}