class CollisionDetector {
 
  //HitBox lanceHitBox, horseHitBox, obstacleHitBox;
  
  HitBox lanceHitBox = new HitBox("lance", 0, 0, 0, 0);
  HitBox horseHitBox = new HitBox("horse", 0, 0, 0, 0);
  HitBox obstacleHitBox = new HitBox("obstacle", 0, 0, 0, 0);
  
  void detectCollisions() {
    if(lanceHitBox.getX() >= obstacleHitBox.getX()
    && lanceHitBox.getWidth() + lanceHitBox.getX() >= obstacleHitBox.getX
    println("tererererer");
  }
  
  void addHitBox(HitBox hBox) {
    String name = hBox.getName();
    
    switch(name) {
      case "lance":
        lanceHitBox.update(hBox);
        break;
      case "horse":
        horseHitBox.update(hBox);
        break;
      case "obstacle":
        obstacleHitBox.update(hBox);
        break;
      default:
        println("Unknown hitbox added to collision detector");
        break;
    }
    
    
  }
  
  
  
  
}