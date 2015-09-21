class HitBox {
 
  float x, y, width, height;
  String name;
  
  HitBox (String name, int x, int y, int width, int height) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  
  String getName() {
    return name;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getWidth() {
    return width;
  }
  float getHeight() {
    return height;
  }
  
  void update(HitBox hBox) {
    x = hBox.getX();
    y = hBox.getY();
    width = hBox.getWidth();
    height = hBox.getHeight();
  }
  
  
}