Horse horse1, horse2;
Knight knight1;
int count;
int direction;
final int LEFT = -1, RIGHT = 1;
boolean firstTime = true;
boolean reachedMiddle = false;
float velocity = 0;
float acceleration = 0;
float initialVelocity = 0;
float xOffset = 0;
float reverseOffset = 0;

ArrayList<Horse> horses = new ArrayList<Horse>();

void setup() {
  size(1600, 720);
  count = 0;
  horse1 = new Horse();
  knight1 = new Knight();
  horse2 = new Horse();
  direction = RIGHT;
  
  background(230);
  
  pushMatrix();

  //horse1.drawHorse();
  popMatrix();
  
  count += direction;
  }

void draw() {
  background(0, 200, 0);
  
 if(count == 0) {
  velocity = 0;
  initialVelocity = 0;
  acceleration = 0;
  direction = RIGHT;
 }
 else if(count == 179) {
  velocity = 0;
  initialVelocity = 0;
  acceleration = 0;
  direction = LEFT;
  reverseOffset = xOffset;
 }
 
 if(count < 89) {
   acceleration++;
   count++;
 }
 else if(count < 179) {
   acceleration--;
   count++;
 }
 else if(count < 269) {
  acceleration--;
  count++;
 }
 else if(count < 359) {
  acceleration++;
  count++;
 }

 velocity = initialVelocity + acceleration * ((count % 182) / 180.0) * 1.2;
 xOffset = initialVelocity * (count % 182 /10.0) + (0.5 * acceleration) * pow(count % 182 /10.0, 2);
 
 initialVelocity = velocity; 
 
 if(direction == RIGHT) {
   
   pushMatrix();
   translate(xOffset / 100.0, 150);
   scale(0.2, 0.2);
   
   horse1.drawHorse();
   popMatrix();
   
   
   pushMatrix();
   //translate(-xOffset / 100.0 - reverseOffset / 100.0 - 250, 550);
   translate(-xOffset / 100.0 + 1050, 250);
   scale(-0.2, 0.2);
   
   horse2.drawHorse();
   
   popMatrix();
   
 }
 else if(direction == LEFT) {

   pushMatrix();
   translate(xOffset / 100.0 + reverseOffset / 100.0 + 250, 150);
   scale(-0.2, 0.2);
   
   horse1.drawHorse();
   popMatrix();
   
   pushMatrix();
   translate(-xOffset / 100.0, 250);
   scale(0.2, 0.2);
   
   horse2.drawHorse();
   
   popMatrix();
   
   
 }
 
 //scale(0.2, 0.2);
 
 
 
 count = frameCount % 360;
}

void mousePressed() {
  
  if(firstTime == true) {
    println("beginShape();");
    firstTime = false;
  }
  if(mouseButton == LEFT) {
  println("curveVertex(" + mouseX + ", " + mouseY + ");");
  //println(mouseX + ", " + mouseY + ", ");
  strokeWeight(10);
  point(mouseX, mouseY);
  }
  else {
    println("endShape();");
  }

}