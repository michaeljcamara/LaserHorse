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

void setup() {
  size(800, 600, P3D);
  randomSeed(System.currentTimeMillis());
  noStroke();

  for (int i = 0; i < 10; i++) {
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

  //Ring firstRing = new Ring(0,0,-500, sizeRings, 0);  
  
  for(int j = 0; j < numChains; j++) {
    ArrayList<Ring> newChain = new ArrayList<Ring>();
    Ring firstRing = new Ring(0, 0, -500, sizeRings, j);
    newChain.add(firstRing);
    
    for(int i = 0; i < numRings; i++) {
      newChain.add(new Ring(newChain.get(i)));
      //rings.add(new Ring(rings.get(i)));
      //rings2.add(new Ring(rings2.get(i)));
      //rings3 = new ArrayList<Ring>(rings3);
      //rings4 = new ArrayList<Ring>(rings4);
    }
    
    ringList.add(newChain);
  }
  
  //for(int i = 0; i < numRings; i++) {
  //  rings2.add(new Ring(rings2.get(i)));
  //}
  
  //rings2 = new ArrayList<Ring>(rings2);
  //rings3 = new ArrayList<Ring>(rings3);
  //rings4 = new ArrayList<Ring>(rings4);
  
  //ringList.add(rings);
  //ringList.add(rings2);
  //ringList.add(rings3);
  //ringList.add(rings4);
}

void draw() {
  lights();
  //pointLight(122,122,122,mouseX,mouseY,camZ);
  background(0);
  fill(255);

  for (int i = 0; i < 10; i++) {
    shapes.get(i).drawShape();
  }
  
  //rings.get(0).adjustX(frameCount/100.0);
  
  //for(int i = 0; i < rings.size(); i++) {
  //  Ring currentRing = rings.get(i);
    
  //  if(i != 0)
  //    currentRing.updatePosition();
  //  currentRing.drawRing(); 
  //}

  for(int i = 0; i < ringList.size(); i++) {
    ArrayList<Ring> currentRings = ringList.get(i);
    for(int j = 0; j < currentRings.size(); j++) {
      
      Ring currentRing = currentRings.get(j);
    
      if(j != 0)
        currentRing.updatePosition();
      //else
      //  currentRing.adjustX(random(-5,5));
      currentRing.drawRing();
    }
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
    else if(keyPressed){
    switch(key) {
    case 'a':
      camX += -20 * cos(radians(angle));;
      camZ += -20 * sin(radians(angle));;
      break;
    case 'd':
      camX += 20 * cos(radians(angle));;
      camZ += 20 * sin(radians(angle));; 
      break;
    case 'w':
      
      camX += 20 * sin(radians(angle));;
      camZ += -20 * cos(radians(angle));;
      break;
    case 's':
      
      camX += -20 * sin(radians(angle));
      camZ += 20 * cos(radians(angle));;
      break;
    case 'r':
      camY += -20;
      break;
    case 'f':
      camY += 20;
      break;
    default:
      break;
    }
  } 
}

//void keyPressed() {
//    switch(key) {
//    case 'a':
//      camX += -20 * cos(radians(angle));;
//      camZ += -20 * sin(radians(angle));;
//      break;
//    case 'd':
//      camX += 20 * cos(radians(angle));;
//      camZ += 20 * sin(radians(angle));; 
//      break;
//    case 'w':
      
//      camX += 20 * sin(radians(angle));;
//      camZ += -20 * cos(radians(angle));;
//      break;
//    case 's':
      
//      camX += -20 * sin(radians(angle));
//      camZ += 20 * cos(radians(angle));;
//      break;
//    case 'r':
//      camY += -20;
//      break;
//    case 'f':
//      camY += 20;
//      break;
//    default:
//      break;
//  } 
//}

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