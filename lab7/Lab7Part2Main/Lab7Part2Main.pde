//**********************************************************************
// Michael Camara
// Honor Code Pledge: This work is mine unless otherwise cited
// CMPSC 382: Professor Wenskovitch
// Lab 7: Choosing Optimal Colors
// Part 2: A Better Google Maps
//**********************************************************************

PImage img;
void setup() {
  size(1200,600);
  
  // Use HSB (HSV) color mode instead of RGB
  colorMode(HSB, 360, 100, 100);
  
  // Select the image for dietary fat comparison
  img = loadImage("lab7part2.png");
  img.loadPixels();
  
  // Iterate through all pixels in the image
  for(int i = 0; i < img.pixels.length; i++) {
    
    color c = img.pixels[i];
    float imgHue = hue(c);
    float imgSat = saturation(c);
    float imgBright = brightness(c);
    
    // Adjust Main Route color
    if(imgHue > 47 && imgHue < 49) {
      imgHue = 180;
    }
    
    // Adjust Interstate color
    else if(imgHue > 30 && imgHue < 45) {
      imgHue = 0;
    }
    
    img.pixels[i] = color(imgHue, imgSat, imgBright);  
  
  }
  
  img.updatePixels();
  image(img, 0, 0);
  
}

void draw() {
}

void mousePressed() {
  img.loadPixels();
  color c = img.pixels[mouseY * img.width + mouseX];
  float imgHue = hue(c);
  float imgSat = saturation(c);
  float imgBright = brightness(c);
  println("Hue: " + imgHue);
  println("Saturation: " + imgSat);
  println("Brightness: " + imgBright);
}