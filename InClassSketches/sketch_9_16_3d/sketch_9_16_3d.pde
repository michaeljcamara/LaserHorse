float rotAngle;

void setup() {
  size(800, 600, P3D);
  background(0);
  fill(255);
//  noFill();
  stroke(255);
  rotAngle = 0;
  lights();
  ambientLight(0, 0, 192);
}


void draw() {
  lights();
  ambientLight(0, 0, 192);
  
  pushStyle();
  pushMatrix();
  background(0);
  //line(x1, y1, z1, x2, y2, z2);
//  line(30, 20, 0, 185, 120, 15);
//  stroke(128);
//  line(185, 120, 15, 185, 175, 50);
  
//  translate(width/2, height/2);
  translate(mouseX, mouseY);
  rotateY(rotAngle);
  rotateZ(rotAngle/2);
  box(75, 150, 25);
  sphere(150);
  
  
  
  popStyle();
  popMatrix();
  rotAngle += PI/48;
}
