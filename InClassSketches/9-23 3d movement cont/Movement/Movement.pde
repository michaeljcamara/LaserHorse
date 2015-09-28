ArrayList<Shape> shapes = new ArrayList<Shape>();
float camX, camY, camZ;
float angle, angleV;
float lookX, lookY, lookZ;

void setup() {
  size(800, 600, P3D);
  noStroke();

  for (int i = 0; i < 500; i++) {
    shapes.add(new Shape());
  }
  
  camX = 0;
  camY = 0;
  camZ = 0;
  lookX = 0;
  lookY = 0;
  lookZ = -100000;
  angle = 0;
  angleV = 0;
}

void draw() {
  lights();
  background(0);
  fill(255);

  for (int i = 0; i < 500; i++) {
    shapes.get(i).drawShape();
  }


  keyboardInput();
  mousePosition();
  //  camera(0, 0, 1000, 0, 0, -1, 0, 1, 0);
  camera(camX, camY, camZ, lookX , lookY, lookZ, 0, 1, 0);
  
  
}

void keyboardInput() {
  if (keyPressed && (key == CODED)) {
    switch(keyCode) {
    case LEFT:
      camX += -20 * cos(radians(angle));;
      camZ += -20 * sin(radians(angle));;
      break;
    case RIGHT:
      camX += 20 * cos(radians(angle));;
      camZ += 20 * sin(radians(angle));; 
      break;
    case UP:
      
      camX += 20 * sin(radians(angle));;
      camZ += -20 * cos(radians(angle));;
      break;
    case DOWN:
      
      camX += -20 * sin(radians(angle));
      camZ += 20 * cos(radians(angle));;
      break;
    default:
      break;
    }
  }
}

void mousePosition() {
  float mouse = mouseX;
  float wid = width;
  float mou = mouseY;
  float hei = height;
  angle = ((mouse / wid) - 0.5) * 360;
  //angle = ((mouseX / (float)width) - 0.5) * 360;
  
  angleV = ((mou/hei) - 0.5) * 180;
  updateCameraPointing();
}

// look along x z plane
void updateCameraPointing() {
      lookX = 100000 * sin(radians(angle));
      lookY = 100000 * sin(radians(angleV));
      lookZ = -100000 * cos(radians(angle));
}
