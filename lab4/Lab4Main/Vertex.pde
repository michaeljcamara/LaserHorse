//*********************************************************************************
// Honor Code: The work I am submitting is a result of my own thinking and efforts.
// Michael Camara
// CMPSC 382 Fall 2015 (Professor Wenskovitch)
// Lab # 4
// Due Date: 10/6/15
// 
// Purpose: Create a 3D sketch in processing, including full camera movement and
//          different lighting schemes.
//********************************************************************************

/** Simple representation of a vertex with x, y, z coordinates */
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
  
  String toString() {
    return "X = " + x + ", Y = " + y + ", Z = " + z;
  }
}
