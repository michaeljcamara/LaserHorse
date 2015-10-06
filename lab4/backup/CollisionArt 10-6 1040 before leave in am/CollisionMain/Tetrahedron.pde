class Tetrahedron {
  float x, y, z; // center of shape
  float vx, vy, vz;
  
  float transX, transY, transZ;
  float randRotX, randRotY, randRotZ;

  Tetrahedron(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;

    vx = random(5, 10);
    vy = random(5, 10);
    vz = random(5, 10);
  }

  void drawShape() {
    pushMatrix();
    pushStyle();
    
    
    //float xyAngle = radians(180);
    float xyAngle = radians(frameCount);
    float xzAngle = radians(180);
    
    float yzAngle = radians(180);
    //float yzAngle = radians(180 + frameCount);
    
    fill(255, 100);
    
    float len = 250;
    stroke(0);
    strokeWeight(3);
    
    ArrayList<Vertex> firstVertices = new ArrayList<Vertex>();
    ArrayList<Vertex> secondVertices = new ArrayList<Vertex>();
    {      
      Vertex v1 = new Vertex(x - len/2.0, y - (len*sqrt(3.0)/2.0)/3.0, z + (len*sqrt(2.0/3.0))/3.0);
      Vertex v2 = new Vertex(x + len/2.0, y - (len*sqrt(3.0)/2.0)/3.0, z + (len*sqrt(2.0/3.0))/3.0);
      Vertex v3 = new Vertex(x, y + (len*sqrt(3.0)/2.0)*(2.0/3.0), z + (len*sqrt(2.0/3.0))/3.0);
      Vertex v4 = new Vertex(x, y, z - (len*sqrt(2.0/3.0)) * (2.0/3.0));
      
      firstVertices.add(v1);
      firstVertices.add(v2);
      firstVertices.add(v3);
      firstVertices.add(v4);
    }
    

    
    Matrix m = new Matrix(4, 4);
    
    for(int i = 0; i < firstVertices.size(); i++) {
      m.setVertex(i, firstVertices.get(i)); 
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
    
    Matrix originTranslate = new Matrix(4,4);
    
      originTranslate.setValue(0, 0, -x);
      originTranslate.setValue(0, 1, -y);
      originTranslate.setValue(0, 2, -z);
      originTranslate.setValue(0, 3, 0);
      
      originTranslate.setValue(1, 0, -x);
      originTranslate.setValue(1, 1, -y);
      originTranslate.setValue(1, 2, -z);
      originTranslate.setValue(1, 3, 0);
      
      originTranslate.setValue(2, 0, -x);
      originTranslate.setValue(2, 1, -y);
      originTranslate.setValue(2, 2, -z);
      originTranslate.setValue(2, 3, 0);
      
      originTranslate.setValue(3, 0, -x);
      originTranslate.setValue(3, 1, -y);
      originTranslate.setValue(3, 2, -z);
      originTranslate.setValue(3, 3, 0);
      
    Matrix destinationTranslate = new Matrix(4,4);
    
      destinationTranslate.setValue(0, 0, x);
      destinationTranslate.setValue(0, 1, y);
      destinationTranslate.setValue(0, 2, z);
      destinationTranslate.setValue(0, 3, 0);
      
      destinationTranslate.setValue(1, 0, x);
      destinationTranslate.setValue(1, 1, y);
      destinationTranslate.setValue(1, 2, z);
      destinationTranslate.setValue(1, 3, 0);
      
      destinationTranslate.setValue(2, 0, x);
      destinationTranslate.setValue(2, 1, y);
      destinationTranslate.setValue(2, 2, z);
      destinationTranslate.setValue(2, 3, 0);
      
      destinationTranslate.setValue(3, 0, x);
      destinationTranslate.setValue(3, 1, y);
      destinationTranslate.setValue(3, 2, z);
      destinationTranslate.setValue(3, 3, 0);
    
    // Create dual tetra
    //Matrix updatedMatrix = m.addMatrices(m, originTranslate);
    //updatedMatrix = m.multiplyMatrices(updatedMatrix, yzRotation);
    //updatedMatrix = m.addMatrices(updatedMatrix, destinationTranslate);
    
    // Rotate both tetras in unison
    Matrix updatedMatrix = m.addMatrices(m, originTranslate);
    Matrix updatedMatrix2 = m.addMatrices(m, originTranslate); // this is the origiinal tetra
    //Rotate second one so that dual tetra
    updatedMatrix = m.multiplyMatrices(updatedMatrix, yzRotation);
    //Rotate both xy
    updatedMatrix2 = m.multiplyMatrices(updatedMatrix2, xyRotation);
    updatedMatrix = m.multiplyMatrices(updatedMatrix, xyRotation);
    //put both back at destination
    updatedMatrix = m.addMatrices(updatedMatrix, destinationTranslate);
    updatedMatrix2 = m.addMatrices(updatedMatrix2, destinationTranslate);
    
    
    for(int i = 0; i < firstVertices.size(); i++) {
     //Vertex updatedVertex = updatedMatrix.getVertex(i);
     //Vertex currentVertex = firstVertices.get(i);
     //currentVertex.setVertex(updatedVertex);
     
     Vertex updatedVertex = updatedMatrix.getVertex(i);
     secondVertices.add(updatedVertex);
     
     // (for the original tetra, just rotated xy)
     Vertex updatedVertex2 = updatedMatrix2.getVertex(i);
     Vertex currentVertex2 = firstVertices.get(i);
     currentVertex2.setVertex(updatedVertex2);
     
    }
    
    boolean xBounce = false;
    boolean yBounce = false;
    boolean zBounce = false;
    
        for(int i = 0; i < firstVertices.size(); i++) {
     Vertex v = firstVertices.get(i);
     Vertex v2 = firstVertices.get(i);
     
     if(xBounce == false && abs(v.getX()) > 500 || v2.getX() > 500) {
       vx *= -1;
       xBounce = true;
     }
     if(yBounce == false && abs(v.getY()) > 500 || v2.getY() > 500) {
       vy *= -1;
       yBounce = true;
     }
     if(zBounce == false && abs(v.getZ()) > 500 || v2.getZ() > 500) {
       vz *= -1;
       zBounce = true;
     }
    }
    
    x += vx;
    y += vy;
    z += vz;
    
    //Correct this with vx sign
    if(xBounce == true) {
      x += 10 ;
    }
      if(yBounce == true) {
      y += 10;
      }
      if(zBounce == true) {
      z += 10;
      }
    
    for(int i = 0; i < firstVertices.size(); i++) {
      Vertex v1 = firstVertices.get(i % 4);
      Vertex v2 = firstVertices.get((i+1) % 4);
      Vertex v3 = firstVertices.get((i+2) % 4);
      
      beginShape();
        vertex(v1.getX(), v1.getY(), v1.getZ());
        vertex(v2.getX(), v2.getY(), v2.getZ());
        vertex(v3.getX(), v3.getY(), v3.getZ());
      endShape(CLOSE);
    }
    
    
    // Unfortunately I need a small offset to align the tetrahedra together perfectly.
    // This may be from some slightly misaligned verices during creation (bad math somewhere).
    // I'll need to troubleshoot this further such that I can remove this later.
    translate(0, 0, len * 0.135);
    
    for(int i = 0; i < secondVertices.size(); i++) {
      Vertex v1 = secondVertices.get(i % 4);
      Vertex v2 = secondVertices.get((i+1) % 4);
      Vertex v3 = secondVertices.get((i+2) % 4);
      
      beginShape();
        vertex(v1.getX(), v1.getY(), v1.getZ());
        vertex(v2.getX(), v2.getY(), v2.getZ());
        vertex(v3.getX(), v3.getY(), v3.getZ());
      endShape(CLOSE);
    }
    
    
    popStyle();
    popMatrix();
    
    pushMatrix();
    pushStyle();
    stroke(255,0,0);
    strokeWeight(10);
    line(x,y,z, len*sqrt(3/8.0), len*sqrt(3/8.0), len*sqrt(3/8.0));
    translate(x,y,z);
    fill(255,0,0,50);
    //sphere(len/sqrt(3));
    //sphere(len * sqrt(3/8.0));
    popStyle();
    popMatrix();
    
    

  }
}