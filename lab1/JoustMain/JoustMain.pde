Horse horse1, horse2;
Knight knight1;
float count;
int direction;
//final int LEFT = -1, RIGHT = 1;
boolean firstTime = true;

ArrayList<Horse> horses = new ArrayList<Horse>();

void setup() {
  size(1600, 720);
  count = 0;
  horse1 = new Horse();
  knight1 = new Knight();
  direction = RIGHT;

  //scale(0.5);
  background(230);
  int xOffset = 0;

  if(count >= 40 || count < 0) {
//    count = 0;
    direction *= -1;

//     scale(-1.0, 1.0);
  }
  
  xOffset = (int) pow(count, 2);
  
  
 //translate(xOffset, 0);

  
  pushMatrix();
  translate(0, 200);
  horse1.drawHorse();
  popMatrix();
  
  knight1.drawKnight();
  count += direction;
  
  
  //strokeWeight(0.5);
  //for(int x = 0; x < width; x += 10) {
  //  line(x,0,x,height); 
  //}
  
    //for(int i = 0; i < 10; i++) {
    //Horse testHorse = new Horse();
    //horses.add(testHorse);
  }
//}

void draw() {
 //scale(0.5);
 //background(230);
 //int xOffset = 0;

 //if(count >= 40 || count < 0) {
////    count = 0;
 //  direction *= -1;

////     scale(-1.0, 1.0);
 //}
  
 //xOffset = (int) pow(count, 2);
  
  
 ////translate(xOffset, 0);
 
 //background(230);
 //horse1.drawHorse();
  
 //count += direction;
  
//  strokeWeight(0.5);
//  for(int x = 0; x < width; x += 10) {
//    line(x,0,x,height); 
//  }
  
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