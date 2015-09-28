ArrayList<Shape> shapes = new ArrayList<Shape>();
float camX, camY, camZ;

void setup() {
  size(800, 600, P3D);
  noStroke();

  for (int i = 0; i < 50; i++) {
    shapes.add(new Shape());
  }
  
  camX = 0;
  camY = 0;
  camZ = 2000;
}

void draw() {
  lights();
  background(0);
  fill(255);

  for (int i = 0; i < 50; i++) {
    shapes.get(i).drawShape();
  }


  keyboardInput();
  //  camera(0, 0, 1000, 0, 0, -1, 0, 1, 0);
  camera(camX, camY, camZ, mouseX*50, mouseY * 50, -100000, 0, 1, 0);
  
  
}

void keyboardInput() {
  if (keyPressed && (key == CODED)) {
    switch(keyCode) {
    case LEFT:
      camX -= 2;
      break;
    case RIGHT:
      camX += 2;
      break;
    case UP:
      camZ -= 2;
      break;
    case DOWN:
      camZ += 2;
      break;
    default:
      break;
    }
  }
}
