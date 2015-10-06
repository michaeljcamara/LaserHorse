float camX, camY, camZ;
float angle, angleV;
float lookX, lookY, lookZ;
ArrayList<Tetrahedron> tetras = new ArrayList<Tetrahedron>();
final int MOVE_SPEED = 5;
final int NUM_TETRAS = 1;

void setup() {
  size(800, 800, P3D);
  randomSeed(System.currentTimeMillis());
  noStroke();
  
  camX = 0;
  camY = 0;
  camZ = 2000;
  lookX = 0;
  lookY = 0;
  lookZ = -100000;
  angle = 0;
  angleV = 0;
  
  //tetras.add(new Tetrahedron(100, 100, 100));
  for(int i = 0; i < NUM_TETRAS; i++) {
    //tetras.add(new Tetrahedron(random(-1000, 1000), random(-1000, 1000), random(-1000, 1000)));
    tetras.add(new Tetrahedron(0,0,0));
  }
}

void draw() {
  lights();
  //pointLight(122,122,122,mouseX,mouseY,camZ);
  directionalLight(122,122,255,0,1,0);
  directionalLight(255,0,255,0,-1,0);
  //directionalLight(0,255 * abs(sin(frameCount/100.0)),200 * abs(sin(frameCount/100.0)),1,0,0);
  //directionalLight(0,255 * abs(sin(frameCount/100.0)),255* abs(cos(frameCount/100.0)),-1,0,0);
  background(0);
  fill(255);
  
  //translate(sin(frameCount/100.0)*100, sin(frameCount/100.0)*100,0);
  //rotateX(frameCount/100.0);
  //rotateY(frameCount/100.0);
  //rotateZ(frameCount/150.0);
  for (int i = 0; i < tetras.size(); i++) {
    //pushMatrix();
    //rotateX(frameCount/10000.0);
    //rotateY(frameCount/10000.0);
    //rotateZ(frameCount/15000.0);
    pushMatrix();
    //translate(frameCount*3,0,0);
    //rotateY(frameCount/50.0);
    //rotateX(frameCount/50.0);
    tetras.get(i).drawShape();
    popMatrix();
    //popMatrix();
  }
  
  fill(255,0,0, 100);
  stroke(255,0,0);
  strokeWeight(10);
  noFill();
  box(1000);
  
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