class Ring {
 float x, y, rWidth, rHeight;
  
 Ring(float x, float y, float rWidth, float rHeight) {
   
   this.x = x;
   this.y = y;
   this.rWidth = rWidth;
   this.rHeight = rHeight;
   
   ellipseMode(CORNER);
   ellipse(x, y, rWidth, rHeight);
   
 }
  
  void change() {
    fill(0, 255, 0);
    ellipseMode(CORNER);
    ellipse(x, y, rWidth, rHeight);
  }
  
}
