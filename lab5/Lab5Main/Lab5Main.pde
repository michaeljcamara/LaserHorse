/**
Bryn Mawr College, Department of Computer Science <br>
Click mouse to cycle through a series of convolution filters <br>
*/

int index;
PImage[] images;

float[][][] filters = { 
                       
                        
                        //Laplacian Edge Detection horizontal/vertical
                        {{0,  -1,  0},
                        {-1, 4,  -1},
                        {0,  -1,  0}},

                        // Sharpen
                        {{-1, -1, -1},
                        {-1,  9, -1},
                        {-1, -1, -1}},
                        
                        // Newly created filter
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

PImage img;

void setup() {

  size(1350, 898);
  
  img = loadImage("owl.png");

  PImage bigImage = createImage(img.width * 3, img.height * 2, RGB);
  
  image(bigImage,0,0);
  
  applyColorManipulation(bigImage);
  
}

void applyColorManipulation(PImage currentImg) {
  
  currentImg.loadPixels();
  
  for(int y = 0; y < currentImg.height; y++) {
    for(int x = 0; x < currentImg.width; x++) {
      
      int i = y*currentImg.width+x;
      int iOriginal = (y % img.height) * img.width + (x % img.width);
      
       color c = img.pixels[iOriginal];
       float colorRed = red(c);
       float colorGreen = green(c);
       float colorBlue = blue(c);
       
      if(x < img.width) {
        if(y < img.height) {
          currentImg.pixels[i] = img.pixels[iOriginal];
        }
        else {
          currentImg.pixels[i] = convolution((x % img.width), (y % img.height), filters[0], img);
        }
      }
      
      
      else if(x >= img.width && x < img.width * 2) {
        if(y < img.height) {
          currentImg.pixels[i] = color(200-colorRed, 125-colorGreen, colorBlue / 1.5);
        }
        else {
          currentImg.pixels[i] = convolution((x % img.width), (y % img.height), filters[1], img);
        }
      }
      
      else if(x >= img.width * 2) {
        if(y < img.height) {
          if(colorRed > 122)
            colorRed = 255;
          else
            colorRed = 0;
          if(colorGreen > 122)
            colorGreen = 255;
          else
          colorGreen = 0;
          if(colorBlue > 122)
             colorBlue = 255;
             else
             colorBlue = 0;
          //currentImg.pixels[i] = color(colorRed * 1.25, colorGreen * 2.5, 0);
          currentImg.pixels[i] = color(colorRed, colorGreen, colorBlue);
        }
        else {
          currentImg.pixels[i] = convolution((x % img.width), (y % img.height), filters[2], img);
        }
      }
      
      
      
    }
  }

  currentImg.updatePixels();
  
  image(currentImg,0,0); 
    
}

// calculates the color after applying the filter
color convolution(int x, int y, float[][] matrix, PImage img) {
  int offset = floor(matrix.length/2);
  float r = 0.0, g = 0.0, b = 0.0;

  for (int i = 0; i < matrix.length; i++) {
    for (int j= 0; j < matrix[i].length; j++) {
      // Which neighbor are we using
      int newX = x+i-offset;
      int newY = y+j-offset;
      int idx = img.width*newY + newX;
      // Make sure we haven't walked off our image
      idx = constrain(idx, 0, img.pixels.length-1);
      // Calculate the convolution
      r += (red(img.pixels[idx]) * matrix[i][j]);
      g += (green(img.pixels[idx]) * matrix[i][j]);
      b += (blue(img.pixels[idx]) * matrix[i][j]);
    }
  }
    return color(r, g, b); 
}