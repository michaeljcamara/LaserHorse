ArrayList<Shape> shapes = new ArrayList<Shape>();
float camX, camY, camZ;
float angle, angleV;
float lookX, lookY, lookZ;
ArrayList<Ring> rings = new ArrayList<Ring>();
ArrayList<Ring> rings2, rings3, rings4, rings5, rings6;
ArrayList<ArrayList<Ring>> ringList = new ArrayList<ArrayList<Ring>>();
int numRings = 150;
int sizeRings = 20;
int numChains = 1;
ArrayList<Tetrahedron> tetras = new ArrayList<Tetrahedron>();
final int MOVE_SPEED = 5;

void setup() {
  size(800, 800, P3D);
  randomSeed(System.currentTimeMillis());
  noStroke();

  for (int i = 0; i < 10; i++) {
    shapes.add(new Shape());
  }
  
  camX = 0;
  camY = 0;
  camZ = 200;
  lookX = 0;
  lookY = 0;
  lookZ = -100000;
  angle = 0;
  angleV = 0;
  
  tetras.add(new Tetrahedron(0, 0, 0));

  //Ring firstRing = new Ring(0,0,-500, sizeRings, 0);  
  
  for(int j = 0; j < numChains; j++) {
    ArrayList<Ring> newChain = new ArrayList<Ring>();
    Ring firstRing = new Ring(0, 0, -500, sizeRings, j);
    newChain.add(firstRing);
    
    for(int i = 0; i < numRings; i++) {
      newChain.add(new Ring(newChain.get(i)));
    }
    
    ringList.add(newChain);
  }
}

void draw() {
  lights();
  //pointLight(122,122,122,mouseX,mouseY,camZ);
  background(0);
  fill(255);

//  for (int i = 0; i < 10; i++) {
//    shapes.get(i).drawShape();
//  }
  
  for (int i = 0; i < tetras.size(); i++) {
    tetras.get(i).drawShape();
  }

//  for(int i = 0; i < ringList.size(); i++) {
//    ArrayList<Ring> currentRings = ringList.get(i);
//    for(int j = 0; j < currentRings.size(); j++) {
//      
//      Ring currentRing = currentRings.get(j);
//    
//      if(j != 0)
//        currentRing.updatePosition();
//      //else
//      //  currentRing.adjustX(random(-5,5));
//      currentRing.drawRing();
//    }
//  }
  
  keyboardInput();
  mousePosition();
  camera(camX, camY, camZ, lookX , lookY, lookZ, 0, 1, 0);
}

void keyboardInput() {
  if (keyPressed && (key == CODED)) {
    switch(keyCode) {
    case LEFT:
      camX += -MOVE_SPEED * cos(radians(angle));;
      camZ += -MOVE_SPEED * sin(radians(angle));;
      break;
    case RIGHT:
      camX += MOVE_SPEED * cos(radians(angle));;
      camZ += MOVE_SPEED * sin(radians(angle));; 
      break;
    case UP:
      
      camX += MOVE_SPEED * sin(radians(angle));;
      camZ += -MOVE_SPEED * cos(radians(angle));;
      break;
    case DOWN:
      
      camX += -MOVE_SPEED * sin(radians(angle));
      camZ += MOVE_SPEED * cos(radians(angle));;
      break;
    default:
      break;
    }
  }
    else if(keyPressed){
    switch(key) {
    case 'a':
      camX += -MOVE_SPEED * cos(radians(angle));;
      camZ += -MOVE_SPEED * sin(radians(angle));;
      break;
    case 'd':
      camX += MOVE_SPEED * cos(radians(angle));;
      camZ += MOVE_SPEED * sin(radians(angle));; 
      break;
    case 'w':
      
      camX += MOVE_SPEED * sin(radians(angle));;
      camZ += -MOVE_SPEED * cos(radians(angle));;
      break;
    case 's':
      
      camX += -MOVE_SPEED * sin(radians(angle));
      camZ += MOVE_SPEED * cos(radians(angle));;
      break;
    case 'r':
      camY += -MOVE_SPEED;
      break;
    case 'f':
      camY += MOVE_SPEED;
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
