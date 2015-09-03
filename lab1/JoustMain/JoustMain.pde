Horse horse1, horse2;
float count;
int direction;
//final int LEFT = -1, RIGHT = 1;
boolean firstTime = true;

void setup() {
  size(1080, 720);
  count = 0;
  horse1 = new Horse();
  direction = RIGHT;
//  frameRate(15);

  //  scale(0.5);
  background(230);
  int xOffset = 0;

  if(count >= 40 || count < 0) {
//    count = 0;
    direction *= -1;

//     scale(-1.0, 1.0);

  
  }
  
  xOffset = (int) pow(count, 2);
  
  
 //translate(xOffset, 0);

  horse1.drawHorse();
  
  count += direction;
  
  
  //strokeWeight(0.5);
  //for(int x = 0; x < width; x += 10) {
  //  line(x,0,x,height); 
  //}
}

void draw() {
 ////scale(0.5);
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