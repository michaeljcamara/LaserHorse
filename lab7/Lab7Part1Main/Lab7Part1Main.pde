//**********************************************************************
// Michael Camara
// Honor Code Pledge: This work is mine unless otherwise cited
// CMPSC 382: Professor Wenskovitch
// Lab 7: Choosing Optimal Colors
// Part 1: Desaturating an Image
//**********************************************************************

void setup() {
  size(550,400);
  
  // Use HSB (HSV) color mode instead of RGB
  colorMode(HSB, 360, 100, 100);
  
  // Select the image for dietary fat comparison
  PImage img = loadImage("lab7part1.png");
  img.loadPixels();
  
  // Iterate through all pixels in the image
  for(int i = 0; i < img.pixels.length; i++) {
    
    // Store color information for current pixel
    color c = img.pixels[i];
    float imgHue = hue(c);
    float imgSat = saturation(c);
    float imgBright = brightness(c);
    
    // Desaturate red color
    if(imgHue < 30 ) {
      imgSat *= 0.7;
    }
    
    // Desaturate orange color
    else if(imgHue < 60) {
      imgSat *= 0.8;
    }
    
    // Desaturate yellow color
    else if(imgHue < 90) {
      imgSat *= 0.6;
    }
    
    // Desaturate blue color
    else if(imgHue > 150 && imgHue < 270) {
      imgSat *= 0.75;
    }
    
    // Update the pixel saturation
    img.pixels[i] = color(imgHue, imgSat, imgBright);   
  }
  
  // Draw complete desaturated image
  img.updatePixels();
  image(img, 0, 0);
}