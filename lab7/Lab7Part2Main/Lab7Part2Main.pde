//**********************************************************************
// Michael Camara
// Honor Code Pledge: This work is mine unless otherwise cited
// CMPSC 382: Professor Wenskovitch
// Lab 7: Choosing Optimal Colors
// Part 2: A Better Google Maps
//**********************************************************************

// The imported image of Google Maps
PImage img;

// The HSV values for the pixel previously recorded in draw()
float prevHue = 0, prevSat = 0, prevBright = 0;

// Alter each section of a Google Map image
void setup() {

  // Use HSB (HSV) color mode instead of RGB
  colorMode(HSB, 360, 100, 100);

  // Select the Google Map image
  img = loadImage("lab7part2.png");
  img.loadPixels();

  // Set size of canvas to fit the image exactly
  size(img.width, img.height);

  // Iterate through all pixels in the image
  for (int i = 0; i < img.pixels.length; i++) {

    // Record the color information for the given pixel
    color c = img.pixels[i];

    // Transform this color based on which part of Google Maps it represents
    color updatedColor = transformColor(c);

    // Update pixel using one of above transformations
    img.pixels[i] = updatedColor;
  }

  // Draw the updated image
  img.updatePixels();
  image(img, 0, 0);
}

// Transform a given color's HSV values according to which part of a Google Map
// image it represents.  For instance, if the color is a bright blue, then it is
// likely a body of water, and so it will be desaturated slightly.
color transformColor(color c) {

  // Record the color's HSV values
  float imgHue = hue(c);
  float imgSat = saturation(c);
  float imgBright = brightness(c);

  // ** Adjust the color based on its current HSV values **

  // Generic buildings/houses (default: dark gray)
  if (imgHue > 41 && imgHue < 42 
      && imgSat < 7 
      && imgBright > 85) {
    imgSat = 0;
    imgBright *= 0.98;
  }

  // Parks/forests (default: varying shades of green)
  else if (imgHue > 80 && imgHue < 90 
            && imgSat < 30 
            && imgBright > 80) {
    imgHue *= 1.3;
    imgSat *= 0.9;
    imgBright *= 0.95;
  }

  // Rivers/bodies of water (default: light blue)
  else if (imgHue > 200 && imgHue < 220 
            && imgSat > 30 && imgSat < 55 
            && imgBright > 90) {
    imgSat *= 0.85;
  }

  // Side roads (default: dark gray)
  else if (imgHue >= 36 && imgHue < 41.5 
            && imgSat < 8 && imgSat > 5.6 
            && imgBright > 80) {
    imgHue = 200;
    imgSat *= 2;
    imgBright *= 0.97;
  }

  // Interstate (default: bright orange)
  else if (imgHue > 30 && imgHue < 40 
            && imgSat > 20 
            && imgBright > 80) {
    imgHue *= 1.2;
    imgSat *= 0.85;
    imgBright *= 0.95;
  }

  // Universities (default: light brown)
  else if (imgHue > 39 && imgHue < 45 
            && imgSat > 12 && imgSat < 20 
            && imgBright > 90) {
    imgSat *= 0.8; 
    imgBright *= 0.93;
  }

  // Healthcare facilities (default: pink)
  else if (imgHue > 6 && imgHue < 8) {
    imgSat *= 2;
    imgBright = 95;
  }

  // Primary roads (default: white)
  else if (imgHue == 0 
            && imgSat == 0 
            && imgBright == 100) {
    imgHue = 60;
    imgSat = 5;
  }

  // Main routes (default: yellow)
  else if (imgHue > 40 && imgHue < 50 
            && imgSat > 55 && imgSat < 70 
            && imgBright > 85) {
    imgHue *= 1.2;
    imgSat *= 0.8;
    imgBright *= 0.95;
  }

  // District/City labels (default: ugly brown)
  else if (imgHue > 30 && imgHue < 80 
            && imgSat > 10 && imgSat < 30 
            && imgBright > 40 && imgBright < 81) {
    imgHue = 220; // Blue
    imgSat = 100;
    imgBright *= 0.8;
  }

  return color(imgHue, imgSat, imgBright);
}

// Display hue, saturation, and brightness levels for the pixel under the mouse cursor.
// In order to prevent repeated console output, will only display HSV values that differ
// from the most recent HSV values obtained.
void draw() {

  // Store the color information for the pixel under the cursor
  img.loadPixels();
  color c = img.pixels[mouseY * img.width + mouseX];
  float imgHue = hue(c);
  float imgSat = saturation(c);
  float imgBright = brightness(c);

  // Output the HSV values if they are different from the previous values
  if (prevHue != imgHue && prevSat != imgSat && prevBright != imgBright) {
    println("Hue: " + imgHue);
    println("Saturation: " + imgSat);
    println("Brightness: " + imgBright);
  }

  // Update the previous values with the current values
  prevHue = imgHue;
  prevSat = imgSat;
  prevBright = imgBright;
}

// Display hue, saturation, and brightness levels for pixel under the mouse cursor when mouse is clicked
void mousePressed() {

  // Store the color information for the pixel under the cursor
  img.loadPixels();
  color c = img.pixels[mouseY * img.width + mouseX];
  float imgHue = hue(c);
  float imgSat = saturation(c);
  float imgBright = brightness(c);

  // Output HSV values
  println("Hue: " + imgHue);
  println("Saturation: " + imgSat);
  println("Brightness: " + imgBright);
}

