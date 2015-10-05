class ComplexShape {
 
  ArrayList<Shape> cShapes;
  ArrayList<Vertex> startVertices;
  
  ComplexShape(Shape s) {
    cShapes = new ArrayList<Shape>();
    cShapes.add(new Shape(s));
    
    startVertices = new ArrayList<Vertex>(s.getVertices());
   
    initialDraw();
  }
  
  // Create initially flush shapes with existing simple shape
  void initialDraw() {
    for(int i = 0; i < startVertices.size(); i++) {
      Shape s = new Shape();
      
      Vertex v1 = new Vertex(startVertices.get(i));
      
      // If not the last vertex
      if(i != startVertices.size() - 1) {
        Vertex v2 = new Vertex(startVertices.get(i+1));
        s.addVertex(v1);
        s.addVertex(v2);
        s.addVertex(v2);
        s.addVertex(v1);
        
        cShapes.add(s);
      }
      
      else {
        Vertex v2 = new Vertex(startVertices.get(0));
        s.addVertex(v1);
        s.addVertex(v2);
        s.addVertex(v2);
        s.addVertex(v1);
        
        cShapes.add(s);
      }
    }
    
    Shape s2 = new Shape(cShapes.get(0));
    cShapes.add(s2);
    
  }
  
  void adjustZ(float z) {
    for(int i = 1; i < cShapes.size(); i++) {
      
      Shape s = cShapes.get(i);
      ArrayList<Vertex> vList = s.getVertices();
      
      if(i != cShapes.size() - 1) {
        vList.get(0).adjustZ(z);
        vList.get(1).adjustZ(z);
      }
      else {        
        for(Vertex v : vList) {
          v.adjustZ(z);
        }
      } 
    }
  }
  
  void adjustY(float y) {
    for(int i = 1; i < cShapes.size(); i++) {
      
      Shape s = cShapes.get(i);
      ArrayList<Vertex> vList = s.getVertices();
      
      if(i != cShapes.size() - 1) {
        vList.get(0).adjustY(y);
        vList.get(1).adjustY(y);
      }
      else {        
        for(Vertex v : vList) {
          v.adjustY(y);
        }
      } 
    }
  }
  
  void adjustX(float x) {
    for(int i = 1; i < cShapes.size(); i++) {
      
      Shape s = cShapes.get(i);
      ArrayList<Vertex> vList = s.getVertices();
      
      if(i != cShapes.size() - 1) {
        vList.get(0).adjustX(x);
        vList.get(1).adjustX(x);
      }
      else {        
        for(Vertex v : vList) {
          v.adjustX(x);
        }
      } 
    }
  }
  
  void drawCShape() {
    
    for(Shape s : cShapes) {
      s.drawShape();
    }
    
    for(Vertex v : cShapes.get(0).getVertices()) {
      println(v.getX() + " " + v.getY() + " " + v.getZ());
    }
    println("=======================");
    
  }
  
}