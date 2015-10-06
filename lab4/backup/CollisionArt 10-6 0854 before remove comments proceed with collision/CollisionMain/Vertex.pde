class Vertex {
 
  private float x, y, z;
  
  Vertex(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  Vertex(Vertex v) {
    x = v.getX();
    y = v.getY();
    z = v.getZ();
  }
  
  void setVertex(Vertex v) {
    x = v.getX();
    y = v.getY();
    z = v.getZ();
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
  
  float getZ() {
    return z;
  }
  
  void adjustZ(float z) {
   this.z += z; 
  }
  
  void adjustY(float y) {
   this.y += y; 
  }
  
  void adjustX(float x) {
   this.x += x; 
  }
  
  String toString() {
    return "X = " + x + ", Y = " + y + ", Z = " + z;
  }
  
}