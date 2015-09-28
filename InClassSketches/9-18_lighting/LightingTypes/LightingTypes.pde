void setup() {
  size(800, 600, P3D);
  noStroke();
  fill(255);
} //setup

void draw() {
  background(0);
  //lights();
  int dim = 18;
  ambientLight(102, 102, 102);
  directionalLight(255, 255, 255, -1, -1, 0);
  //pointLight(0, 0, 255, mouseX, mouseY, 100);
  //spotLight(0, 255, 0, mouseX, mouseY, 200, 0, 0, -1, PI, 50);
  
  
  rotateY(PI/24);
  translate(width/2, height/2, -50);
  camera(0, 0, 1000, mouseX-width/2, mouseY-height/2, -1, 0, 1, 0);
//  camera(mouseX, mouseY, 100, 0, 0, -1, 0, 1, 0);
  for (int i = -height/2; i < height/2; i += dim*1.4) {
    for (int j = -height/2; j < height; j += dim*1.4) {
      pushMatrix();
      translate(i, j, -j);
      box(dim);
      //sphere(dim/2);
      popMatrix();
    } //for
  } //for
  
  
  
} //draw
