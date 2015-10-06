//*********************************************************************************
// Honor Code: The work I am submitting is a result of my own thinking and efforts.
// Michael Camara
// CMPSC 382 Fall 2015 (Professor Wenskovitch)
// Lab # 4
// Due Date: 10/6/15
// 
// Purpose: Create a 3D sketch in processing, including full camera movement and
//          different lighting schemes.
//********************************************************************************

float camX, camY, camZ;         // The position of the camera in the sketch
float angle, angleV;            // The relative angle of the camera
float lookX, lookY, lookZ;      // Control the direction of camera
ArrayList<DualTetrahedron> tetras;  // List containing all tetrahedrons created
char lightingMode = ' ';    // Indicate currently selected lighting mode
final int MOVE_SPEED = 50;  // Control how quickly camera moves across screen

// Adjust these to change the characteristics of the tetrahedrons!
final int NUM_TETRAS = 750;      // Default to 750, but can handle more (albeit slowly)
final int BOX_SIZE = 2000;       // Size of the bounding box controlling collision
final int TETRA_SPEED_MIN = -10;
final int TETRA_SPEED_MAX = 10;
final int TETRA_SIZE = 100;

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
  
  tetras = new ArrayList<DualTetrahedron>();
  for(int i = 0; i < NUM_TETRAS; i++) {
    tetras.add(new DualTetrahedron(0,0,0));
  }
}

void draw() {
  
  // Determine which lighting mode to use
  switch(lightingMode) {
    // Move around the box to see different color presentations!
    case 'q':
      directionalLight(0,0,200,0,0,-1);  // Blue light pointing ahead (z-)
      directionalLight(200,0,200,-1,0,0);  // Violet light pointing left (x-)
      directionalLight(0,200,0,1,0,0);  // Green light pointing right (x+)
      break;
    case 'w':
      pointLight(255,0,0,0,0,0);     //CENTER: red
      pointLight(0,255,0,0,0, BOX_SIZE * (1/3.0));  //z inback: green
      pointLight(0,0,255,0,0, -BOX_SIZE * (1/3.0));  //z infront: blue
      break;
    case 'e':
      spotLight(255, 0, 0, camX, camY, camZ, lookX, lookY, lookZ, PI/2.0, 100);
      pointLight(255 * abs(sin(frameCount/100.0)), 255 * abs(sin(frameCount/100.0)), 0 * abs(sin(frameCount/100.0)),0,0,0);
      break;
    default:
      lights();
      break;
  }
  
  background(0);  // black background

  // Draw all dual tetrahedrons that have been created
  for (int i = 0; i < tetras.size(); i++) {
    tetras.get(i).drawShape();
  }
  
  // Draw the bounding box for collisions
  pushStyle();
  stroke(255, 50);
  strokeWeight(3);
  noFill();
  box(BOX_SIZE);
  popStyle();
  
  keyboardInput();  // Control movement of camera with keyboard
  mousePosition();  // Control direction/angle of camera with mouse
  camera(camX, camY, camZ, lookX , lookY, lookZ, 0, 1, 0);  // Adjust camera based on above calculations
}

void keyboardInput() {
  
  // Control camera movement
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
  
    // Adjust the lighting mode currently selected
    // (or move up/down in the Y direction)
    else if(keyPressed){
    switch(key) {
    case 'w':
      lightingMode = 'w';
      break;
    case 'q':
      lightingMode = 'q';
      break;
    case 'e':
      lightingMode = 'e';
      break;
    case 'r':
      camY += -MOVE_SPEED; // move "up"
      break;
    case 'f':
      camY += MOVE_SPEED;  // move "down"
      break;
    default:
      break;
    }
  } 
}

// Calculate relative position of mouse on screen
void mousePosition() {
  float mouse = mouseX;
  float wid = width;
  float mou = mouseY;
  float hei = height;
  angle = ((mouse / wid) - 0.5) * 360;  
  angleV = ((mou/hei) - 0.5) * 180;
  updateCameraPointing();
}

// Control where the camera is pointing relative to mouse
void updateCameraPointing() {
      lookX = 100000 * sin(radians(angle));
      lookY = 100000 * sin(radians(angleV));
      lookZ = -100000 * cos(radians(angle));
}
