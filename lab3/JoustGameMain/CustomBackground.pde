/** This class draws a static background, which includes a grass field and a sunset.
/*  Once this background is drawn once (called from setup()), the background is immediately
/*  saved as an image.  This saved image is then drawn with each call of drawBackground().
/*  This improves performance by reducing the copious amount of iterations in the initial
/*  setup phase. */

class CustomBackground {

  // Image of original background scene after constructor finishes 
  PImage img;

  CustomBackground() {
    // Create sunset
    background(155, 155, 0);
    pushStyle();
    ellipseMode(RADIUS);
    
    // Create first pass of sunset colors using lines
    for (int i = 0; i < height; i++) {
      strokeWeight(2);
      stroke(255.0/height * (i+150) *1.5, 255.0/height * i/1.5, 25, 150);
      line(0, height - i, width, height - i);
    }
    
    // Create umbra for sun
    for (int i = 100; i < height; i++) {
      strokeWeight(1);
      stroke(255.0/height * (i+200) *1.5 + 100, 255.0/height * (i+200)/1.5, 0, 255.0/height*i - 50);
      fill(255.0/height * (i+200), 255.0/height * i/3.0, 0, 255.0/height*i - 50);
      ellipse(width/2.0, height - 150, height - i - 150, height - i - 150);
    }

    // Create second pass of sunset colors using more transparent lines
    for (int i = 0; i < height; i++) {
      strokeWeight(2);
      stroke(255.0/height * (i+150) *1.5, 255.0/height * i/1.5, 25, 50);
      //line(0, i, width, i);
      line(0, height - i, width, height - i);
    }
    
    // Create a solid sun
    noStroke();
    fill(255.0, 255.0/4.0, 0);
    ellipse(width/2.0, height - 150, - 150, - 150);

    // Create grass texture for bottom of screen (where horse is running)
    strokeWeight(1);
    fill(0, 140, 0);
    stroke(0, 200, 0);
    rect(0, 500, width, height);
    fill(0, 255, 0); 

    // Create many individual grass blades
    for (int i = 0; i < width; i += 12) {
      for (int j = 475; j < height; j += 12) {
        // Fill screen with small grass blades
        beginShape();
        curveVertex(0 + i, 23 + j);
        curveVertex(0 + i, 23 + j);
        curveVertex(7 + i, 15 + j);
        curveVertex(15+  i, 12 + j);
        curveVertex(20 + i, 12 + j);
        endShape();
      }
    }

    // Save the previous scene as a separate image
    save("joustGameBackground.png");
    img = loadImage("joustGameBackground.png");

    popStyle();
  }

  void drawBackground() {

    // Draw previously saved image (to avoid performance delays from redundant iteration)
    background(img);
  }
}