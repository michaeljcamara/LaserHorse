int prevX, prevY;
boolean firstTime = true;

void setup() {
 size(1000,1000);
 background(150); 
 println("beginShape();");
}

void draw() {
  strokeWeight(10);
  noFill();
  rect(0,0,1000,1000);
  fill(122);
  stroke(255);
  curveTightness(0.25);
  strokeJoin(MITER);
//  noFill();
  pushStyle();
  stroke(0);
beginShape();
  curveVertex(3, 4);
  curveVertex(388, 3);
  curveVertex(381, 259);
  curveVertex(5, 258);
  curveVertex(5, 6);
  curveVertex(386, 7);
  curveVertex(994, 6);
  curveVertex(997, 165);
  curveVertex(676, 199);
  curveVertex(386, 263);
  curveVertex(646, 386);
  curveVertex(666, 209);
  curveVertex(995, 165);
  curveVertex(996, 678);
  curveVertex(706, 668);
  curveVertex(648, 391);
  curveVertex(704, 665);
  curveVertex(336, 643);
  curveVertex(412, 862);
  curveVertex(593, 943);
  curveVertex(998, 943);
  curveVertex(995, 680);
  curveVertex(335, 643);
  curveVertex(132, 764);
  curveVertex(3, 943);
  curveVertex(989, 942);
  curveVertex(991, 683);
  curveVertex(338, 642);
  curveVertex(136, 763);
  curveVertex(10, 940);
  curveVertex(4, 259);
endShape();
popStyle();
  
}


void mousePressed() {
  if(mouseButton == LEFT) {
  
    if(firstTime == true) {
      prevX = mouseX;
      prevY = mouseY;
      firstTime = false;
    }
    fill(0);
    stroke(0);
    strokeWeight(15);
    point(mouseX, mouseY);
    line(prevX, prevY, mouseX, mouseY);
    prevX = mouseX;
    prevY = mouseY;
    
    //println(mouseX + " " + mouseY);
    println("\tcurveVertex(" + mouseX + ", " + mouseY + ");");
  
  }
  
  if(mouseButton == RIGHT) {
    println("endShape();");
  }
}
