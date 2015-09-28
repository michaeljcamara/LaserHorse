int i;
boolean isRotating = false;

void setup() {
  size(800, 600);
  background(192);
  
  i = 0;
  
  
  
}


void draw() {
  background(192);
  rectMode(CENTER);
  pushMatrix();
  
//  rect(mouseX, mouseY, 100, 50);
  translate(mouseX, mouseY);

  
  if(mousePressed == true) {
    i++;
    scale(2);
  }
  rotate(radians(i));
  rect(0, 0, 100, 50);
  popMatrix();
  
  translate(75, 0);
  rect(0, 0, 25, 25);  
  translate(0, 25);
  rect(0, 0, 10, 10);
  
  
  
}

//void mousePressed() {
//  isRotating = !isRotating;
//}
