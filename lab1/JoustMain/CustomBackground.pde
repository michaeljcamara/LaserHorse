class CustomBackground {

  CustomBackground() {
  }
  void drawBackground() {
    //background(0,255,0);
    pushStyle();
    fill(0, 100, 0);
    stroke(0, 100, 0);
    strokeWeight(1);
    //int i = 10, j = 10;
    
    PShape s = createShape(GROUP);
    s.setFill(0);
    s.setStroke(0);
    PShape test = createShape();

s.beginShape();
   for(int i = 0; i < 1000; i += 10) {
     for(int j = 0; j < 1000; j += 10) {
        
       
       test.beginShape();
       test.fill(0);
       test.stroke(0);
       test.curveVertex(0 + i, 23 + j);
       test.curveVertex(0 + i, 23 + j);
       test.curveVertex(7 + i, 15 + j);
       test.curveVertex(15+  i, 12 + j);
       test.curveVertex(20 + i, 12 + j);
       test.endShape();
       test.setFill(0);
       test.setStroke(0);
       s.addChild(test);
       
     }
   }
    
    println(s.getChildCount());
    pushMatrix();
    translate(200,200);
    shape(s);
    popStyle();
    popMatrix();
  }
}