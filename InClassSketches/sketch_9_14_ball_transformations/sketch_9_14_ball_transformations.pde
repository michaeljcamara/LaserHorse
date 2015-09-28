
final float friction = 0.99;
final float airres = 0.999;
Ball myBall;

ArrayList<Ball> allBalls;

void setup() {
  size(720, 480);
  background(0);
  fill(255);
  
//  myBall = new Ball(width/2, 50, 10, 10);
  
  allBalls = new ArrayList<Ball>();
  for(int i = 0; i < 500; i++) {
    allBalls.add(new Ball(random(0, width), random(0, height), random(30, 50), random(30, 50), random(-2, 2), random(-2,2), (int)random(0,255), (int)random(0,255), (int)random(0,255)));
  }
}

void draw() {
  background(0);
//  fill(255);
//    background(50, 50, 255);
//  myBall.update();
//  myBall.drawBall();
  
  
  for(Ball thisBall : allBalls) {
    thisBall.update();
    thisBall.drawBall();
  }
}
