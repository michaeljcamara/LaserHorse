
float sx, sy;
float vx, vy;
final float gravity = 0.2;
final float friction = 0.99;
final float airres = 0.99;

void setup() {
  size(720, 480);
  background(0);
  sx = width/2;
  sy = 100;
  
  vx = 1.5;
  vy = 2;
  
}

void draw() {
  fill(255);
  background(0);
//  ellipse(width/2, height/2, 10, 10);
  ellipse(sx, sy, 10, 10);
  
  
  sx = sx + vx;
  sy = sy + vy;
 
  
  if(sy > height || sy < 0) {
    vy *= -1;
    sy = height;
    vy *= friction;
    vx *= friction;
  }
   
  if(sx > width || sx < 0) {
    vx *= -1;
    sx = 0;
    vy *= friction;
    vx *= friction;
  }
  
   vy += gravity;
   
   vx *= airres;
   vy *= airres;
  
  println(sx + " " + sy + " " + vx + " " + vy + " " + gravity);
  
//  if(vy > 0)
//    vy += gravity;
//  else
//    vy -= gravity;
  
}
