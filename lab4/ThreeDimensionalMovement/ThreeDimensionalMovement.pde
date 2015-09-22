ArrayList<Shape> shapes = new ArrayList<Shape>();
float camX, camY, camZ;
float lookX, lookY, lookZ;
Environment env;

void setup() {
  size(800, 600, P3D);
  noStroke();

  for (int i = 0; i < 25; i++) {
    shapes.add(new Shape());
  }
  
  camX = 0;
  camY = -600;
  camZ = 0;
  
  env = new Environment();
}

void draw() {
  lights();
  ambientLight(255, 255, 255);
  background(0);
  fill(100);

//  for (int i = 0; i < 25; i++) {
//    shapes.get(i).drawShape();
//  }


  keyboardInput();
  // camera(0, 0, 1000, 0, 0, -1, 0, 1, 0);
  //camera(camX, camY, camZ, mouseX*100, mouseY * 100, -100000, 0, 1, 0);
  //camera(camX, camY, camZ, lookX, lookY, -100000, 0, 1, 0);
  camera(camX, camY, camZ, mouseX * 150, mouseY * 150, -100000, 0, 1, 0);
  
  env.drawFloor();
  
  println("X = " + camX + " | Y = " + camY + " | Z = " + camZ);
}

void keyboardInput() {
  if (keyPressed && (key == CODED)) {
    switch(keyCode) {
    case LEFT:
      camX -= 100;
//      lookX -= 10000;
      break;
    case RIGHT:
      camX += 100;
      break;
    case UP:
      camZ -= 100;
      break;
    case DOWN:
      camZ += 100;
      break;
    default:
      break;
    }
  }
}
