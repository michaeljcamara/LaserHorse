Horse horse1, horse2;
float count;
int direction;
final int LEFT = -1, RIGHT = 1;

void setup() {
  size(1080, 720);
  count = 0;
  horse1 = new Horse(50, 50);
  direction = RIGHT;
//  frameRate(15);
}

void draw() {
//  scale(0.5);
  background(150);
  int xOffset = 0;

  if(count >= 40 || count < 0) {
//    count = 0;
    direction *= -1;

//     scale(-1.0, 1.0);
  }
  
  xOffset = (int) pow(count, 2);
  
  
//  translate(xOffset, 0);
  horse1.drawHorse();
  
  count += direction;
   
}
