/** This class represents a single coin, the object the player is trying to collect with the
/*  horse and rider.  Once a coin is collected via CollisionDetector, it is removed and replaced
/*  with a diferent coin. */

class Coin {
  float x, y, rWidth, rHeight;

  Coin(float x, float y, float rWidth, float rHeight) {

    this.x = x;
    this.y = y;
    this.rWidth = rWidth;
    this.rHeight = rHeight;

    drawCoin();
    
  }

  // Draw the created coin on the screen with a dollar sign on it
  void drawCoin() {
    pushMatrix();
    pushStyle();
    fill(255, 255, 0);
    stroke(0);
    strokeWeight(10);
    ellipseMode(CORNER);
    translate(x, y);
    ellipse(0, 0, rWidth, rHeight);

    textSize(80);
    fill(0);
    textAlign(CENTER, CENTER);
    text("$", 0, 0, rWidth, rHeight*0.9);
    popStyle();
    popMatrix();
  }

  // Simple get methods
  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getWidth() {
    return rWidth;
  }

  float getHeight() {
    return rHeight;
  }
}