ArrayList<Shape> shapes = new ArrayList<Shape>();
ArrayList<ComplexShape> complexShapes = new ArrayList<ComplexShape>();
float camX, camY, camZ;
float angle, angleV;
float lookX, lookY, lookZ;
Shape customShape = new Shape();
float sx, sy, sz;
ArrayList<Vertex> spheres = new ArrayList<Vertex>();
final float X_ADJUST = 10;
final float Y_ADJUST = 10;
final float Z_ADJUST = 10;

void setup() {
  size(800, 600, P3D);
  noStroke();
  
  camX = 0;
  camY = 0;
  camZ = -10000;
  lookX = 0;
  lookY = 0;
  lookZ = -100000;
  angle = 0;
  angleV = 0;
  
  sx = sy = sz = 0;
  
  pushMatrix();
  translate(0, 100, 0);
  fill(0, 255, 0);
  box(1000, 5, 1000);
  popMatrix();
}

void draw() {
  background(200);
  //noStroke();
  //lights();
  pointLight(200,122,122,0,0,0);
  //ambientLight(0,200,0);
  //directionalLight(150,100,100,0,0,-1);
  //pointLight(122,200,122,camX,camY,camZ);
  //lightSpecular(0,0,0);
  //lightFalloff(1,0,0);
  
  
  textSize(200);
  line(camX, -1000, camZ - 100, camX, 1000, camZ - 100);
  text('N', camX, -50, camZ - 1000);
  line(camX, -1000, camZ + 100, camX, 1000, camZ + 100);
  text('S', camX, -50, camZ + 1000);
  line(camX - 100, -1000, camZ, camX - 100, 1000, camZ);
  line(camX + 100, -1000, camZ, camX + 100, 1000, camZ);
  
    pushMatrix();
  translate(0, 200, 0);
  fill(0, 255, 0);
  box(50000, 5, 50000);
  
  popMatrix();
  
  fill(255);

 for (int i = 0; i < shapes.size(); i++) {
   shapes.get(i).drawShape();
   complexShapes.get(i).drawCShape();
 }

  customShape.drawShape();
  
  for(Vertex v : spheres) {
    pushMatrix();
    pushStyle();
    fill(255,0,0);
    translate(v.getX(), v.getY(), v.getZ());
    sphere(10);
    popStyle();
    popMatrix();
  }

  keyboardInput();
  mousePosition();
  //  camera(0, 0, 1000, 0, 0, -1, 0, 1, 0);
  camera(camX, camY, camZ, lookX , lookY, lookZ, 0, 1, 0);
  
   //println("CAM: " + camX + " " + camY + " " + camZ);
   //println("LOOK: " + lookX + " " + (lookY /100000.0 * 100 + camY) + " " + lookZ);

   //sy = lookY / 1000.0;

   sx = camX + cos(radians(90 - angle)) * 200;
   sz = camZ - sin(radians(90 - angle)) * 200;
   sy = camY + cos(radians(90 - angleV)) * 200;
   
   //if(angle >= 0 && angle <= 90) {
   //  sx = camX + cos(radians(90 - angle)) * 100;
   //  sz = camZ - sin(radians(90 - angle)) * 100;
   //}
   //else if(angle > 90 && angle <= 180) {
   //  sx = camX + cos(radians(angle-90)) * 100;
   //  sz = camZ + sin(radians(angle-90)) * 100;
   //}
   noCursor();
   //println(angleV);
   //println(sx);
   
   pushMatrix();
 pushStyle();
 translate(sx, sy, sz);
 sphere(10);
 popStyle();
 popMatrix();
  
}

void keyboardInput() {
  //if (keyPressed && (key == CODED)) {
    if(keyPressed) {
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
    case '9':
      for(int i = 0; i < complexShapes.size(); i++) {
        ComplexShape s = complexShapes.get(i);
        s.adjustZ(Z_ADJUST);
      }
      break;
    case '1':
      for(int i = 0; i < complexShapes.size(); i++) {
        ComplexShape s = complexShapes.get(i);
        s.adjustZ(-Z_ADJUST);
      }
      break;
    case '6':
      for(int i = 0; i < complexShapes.size(); i++) {
        ComplexShape s = complexShapes.get(i);
        s.adjustX(X_ADJUST);
      }
      break;
    case '4':
      for(int i = 0; i < complexShapes.size(); i++) {
        ComplexShape s = complexShapes.get(i);
        s.adjustX(-X_ADJUST);
      }
      break;
    case '8':
      for(int i = 0; i < complexShapes.size(); i++) {
        ComplexShape s = complexShapes.get(i);
        s.adjustY(Y_ADJUST);
      }
      break;
    case '2':
      for(int i = 0; i < complexShapes.size(); i++) {
        ComplexShape s = complexShapes.get(i);
        s.adjustY(-Y_ADJUST);
      }
      break;
    default:
      break;
    }
  }
}

void mousePressed() {
  //if(mouseButton == LEFT) {
  //  Vertex v = new Vertex(camX, camY, camZ - 200);
  //  customShape.addVertex(v);
  //  println(camX + " " + camY + " " + camZ);
  //}
  
  if(mouseButton == LEFT) {
    Vertex v = new Vertex(sx, sy, sz);
    customShape.addVertex(v);
    
    spheres.add(v);
  }
  
  else if(mouseButton == RIGHT) {
   shapes.add(new Shape(customShape));
   complexShapes.add(new ComplexShape(customShape)); 
   customShape.clearVertices();
    
  }
  
  
  //else if(mouseButton == RIGHT) {
  // println("CAM: " + camX + " " + camY + " " + camZ);
  // println("LOOK: " + lookX + " " + (lookY /100000.0 * 100 + camY) + " " + lookZ);
  // //sx = lookX / 1000.0 + camX;
  // //sx = camX - (sin(radians(angle))) * camX;
  // //sy = lookY / 1000.0 + camY;
  // sx = camX + cos(radians(angle)) * 20;
  // sz = camZ - sin(radians(angle)) * 20;
   
  // println(angle);
  //}
  
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