class Shape {
  float x, y, z;
  float h, w, d; // height, width, depth
  int r, g, b;

  Shape() {
    x = random(-1000, 1000);
    y = random(-1000, 1000);
    z = random(-1000, 1000);

    h = random(0, 100);
    w = random(0, 100);
    d = random(0, 100);
    
    r = (int) random(0, 255);
    g = (int) random(0, 255);
    b = (int) random(0, 255);
  }
  
  void drawShape() {
    
    pushMatrix();
    pushStyle();
    translate(x, y, z);
    fill(r, g, b);
//    box(h, w, d);


//    beginShape();
//      curveVertex(0, 0, 100);
//      curveVertex(0, 0, 100);
//      curveVertex(-129, 34, 100);
//      curveVertex(-161, 134, 100);
//      curveVertex(-161, 297, 100);
//      curveVertex(-153, 260, 100);
//      curveVertex(-150, 300, 100);
//      curveVertex(-136, 263, 100);
//      curveVertex(-137, 301, 100);
//      curveVertex(-120, 257, 100);
//      curveVertex(-115, 157, 100);
//      curveVertex(-103, 111, 100);
//      curveVertex(-78, 61, 100);
//      curveVertex(-69, 80, 100);
//    endShape(CLOSE);
//
//        // Neck and head
//    beginShape();
//    curveVertex(700, 210, 100);
//    curveVertex(700, 210, 100);
//    curveVertex(717, 189, 100);
//    curveVertex(751, 153, 100);
//    curveVertex(774, 131, 100);
//    curveVertex(793, 103, 100);
//    curveVertex(816, 79, 100);
//    curveVertex(847, 62, 100);
//    curveVertex(875, 47, 100);
//    curveVertex(895, 41, 100);
//    curveVertex(923, 11, 100);
//    curveVertex(915, 46, 100);
//    curveVertex(923, 46, 100);
//    curveVertex(942, 14, 100);
//    curveVertex(937, 44, 100);
//    curveVertex(954, 50, 100);
//    curveVertex(968, 59, 100);
//    curveVertex(979, 72, 100);
//    curveVertex(1001, 117, 100);
//    curveVertex(1016, 148, 100);
//    curveVertex(1040, 165, 100);
//    curveVertex(1061, 191, 100);
//    curveVertex(1062, 231, 100);
//    curveVertex(1042, 259, 100);
//    curveVertex(1020, 264, 100);  // Rostro-caudal border
//    curveVertex(995, 254, 100);
//    curveVertex(969, 239, 100);
//    curveVertex(913, 231, 100);
//    curveVertex(895, 220, 100);  // Ramus
//    curveVertex(880, 204, 100);
//    curveVertex(856, 287, 100);
//    curveVertex(832, 315, 100);
//    endShape();
//    
//        beginShape();
//    curveVertex(700, 210, -100);
//    curveVertex(700, 210, -100);
//    curveVertex(717, 189, -100);
//    curveVertex(751, 153, -100);
//    curveVertex(774, 131, -100);
//    curveVertex(793, 103, -100);
//    curveVertex(816, 79, -100);
//    curveVertex(847, 62, -100);
//    curveVertex(875, 47, -100);
//    curveVertex(895, 41, -100);
//    curveVertex(923, 11, -100);
//    curveVertex(915, 46, -100);
//    curveVertex(923, 46, -100);
//    curveVertex(942, 14, -100);
//    curveVertex(937, 44, -100);
//    curveVertex(954, 50, -100);
//    curveVertex(968, 59, -100);
//    curveVertex(979, 72, -100);
//    curveVertex(1001, 117, -100);
//    curveVertex(1016, 148, -100);
//    curveVertex(1040, 165, -100);
//    curveVertex(1061, 191, -100);
//    curveVertex(1062, 231, -100);
//    curveVertex(1042, 259, -100);
//    curveVertex(1020, 264, -100);  // Rostro-caudal border
//    curveVertex(995, 254, -100);
//    curveVertex(969, 239, -100);
//    curveVertex(913, 231, -100);
//    curveVertex(895, 220, -100);  // Ramus
//    curveVertex(880, 204, -100);
//    curveVertex(856, 287, -100);
//    curveVertex(832, 315, -100);
//    endShape();
    
    
    popMatrix();
    popStyle();
  }
}

