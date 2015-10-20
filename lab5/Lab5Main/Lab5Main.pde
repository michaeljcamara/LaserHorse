//**********************************************************************
// Michael Camara
// Honor Code Pledge: This work is mine unless otherwise cited
// CMPSC 382: Professor Wenskovitch
// Lab 5: Image Manipulation
// Purpose: Practice working with image manipulation code and algorithms
//
// NOTE: Owl image taken by Allard Schager 
//       (https://www.flickr.com/photos/allard1/3807655054/)
//
//        Convolution method borrowed from example provided by:
//        Bryn Mawr College, Department of Computer Science
//**********************************************************************

float[][][] filters = { 
    //Laplacian Edge Detection horizontal/vertical
    {{0,  -1,  0},
    {-1, 4,  -1},
    {0,  -1,  0}},

    // Sharpen filter
    {{-1, -1, -1},
    {-1,  9, -1},
    {-1, -1, -1}},
    
    // My original filter
    {{0,-1,-2,-3,-4,-5,-4,-3,-2,-1,0},
    {-1,-1,-2,-3,-4,-5,-4,-3,-2,-1,-1},
    {-2,-2,-2,-3,-4,-5,-4,-3,-2,-2,-2},
    {-3,-3,-3,-3,-4,-5,-4,-3,-3,-3,-3},
    {-4,-4,-4,-4,-4,-5,-4,-4,-4,-4,-4},
    {-5,-5,-5,-5,-5,380,-5,-5,-5,-5,-5},
    {-4,-4,-4,-4,-4,-5,-4,-4,-4,-4,-4},
    {-3,-3,-3,-3,-4,-5,-4,-3,-3,-3,-3},
    {-2,-2,-2,-3,-4,-5,-4,-3,-2,-2,-2},
    {-1,-1,-2,-3,-4,-5,-4,-3,-2,-1,-1},
    {0,-1,-2,-3,-4,-5,-4,-3,-2,-1,0}}
};

void setup() {

  // Create image using owl photo by Allard Schager
  PImage originalImage = loadImage("owl.png");
  
  // Create space for a 3x3 grid containing manipulations of originalImage
  PImage bigImage = createImage(originalImage.width * 3, originalImage.height * 3, RGB);

  // Set size of sketch based on this 3x3 grid
  size(bigImage.width, bigImage.height);

  // Apply the various color manipulations to the grid
  manipulateImage(bigImage, originalImage);
}

// Create a 3x3 grid of images: The top left image is the original image; the first two rows
// use simple color manipulations; the bottom row uses convolution filters.  The bottom right
// image uses my original convolution filter with no other manipulations applied.
void manipulateImage(PImage bigImage, PImage originalImage) {

  // Iterate through the rows and columns of the bigImage (i.e. the 3x3 image grid)
  for (int y = 0; y < bigImage.height; y++) {
    for (int x = 0; x < bigImage.width; x++) {

      // Calculate the absolute pixel position of the bigImage given x and y
      int i = y*bigImage.width+x;
      
      // Calculate the absolute pixel position of the originalImage given x and y
      // Note: The mod operator (%) keeps the position within proper bounds for the original image
      int iOriginal = (y % originalImage.height) * originalImage.width + (x % originalImage.width);

      // Record the color of the current pixel from the original image
      color c = originalImage.pixels[iOriginal];
      float colorRed = red(c);
      float colorGreen = green(c);
      float colorBlue = blue(c);

      // Left column
      if (x < originalImage.width) {
        
        // First row: Original image (NO modifications)
        if (y < originalImage.height) {
          bigImage.pixels[i] = originalImage.pixels[iOriginal];
        } 
        
        // Second row: Hot pink with speckles
        else if (y < originalImage.height * 2) {
          bigImage.pixels[i] = getColor3(colorRed, colorGreen, colorBlue);
        } 
        
        // Third row: Laplacian convolution filter
        else {
          bigImage.pixels[i] = convolution((x % originalImage.width), (y % originalImage.height), filters[0], originalImage);
        }
      } 
      
      // Middle Column
      else if (x >= originalImage.width && x < originalImage.width * 2) {
        
        // First row:  White/orange/red
        if (y < originalImage.height) {
          bigImage.pixels[i] = getColor1(colorRed, colorGreen, colorBlue);
        } 
        
        // Second row: Inversed colors
        else if (y < originalImage.height * 2) {
          bigImage.pixels[i] = getColor4(colorRed, colorGreen, colorBlue);
        } 
        
        // Third row: Sharpen convolution filter
        else {
          bigImage.pixels[i] = convolution((x % originalImage.width), (y % originalImage.height), filters[1], originalImage);
        }
      } 
      
      // Right column
      else if (x >= originalImage.width * 2) {  
        
        // First row: Neon green/blue/violet
        if (y < originalImage.height) {
          bigImage.pixels[i] = getColor2(colorRed, colorGreen, colorBlue);
        } 
        
        // Second row:  Bright yellow and dark red
        else if (y < originalImage.height * 2) {
          bigImage.pixels[i] = getColor5(colorRed, colorGreen, colorBlue);
        } 
        
        // **Third row:  My custom convolution filter!!**
        else {
          bigImage.pixels[i] = convolution((x % originalImage.width), (y % originalImage.height), filters[2], originalImage);
        }
      }
    }
  }

  // Draw the updated image
  bigImage.updatePixels();
  image(bigImage, 0, 0);
}

// White/orange/red colors
color getColor1(float r, float g, float b) {
  
  // Use threshold to apply high intensity colors
  if (r > 122)
    r = 255;
  else
    r = 0;
  if (g > 122)
    g = 255;
  else
    g = 0;
  if (b > 122)
    b = 255;
  else
    b = 0;

  return color(r, g, b);
}

// Inversed colors
color getColor4(float r, float g, float b) {
  float newR = 255 - r;
  float newG = 255 - g;
  float newB = 255 - b;

  return color(newR, newG, newB);
}

// Speckled hot pink colors
color getColor3(float r, float g, float b) {
  float newR = 0;
  float newG = 0;
  float newB = 0;

  // Increase weight of r,g,b based on divisibility by 3
  if (r % 3 == 0)
    newR = r * 1.5;
  else if (r % 3 == 1)
    newR = r * 2.5;
  else if (r % 3 == 2)
    newR = r * 3.5;

  if (g % 3 == 0)
    newG = g / 1.5;
  else if (r % 3 == 1)
    newG = g / 2.5;
  else if (r % 3 == 2)
    newG = g / 3.5;

  if (b % 3 == 0)
    newB = b * 1.5;
  else if (r % 3 == 1)
    newB = b * 2.5;
  else if (r % 3 == 2)
    newB = b * 3.5;

  return color(newR, newG, newB);
}

// Neon green, navy blue and violet colors
color getColor2(float r, float g, float b) {
  float newR = r / 1.5;
  float newG = 0;
  float newB = 255 - b * 1.5;

  // Apply threshold for green only
  if (g > 122)
    newG = 255;
  else
    newG = 0;


  return color(newR, newG, newB);
}

// Bright yellow and dark red colors
color getColor5(float r, float g, float b) {

  float newR = 0;
  float newG = 0;
  float newB = 0;

  // Check thresholds of r, g, b;
  // Then change a *different* color based on this threshold
  // e.g. if red exceeds threshold, change the green color, etc.
  if (r > 122)
    newG = 255;
  else
    newG = 0;

  if (g > 122)
    newR = 255;
  else
    newR = 0;

  if (b > 122)
    newG = 255;
  else
    newG = 0;

  return color(newR, newG, newB);
}

// Calculates the color of a pixel after applying the indicated convolution filter
// NOTE: Taken from example provided by Bryn Mawr College, Department of Computer Science
color convolution(int x, int y, float[][] matrix, PImage originalImage) {
  int offset = floor(matrix.length/2);
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = originalImage.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, originalImage.pixels.length-1);
      // Calculate the convolution
      r += (red(originalImage.pixels[idx]) * matrix[i][j]);
      g += (green(originalImage.pixels[idx]) * matrix[i][j]);
      b += (blue(originalImage.pixels[idx]) * matrix[i][j]);
    }
  }

  return color(r, g, b);
}

