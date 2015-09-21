class HitBox {
 
  float x, y, hWidth, hHeight;
  String name;
  Object obj;
  
  HitBox (Object obj, String name, float x, float y, float hWidth, float hHeight) {
    this.name = name;
    this.x = x;
    this.y = y;
    this.hWidth = hWidth;
    this.hHeight = hHeight;
    this.obj = obj;
  }
  
//  HitBox (Object obj, float x, float y, float hWidth, float hHeight) {
//    this.name = name;
//    this.x = x;
//    this.y = y;
//    this.hWidth = hWidth;
//    this.hHeight = hHeight;
//    this.obj = obj;
//  }
  
  String getName() {
    return name;
  }
  
  Object getObstacle() {
    return obj;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  float getWidth() {
    return hWidth;
  }
  float getHeight() {
    return hHeight;
  }
  
  void update(HitBox hBox) {
    x = hBox.getX();
    y = hBox.getY();
    hHeight = hBox.getWidth();
    hHeight = hBox.getHeight();
  }
  
  
}
