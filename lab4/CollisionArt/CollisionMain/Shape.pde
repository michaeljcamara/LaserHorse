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
    translate(x, y, z);
    fill(r, g, b);
    box(h, w, d);
    
    
    popMatrix();
  }
}