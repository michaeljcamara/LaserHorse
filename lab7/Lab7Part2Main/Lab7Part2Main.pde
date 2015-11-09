//**********************************************************************
// Michael Camara
// Honor Code Pledge: This work is mine unless otherwise cited
// CMPSC 382: Professor Wenskovitch
// Lab 7: Choosing Optimal Colors
// Part 2: A Better Google Maps
//**********************************************************************

PImage img;
void setup() {
  
  
  // Use HSB (HSV) color mode instead of RGB
  colorMode(HSB, 360, 100, 100);
  
  // Select the image for dietary fat comparison
  img = loadImage("lab7part2.png");
  img.loadPixels();
  
  size(img.width, img.height);
  
  // Iterate through all pixels in the image
  for(int i = 0; i < img.pixels.length; i++) {
    
    color c = img.pixels[i];
    float imgHue = hue(c);
    float imgSat = saturation(c);
    float imgBright = brightness(c);
        

    
    // Generic buildings/houses (dark grey)
    if(imgHue > 41 && imgHue < 42 && imgSat < 7 && imgBright > 85) {
      imgSat = 0;
      imgBright *= 0.98;
    }

     // Parks/forests (default: varying shades of green)
     else if(imgHue > 80 && imgHue < 90 && imgSat < 30 && imgBright > 80) {
       imgHue *= 1.3;
       imgSat *= 0.9;
       imgBright *= 0.95;
     }
     
     // Rivers/bodies of water (light blue)
     else if(imgHue > 200 && imgHue < 220 && imgSat > 30 && imgSat < 55 && imgBright > 90) {
      imgSat *= 0.85;
     }
     
           // Side roads (default darkish gray)
    else if(imgHue >= 36 && imgHue < 41.5 && imgSat < 8 && imgSat > 5.6 && imgBright > 80) {
        imgHue = 200;
        imgSat *= 2;
        imgBright *= 0.97;
    }
     
     // Interstate (default: bright orange)
     else if(imgHue > 30 && imgHue < 40 && imgSat > 20 && imgBright > 80) {
       imgHue *= 1.2;
       imgSat *= 0.85;
       imgBright *= 0.95;
     }
     
     // Universities (default: light brown)
     else if(imgHue > 39 && imgHue < 45 && imgSat > 12 && imgSat < 20 && imgBright > 90) {
      imgSat *= 0.8; 
      imgBright *= 0.93;
     }
     
     // Healthcare facilities (default: pink)
     else if(imgHue > 6 && imgHue < 8) {
       imgSat *= 2;
       imgBright = 95;
     }
     
     // Primary roads (default: white)
     else if(imgHue == 0 && imgSat == 0 && imgBright == 100) {
        imgHue = 60;
        imgSat = 5;
     }
     
     // Main routes (default: yellow)
     else if(imgHue > 40 && imgHue < 50 && imgSat > 55 && imgSat < 70 && imgBright > 85) {
       imgHue *= 1.2;
       imgSat *= 0.8;
       imgBright *= 0.95;
     }
     
     else if(imgHue > 30 && imgHue < 80 && imgSat > 10 && imgSat < 30 && imgBright > 40 && imgBright < 80) {
       imgHue = 220;
       imgSat = 100;
       imgBright *= 0.9;
     }

//      else if(imgHue > 30 && imgHue < 80) {
//        imgHue = 200;
//        imgSat = 100;
//      }

      else
        imgSat *= 0.9;

    
    img.pixels[i] = color(imgHue, imgSat, imgBright);  
  
  }
  
  img.updatePixels();
  image(img, 0, 0);
  
}

float prevHue = 0, prevSat = 0, prevBright = 0;

void draw() {
  img.loadPixels();
  color c = img.pixels[mouseY * img.width + mouseX];
  float imgHue = hue(c);
  float imgSat = saturation(c);
  float imgBright = brightness(c);
  
  if(prevHue != imgHue && prevSat != imgSat && prevBright != imgBright) {
  println("Hue: " + imgHue);
  println("Saturation: " + imgSat);
  println("Brightness: " + imgBright);
  }
  
  prevHue = imgHue;
  prevSat = imgSat;
  prevBright = imgBright;
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
