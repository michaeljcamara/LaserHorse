float rows, cols;
float rowWidth, colWidth;
int i;
float numBlocks;

void setup() {
  size(640, 480);
  rows = 300;
  cols = 400;
  i = 2;
  rowWidth = height / rows;
  colWidth = width / cols;
  numBlocks = rows * cols;
  
}

void draw() {
  boolean prime;
  for(int j = 0; j < rows; j++) {
    for(int k = 0; k < cols; k++) {
//  for(int j = 0; j < cols; j++) {    
//    for(int k = 0; k < rows; k++) {
      prime = isPrime(i);
      
      if(prime) {
        //draw red
        fill(255, 0, 0);
        stroke(255, 0, 0);
      }
      else {
        //draw blue
        fill(0, 0, 255);
        stroke(0, 0, 255);
      }
      
      drawBlock(j, k, i);
      
      i++;
    }
  }
  
  i = 2;
  
}


// Determine if number is prime
boolean isPrime(int num) {
  for(int m = 2; m <= sqrt(num); m++) {
    if(num % m == 0) {
      return false;
    }
  }
  
  return true;
}

// Draw a block
void drawBlock(float row, float col, int num) {
  float x, y;
  x = col * colWidth;
  y = row * rowWidth;
  
  rect(x, y, colWidth, rowWidth);
  
//  fill(0);
//  textSize(10);
  text(num, x, y + rowWidth);
}
