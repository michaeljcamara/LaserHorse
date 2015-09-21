class CollisionDetector {
 
  //HitBox lanceHitBox, horseHitBox, obstacleHitBox;
  
  HitBox lanceHitBox = new HitBox(null, "lance", 0, 0, 0, 0);
  HitBox horseHitBox = new HitBox(null, "horse", 0, 0, 0, 0);
  HitBox obstacleHitBox = new HitBox(null, "obstacle", 0, 0, 0, 0);
  
  void detectCollisions() {
    
    println(lanceHitBox.getX());
    println(obstacleHitBox.getX());
    if(lanceHitBox.getX() < obstacleHitBox.getX() + obstacleHitBox.getWidth()
    && lanceHitBox.getY() < obstacleHitBox.getY() + obstacleHitBox.getHeight()
    && lanceHitBox.getX() + lanceHitBox.getWidth() > obstacleHitBox.getX()
    && lanceHitBox.getY() + lanceHitBox.getHeight() > obstacleHitBox.getY()) {
      
      println("HIT");
      
      ((Ring) obstacleHitBox.getObstacle()).change();
    }
  }
  
  void addHitBox(HitBox hBox) {
    String name = hBox.getName();
    
    if(name.equals("lance"))
      //lanceHitBox.update(hBox);
      lanceHitBox = hBox;

    else if(name.equals("horse"))
      horseHitBox.update(hBox);

    else if(name.equals("obstacle"))
      //obstacleHitBox.update(hBox);
      obstacleHitBox = hBox;

  }  
  
}
