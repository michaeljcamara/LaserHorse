/** This class detects collisions between the knight's lance and coins on the screen.
/*  When such a collision occurs, the player gets a point and a new ring is generated,
/*  such that 3 coins always appear on the screen.  (This may be expanded later to
/*  include collisions with other objects, like obstacles that hinder movement.) */

import java.util.*;

class CollisionDetector {

  // Create initially empty hitboxes for lance and coin
  HitBox lanceHitBox = new HitBox(null, 0, 0, 0, 0);
  HitBox coinHitBox = new HitBox(null, 0, 0, 0, 0);
  
  // Maintain a collection of hitboxes for all coins
  ArrayList<HitBox> coinHitBoxes = new ArrayList<HitBox>();

  // Detect whether the lance has contacted a coin
  void detectCollisions() {
    
    // Iterate through all coins currently created
    Iterator<HitBox> iterator = coinHitBoxes.iterator();  
    while(iterator.hasNext()) {

      coinHitBox = iterator.next();
      
      // Detect a collision if a coin hitbox intersects with the lance hitbox
      if (lanceHitBox.getX() < coinHitBox.getX() + coinHitBox.getWidth()
        && lanceHitBox.getY() < coinHitBox.getY() + coinHitBox.getHeight()
        && lanceHitBox.getX() + lanceHitBox.getWidth() > coinHitBox.getX()
        && lanceHitBox.getY() + lanceHitBox.getHeight() > coinHitBox.getY()) {
        
          // Increment player's score by 1
          score++;
        
          // Remove the coin from the simulation
          coins.remove((Coin) coinHitBox.getObj());
          iterator.remove();
      }
    }
    
    // If a coin was removed, create new coins such that 3 always appear on screen
    while(coins.size() < 3) {
      // Create new coin with random position and size
      Coin replacementCoin = new Coin(random(0, 5800), random(-1500, 0), random(125, 200), random(125, 200));
      coins.add(replacementCoin);
      detector.addHitBox(new HitBox(replacementCoin));
    }
  }

  // Add or update a hitbox for the lance or for a coin
  void addHitBox(HitBox hBox) {
    if (hBox.getObj() instanceof Knight)
      lanceHitBox = hBox;    
    else if (hBox.getObj() instanceof Coin)
      coinHitBoxes.add(hBox);
  }
}
