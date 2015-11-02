//**********************************************************************
// Michael Camara
// Honor Code Pledge: This work is mine unless otherwise cited
// CMPSC 382: Professor Wenskovitch
// Lab 6: More Image Exploration
//  Contrast/brightness code modified from:
//  http://forum.processing.org/one/topic/increase-contrast-of-an-image.html
//  Histogram code modified from: Bryn Mawr College, Department of Computer Science
//**********************************************************************

PImage img;
PImage imgEnhanced;

// Arrays to hold histogram values
int[] aa = new int[256];  // Count up shades of gray (all)
int[] ra = new int[256];  // Count up shades of red
int[] ga = new int[256];  // Count up shades of green
int[] ba = new int[256];  // Count up shades of blue

void setup() {
  
  // Load image of Eiffel Tower
  img = loadImage("eiffel.png");
  size(816, 600);
  
  //things we only do once in the program should be here
  //put a test.jpg image in a folder called data inside the sketch folder
  imgEnhanced = new PImage(img.width, img.height);  
} //setup

void draw() {
  background(255);
  
  //just use the mouse positions to work out
  //contrast and brightness values
  //up down is brightness
  //left right is contrast
  
  //contrast - this probably doesn't need to be bigger than 5 or 10
  float contrast = 5f * ( mouseX / (float)width); //value should go from 0 to 5
  println("contrast: " + contrast);
  
  //brightness - this is additive and we want to make it both brigher and darker so -128 to +128
  float bright = 255 * ( mouseY / (float)height  - 0.5); //value should go from -128 to +128
  println("brightness: " + bright);
  
  //call out contrast and brightness function
  ContrastAndBrightness(img, imgEnhanced, contrast, bright); 
  
  //display the image
  image(img, 516, 0);
  image(imgEnhanced, 516, img.height); 
  
  // Draw dynamic histogram for brightness/contrast
  makeHistogram();
} //draw

void makeHistogram() {

  // Zero current histogram values  
  for(int i = 0; i < 256; i++ ) {
    aa[i] = 0;
    ra[i] = 0;
    ga[i] = 0;
    ba[i] = 0;
  }
  
  imgEnhanced.loadPixels();
  
  // Sum up all pixel values from all colors
  for (int i=0; i<imgEnhanced.pixels.length; i++) {
    int r = (int)red(imgEnhanced.pixels[i]);
    int g = (int)green(imgEnhanced.pixels[i]);
    int b = (int)blue(imgEnhanced.pixels[i]);
    
    // Increment histogram item amounts
    ra[ r ]++;
    ga[ g ]++;
    ba[ b ]++;
    aa[ int((r+g+b)/3.0) ]++;
  } //for
  
  // Find max value
  float max = 0.0;
  for (int i=0; i<256; i++) {
    if (ra[i] > max) max = ra[i];
    if (ga[i] > max) max = ga[i];
    if (ba[i] > max) max = ba[i];
    if (aa[i] > max) max = aa[i];
  } //if

  // Draw scaled histogram
  noFill();

  // Borders
  stroke(0);
  rect(0, 0, 256, 256);
  stroke(255,0,0);
  rect(257, 0, 256, 256);
  stroke(0,255,0);
  rect(0, 257, 256, 256);
  stroke(0,0,255);
  rect(257, 257, 256, 256);
  
  // Lines
  float h;
  for (int i=0; i<256; i++) {
    // all
    stroke(0);
    h = map(aa[i], 0, max, 0, 255);
    line(i, 255, i, 255-h);
    
    // red
    stroke(255,0,0);
    h = map(ra[i], 0, max, 0, 255);
    line(257+i, 255, 257+i, 255-h);
    
    // green
    stroke(0,255,0);
    h = map(ga[i], 0, max, 0, 255);
    line(i+1, 514, i+1, 514-h);
    
    // blue
    stroke(0,0,255);
    h = map(ba[i], 0, max, 0, 255);
    line(257+i, 514, 257+i, 514-h);
  } //for
  
}

//image processing function to enhance contrast
//this doesn't make sense without also adjusting the brightness at the same time
void ContrastAndBrightness(PImage input, PImage output, float cont, float bright) {
   int w = input.width;
   int h = input.height;
   
   //our assumption is the image sizes are the same
   //so test this here and if it's not true just return with a warning
   if(w != output.width || h != output.height) {
     println("error: image dimensions must agree");
     return;
   } //if
   
   //this is required before manipulating the image pixels directly
   input.loadPixels();
   output.loadPixels();
      
   //loop through all pixels in the image
   for(int i = 0; i < w*h; i++) {  
       //get color values from the current pixel (which are stored as a list of type 'color')
       color inColor = input.pixels[i];
       
       //slow version for illustration purposes - calling a function inside this loop
       //is a big no no, it will be very slow, plust we need an extra cast
       //as this loop is being called w * h times, that can be a million times or more!
       //so comment this version and use the one below
       int r = (int) red(input.pixels[i]);
       int g = (int) green(input.pixels[i]);
       int b = (int) blue(input.pixels[i]);
       
       //here the much faster version (uses bit-shifting) - uncomment to try
       //int r = (inColor >> 16) & 0xFF; //like calling the function red(), but faster
       //int g = (inColor >> 8) & 0xFF;
       //int b = inColor & 0xFF;      
       
       //apply contrast (multiplcation) and brightness (addition)
       r = (int)(r * cont + bright); //floating point aritmetic so convert back to int with a cast (i.e. '(int)');
       g = (int)(g * cont + bright);
       b = (int)(b * cont + bright);
       
       //slow but absolutely essential - check that we don't overflow (i.e. r,g and b must be in the range of 0 to 255)
       //to explain: this nest two statements, sperately it would be r = r < 0 ? 0 : r; and r = r > 255 ? 255 : 0;
       //you can also do this with if statements and it would do the same just take up more space
       r = r < 0 ? 0 : r > 255 ? 255 : r;
       g = g < 0 ? 0 : g > 255 ? 255 : g;
       b = b < 0 ? 0 : b > 255 ? 255 : b;
       
       //and again in reverse for illustration - calling the color function is slow so use the bit-shifting version below
       output.pixels[i] = color(r ,g,b);
       //output.pixels[i]= 0xff000000 | (r << 16) | (g << 8) | b; //this does the same but faster
   
   } //for
   
   //so that we can display the new image we must call this for each image
   input.updatePixels();
   output.updatePixels();
} //ContrastAndBrightness