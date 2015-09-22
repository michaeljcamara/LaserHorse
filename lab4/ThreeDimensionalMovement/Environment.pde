class Environment {
 
 void drawFloor() {
   pushMatrix();
   pushStyle();
   fill(125);
   box(1000, 1, 10000);
   
   fill(100);
   
   translate(-500,-10,0);
   for(int i = 0; i < 100; i++) {
     pushMatrix();
     translate(20 * i, 0, 0);
     box(10, 2, 10000);
     popMatrix();
   }
   
   popMatrix();
   popStyle();
   
   pushMatrix();
   
   box(1000, 5000, 1);
   popMatrix();
 }
  
}
