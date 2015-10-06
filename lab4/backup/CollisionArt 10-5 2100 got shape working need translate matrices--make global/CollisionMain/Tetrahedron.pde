class Tetrahedron {
  float x, y, z; // center of shape
  
  float transX, transY, transZ;
  float randRotX, randRotY, randRotZ;

  Tetrahedron(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
    
    transX = random(-1000, 1000);
    transY = random(-1000, 1000);
    transZ = random(-1000, 1000);
    
    randRotX = random(-PI, PI);
    randRotY = random(-PI, PI);
    randRotZ = random(-PI, PI);
  }

  void drawShape() {
    pushMatrix();
    pushStyle();
    
    translate(transX, transY, transZ);
    rotateX(randRotX);
    rotateY(randRotY);
    rotateZ(randRotZ);
    
    float xyAngle = radians(180);
    float xzAngle = radians(180);
    float yzAngle = radians(180);
    
    //fill(122, 100);
    fill(122, 255);
    
    float len = 100;
    stroke(0);
    strokeWeight(3);
    
    ArrayList<Vertex> vertices = new ArrayList<Vertex>();
    {
      Vertex v1 = new Vertex(x - len/2, y - len/3, z + len/3);
      Vertex v2 = new Vertex(x + len/2, y - len/3, z + len/3);
      Vertex v3 = new Vertex(x, y + len*(2/3.0), z + len/3);
      Vertex v4 = new Vertex(x, y, z - len*(2/3.0));
      
      vertices.add(v1);
      vertices.add(v2);
      vertices.add(v3);
      vertices.add(v4);
    }

    for(int i = 0; i < vertices.size(); i++) {
      Vertex v1 = vertices.get(i % 4);
      Vertex v2 = vertices.get((i+1) % 4);
      Vertex v3 = vertices.get((i+2) % 4);
      
      beginShape();
        vertex(v1.getX(), v1.getY(), v1.getZ());
        vertex(v2.getX(), v2.getY(), v2.getZ());
        vertex(v3.getX(), v3.getY(), v3.getZ());
      endShape(CLOSE);
    }
    
    Matrix m = new Matrix(4, 4);
    
    for(int i = 0; i < vertices.size(); i++) {
      m.setVertex(i, vertices.get(i)); 
    }
    
    Matrix xyRotation = new Matrix(4, 4);
    
    xyRotation.setValue(0, 0, cos(xyAngle));
    xyRotation.setValue(0, 1, -sin(xyAngle));
    xyRotation.setValue(0, 2, 0);
    xyRotation.setValue(0, 3, 0);
    
    xyRotation.setValue(1, 0, sin(xyAngle));
    xyRotation.setValue(1, 1, cos(xyAngle));
    xyRotation.setValue(1, 2, 0);
    xyRotation.setValue(1, 3, 0);
    
    xyRotation.setValue(2, 0, 0);
    xyRotation.setValue(2, 1, 0);
    xyRotation.setValue(2, 2, 1);
    xyRotation.setValue(2, 3, 0);
    
    xyRotation.setValue(3, 0, 0);
    xyRotation.setValue(3, 1, 0);
    xyRotation.setValue(3, 2, 0);
    xyRotation.setValue(3, 3, 1);
    
    Matrix yzRotation = new Matrix(4, 4);
    
    yzRotation.setValue(0, 0, 1);
    yzRotation.setValue(0, 1, 0);
    yzRotation.setValue(0, 2, 0);
    yzRotation.setValue(0, 3, 0);
    
    yzRotation.setValue(1, 0, 0);
    yzRotation.setValue(1, 1, cos(yzAngle));
    yzRotation.setValue(1, 2, -sin(yzAngle));
    yzRotation.setValue(1, 3, 0);
    
    yzRotation.setValue(2, 0, 0);
    yzRotation.setValue(2, 1, sin(yzAngle));
    yzRotation.setValue(2, 2, cos(yzAngle));
    yzRotation.setValue(2, 3, 0);
    
    yzRotation.setValue(3, 0, 0);
    yzRotation.setValue(3, 1, 0);
    yzRotation.setValue(3, 2, 0);
    yzRotation.setValue(3, 3, 1);
    
    //Matrix updatedMatrix = m.multiplyMatrices(m, xyRotation);
    Matrix updatedMatrix = m.multiplyMatrices(m, yzRotation);
    
    ArrayList<Vertex> updatedVertices = new ArrayList<Vertex>();
    
    for(int i = 0; i < vertices.size(); i++) {
      Vertex updatedVertex = updatedMatrix.getVertex(i);
      Vertex currentVertex = vertices.get(i);
      currentVertex.setVertex(updatedVertex);
    }
    
    // Rem translate to/from origin!1
    
    //rotateX(radians(180));
    translate(0, 0, len * 0.175);
    
    for(int i = 0; i < vertices.size(); i++) {
      Vertex v1 = vertices.get(i % 4);
      Vertex v2 = vertices.get((i+1) % 4);
      Vertex v3 = vertices.get((i+2) % 4);
      
      beginShape();
        vertex(v1.getX(), v1.getY(), v1.getZ());
        vertex(v2.getX(), v2.getY(), v2.getZ());
        vertex(v3.getX(), v3.getY(), v3.getZ());
      endShape(CLOSE);
    }
    
    popStyle();
    popMatrix();
  }
}