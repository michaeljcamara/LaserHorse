class HitBox {
 
  float x, y, hWidth, hHeight;
  Object obj;
  
  HitBox (Object obj, float x, float y, float hWidth, float hHeight) {
    this.x = x;
    this.y = y;
    this.hWidth = hWidth;
    this.hHeight = hHeight;
    this.obj = obj;
  }
  
  HitBox(Coin coin) {
    
    this.x = coin.getX();
    this.y = coin.getY();
    this.hWidth = coin.getWidth();
    this.hHeight = coin.getHeight();
    this.obj = coin;
  }
  
//  HitBox (Object obj, float x, float y, float hWidth, float hHeight) {
//    this.name = name;
//    this.x = x;
//    this.y = y;
//    this.hWidth = hWidth;
//    this.hHeight = hHeight;
//    this.obj = obj;
//  }
  
  //Stcoin getName() {
  //  return name;
  //}
  
  Object getObj() {
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