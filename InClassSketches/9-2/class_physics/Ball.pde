class Ball {

  float sx, sy;
  float vx, vy;
  float wid, hei;
  int colR, colG, colB;
  float gravity;

  Ball(float x, float y, float w, float h, float vx, float vy, int colR, int colG, int colB) {

    sx = x;
    sy = y;
    wid = w;
    hei = h;

//    vx = 1.5;
//    vy = 2;
    this.vx = vx;
    this.vy = vy;
    
    this.colR = colR;
    this.colG = colG;
    this.colB = colB;
    
    gravity = random(-0.5, 0.5);
  }

  void update() {
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
  }

  void drawBall() {
    fill(colR, colG, colB);
    pushMatrix();
    translate(sx, sy);
    rotate(radians(frameCount));
    ellipse(0, 0, wid, hei);
    popMatrix();
  }
}

