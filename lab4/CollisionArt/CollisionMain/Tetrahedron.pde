class Tetrahedron {
  float x, y, z; // center of shape

  Tetrahedron(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void drawShape() {
    pushMatrix();
    pushStyle();
    
    float xyAngle = radians(60);
    float xzAngle = radians(60);
    float yzAngle = radians(60);
    
    fill(122, 100);
    
    float len = 100;
    stroke(0);
    strokeWeight(3);

    beginShape();
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y + len*(2/3.0), z + len/3);
    endShape(CLOSE);
    
        beginShape();
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);
    
        beginShape();
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y + len*(2/3.0), z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);
    
        beginShape();
    vertex(x, y + len*(2/3.0), z + len/3);
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);
    
    Matrix m = new Matrix(12, 4);
    m.setValue(0, 0, x - len/2);
    m.setValue(0, 1, y - len/3);
    m.setValue(0, 2, z + len/3);
    m.setValue(0, 3, 1);
    
    m.setValue(1, 0, x + len/2); 
    m.setValue(1, 1, y - len/3);
    m.setValue(1, 2, z + len/3);
    m.setValue(1, 3, 1);
    
    m.setValue(2, 0, x);
    m.setValue(2, 1, y - len/3);
    m.setValue(2, 2, z + len/3);
    m.setValue(2, 3, 1);
    
    m.setValue(3, 0, x - len/2);
    m.setValue(3, 1, y - len/3);
    m.setValue(3, 2, z + len/3);
    m.setValue(3, 3, 1);
    
    m.setValue(4, 0, x + len/2);
    m.setValue(4, 1, y);
    m.setValue(4, 2, z + len/3);
    m.setValue(4, 3, 1);
    
    m.setValue(5, 0, x);
    m.setValue(5, 1, y - len/3);
    m.setValue(5, 2, z - len*(2/3.0));
    m.setValue(5, 3, 1);

    m.setValue(6, 0, x + len/2);
    m.setValue(6, 1, y - len/3);
    m.setValue(6, 2, z + len/3);
    m.setValue(6, 3, 1);
    
    m.setValue(7, 0, x);
    m.setValue(7, 1, y + len*(2/3.0));
    m.setValue(7, 2, z + len/3);
    m.setValue(7, 3, 1);
    
    m.setValue(8, 0, x);
    m.setValue(8, 1, y);
    m.setValue(8, 2, z - len*(2/3.0));
    m.setValue(8, 3, 1);
    
    m.setValue(9, 0, x);
    m.setValue(9, 1, y + len*(2/3.0));
    m.setValue(9, 2, z + len/3);
    m.setValue(9, 3, 1);
    
    m.setValue(10, 0, x - len/2);
    m.setValue(10, 1, y - len/3);
    m.setValue(10, 2, z + len/3);
    m.setValue(10, 3, 1);
    
    m.setValue(11, 0, x);
    m.setValue(11, 1, y);
    m.setValue(11, 2, z - len*(2/3.0));
    m.setValue(11, 3, 1);
    
    Matrix xy = new Matrix(4, 4);
    xy.setValue(0, 0, cos(xyAngle));
    xy.setValue(0, 1, -sin(xyAngle));
    xy.setValue(0, 2, 0);
    xy.setValue(0, 3, 0);
    
    xy.setValue(1, 0, sin(xyAngle));
    xy.setValue(1, 1, cos(xyAngle));
    xy.setValue(1, 2, 0);
    xy.setValue(1, 3, 0);
    
    xy.setValue(2, 0, 0);
    xy.setValue(2, 1, 0);
    xy.setValue(2, 2, 1);
    xy.setValue(2, 3, 0);
    
    xy.setValue(3, 0, 0);
    xy.setValue(3, 1, 0);
    xy.setValue(3, 2, 0);
    xy.setValue(3, 3, 1);
    
    Matrix updatedMatrix = m.multiplyMatrices(m, xy);
    
    // Rem translate to/from origin!1
    // TEST THIS TO BE SURE VAluES ARE CoRRECT
//    println(updatedMatrix);

/////////////////first corners left and right
    
    pushMatrix();
    //rotateY(radians(90));
    rotateZ(radians(180));
    rotateX(radians(180));
    //translate(0, 100, 0);
    
        beginShape();
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y + len*(2/3.0), z + len/3);
    endShape(CLOSE);
    
        beginShape();
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);
    
        beginShape();
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y + len*(2/3.0), z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);
    
        beginShape();
    vertex(x, y + len*(2/3.0), z + len/3);
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);
    
    popMatrix();
    /////////////////second corners up and down
    
    pushMatrix();
//    rotateZ(radians(180));
//    //rotateX(radians(180));
//    rotateY(radians(180));  // if 180 then chop slice star
//    //translate(0, 100, 0);
    
    //rotateY(radians(180));  // another 180 chiop slice star
    //rotateX(radians(180));
    
    //rotateZ(radians(180));
    //rotateX(radians(180));
    //translate(0, 0, 50);
    //rotateY(radians(180));
    
    
        beginShape();
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y + len*(2/3.0), z + len/3);
    endShape(CLOSE);
    
        beginShape();
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);
    
        beginShape();
    vertex(x + len/2, y - len/3, z + len/3);
    vertex(x, y + len*(2/3.0), z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);
    
        beginShape();
    vertex(x, y + len*(2/3.0), z + len/3);
    vertex(x - len/2, y - len/3, z + len/3);
    vertex(x, y, z - len*(2/3.0));
    endShape(CLOSE);


    popMatrix();
    
    popStyle();
    popMatrix();
    
    /*
    beginShape();
    vertex();
    vertex();
    vertex();
    endShape(CLOSE);
    */
  }
}

