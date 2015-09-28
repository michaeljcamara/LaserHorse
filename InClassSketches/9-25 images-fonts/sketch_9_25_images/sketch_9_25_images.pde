PImage img;
PFont font;



void setup() {
  //size(500, 500);
  img = loadImage("lunar.jpg");
  size(img.width, img.height);
  image(img, 0, 0);
  loadPixels();  
  for(int i = 0; i < pixels.length; i++) {
    color c = pixels[i];
    float colorRed = red(c);
    float colorGreen = green(c);
    float colorBlue = blue(c);
    
//    pixels[i] = color((1/3.0) * colorRed + (1/3.0) * colorGreen + (1/3.0) * colorBlue);
//    pixels[i] = color((255-colorRed), 255-colorGreen, 255-colorBlue);    
//    pixels[i] = color(colorRed, 0, 0);
//    pixels[i] = color(colorGreen, colorBlue, colorRed);
//    pixels[i] = color(colorRed, colorGreen, 0);
//    pixels[i] = color(255 - colorRed*2, 255 - colorGreen*10, colorBlue*40);
    pixels[i] = color(255 - colorRed, colorGreen * 0.5, colorBlue);
//    pixels[i] = color(255 - colorRed, colorGreen * 0.4, 255 - colorBlue);
    //println(colorRed);
  }
  
  updatePixels();
   
  
//  font = loadFont("AbyssinicaSIL-48.vlw");
//  textFont(font);

}


//void draw() {
////  background(0);
//  //image(img, 0, 0, 500, 500);
//  //image(img, mouseX, mouseY);
//  image(img, 0, 0);
////  textSize(18);
////  fill(0, 255, 0);
////  text("Test text!", 10, 275);
//  
//  
//}
