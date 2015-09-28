float sx, sy;
float vx, vy;
final float gravity = 0.2; 
final float friction = 0.99;
final float airres = 0.999;

void setup() {
  size(720, 480);
  background(0);
  sx = width/2;
  sy = 100;
  vx = 1.5;
  vy = 2;
} //setup

void draw() {
  background(0);
  fill(255);
  ellipse(sx, sy, 10, 10);
  
  sx = sx + vx;
  sy += vy; 

  
  if (sy > height) {
    vy = -vy;
    sy = height;
    vy = vy * friction;
    vx *= friction;
  } //if
  
  if (sx > width) {
    vx = -vx;
    sx = width;
    vy *= friction;
    vx *= friction;
  } //if
  
  if (sy < 0) {
    vy = -vy;
    sy = 0;
    vy *= friction;
    vx *= friction;
  } //if
  
  if (sx < 0) {
    vx = -vx;
    sx = 0;
    vy *= friction;
    vx *= friction;
  } //if
  
 
    vy += gravity; 
    
    vy *= airres;
    vx *= airres;


  
  System.out.println(sx + " " + sy + " " + vx + " " + vy + " " + gravity);
} //draw
