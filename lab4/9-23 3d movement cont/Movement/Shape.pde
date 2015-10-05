class Shape {
  //float x, y, z;
  //float h, w, d; // height, width, depth
  //int r, g, b;
  boolean expansionX, expansionY, expansionZ;
  
  ArrayList<Vertex> vertices;

  Shape() {
    vertices = new ArrayList<Vertex>();
    expansionX = expansionY = expansionZ = false;
  }
  
  Shape(Shape shape) {
   vertices = new ArrayList<Vertex>(shape.getVertices());
   expansionX = expansionY = expansionZ = false;
  }
  
  void addVertex(Vertex vertex) {
    vertices.add(new Vertex(vertex));
  }
  
  void clearVertices() {
    vertices.clear();
  }
  
  ArrayList<Vertex> getVertices() {
    return vertices;
  }
  
  //void adjustZ(float z) {
    
  //  for(Vertex v : vertices) {
  //    v.
  //  }
  //}
    
  
  void drawShape() {
    
    pushMatrix();
    pushStyle();
    //translate(x, y, z);
    fill(0, 0, 255);
    stroke(0);
    
    beginShape();      
      for(int i = 0; i < vertices.size(); i++) {
        Vertex v = vertices.get(i);
        vertex(v.getX(), v.getY(), v.getZ());
    }
    endShape(CLOSE);

    popStyle();
    popMatrix();
  }
}