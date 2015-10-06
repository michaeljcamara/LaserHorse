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

/** Create two tetrahedrons, superimposed upon each other to create a sort of
/*  "dual" tetrahedron resembling a star-shape.  Move these shapes within bounding
/*  box, bouncing in opposite direction upon any collision with wall.  Each dual
/*  tetrahedron maintains its own positional and rotational velocity which impact
/*  how quickly it travels across the screen. */

class DualTetrahedron {
  float x, y, z;     // center of shape
  float vx, vy, vz;  // velocity of the tetrahedron
  float xyOffset, yzOffset, xzOffset;  // Impose a random offset for rotations
  float xySpeed;  // Randomly speed of xy rotation
  float xyAngle;  // Absolute xy rotation amount
  float len;      // Length of one slide

  // Vertices from the first tetrahedron
  ArrayList<Vertex> firstVertices = new ArrayList<Vertex>();

  // Second tetrahedron vertices superimposed on the first
  ArrayList<Vertex> secondVertices = new ArrayList<Vertex>();

  Matrix xyRotation = new Matrix(4, 4);          // Create rotational matrix for xy plane
  Matrix yz180Rotation = new Matrix(4, 4);       // Create rotational matrix for yz plane (for 180 degree rotation)
  Matrix originTranslate = new Matrix(4, 4);     // Translation matrix to move shape to origin
  Matrix destinationTranslate = new Matrix(4, 4);// Translation matrix to move shape back to original position
  Matrix updatedMatrix1 = null; // Matrix containing vertices for 1st tetrahedron post transformation
  Matrix updatedMatrix2 = null; // Matrix containing vertices for 2nd tetrahedron post transformation
  Matrix m = new Matrix(4, 4);  // Matrix containing all vertices from first tetrahedron

  // Set initial values
  DualTetrahedron(float x, float y, float z) {

    // Set the center of this shape
    this.x = x;
    this.y = y;
    this.z = z;

    // Randomly adjust the velocities
    vx = random(TETRA_SPEED_MIN, TETRA_SPEED_MAX);
    vy = random(TETRA_SPEED_MIN, TETRA_SPEED_MAX);
    vz = random(TETRA_SPEED_MIN, TETRA_SPEED_MAX);

    // Randomly adjust the rotational velocity offsets
    xyOffset = random(0, 180);
    xzOffset = random(0, 180);
    yzOffset = random(0, 180);

    // Randomly adjust the base rotational velocity
    xySpeed = random(-1, 1);
   
    //float yzAngle = radians(180);  // not yet implemented

      // Set length of each side of the shape
    len = TETRA_SIZE;
  }

  void drawShape() {
    pushMatrix();
    pushStyle();

    // Control the absolute amount of the rotation in the XY plane
    xyAngle = radians((frameCount + xyOffset) * xySpeed);

    createFirstVertices();      // Create initial vertices for first tetrahedron
    createMatrices();           // Create all matrices
    doMatrixTransformations();  // Do the matrix translations/rotations
    detectCollisions();         // Determine if tetrahedron has collided with bounding box
    drawFaces();                // Draw the faces of the tetrahedron

    popStyle();
    popMatrix();
  }

  // Generate the vertices for the first tetrahedron
  void createFirstVertices() {
    // Clear current list of vertices
    firstVertices.clear();
    secondVertices.clear();

    {      
      // Vertices for a tetrahedron (NOTE: this is the most accurate representation I could create;
      // but it may not be 100% accurate for a "true" tetrahedron
      Vertex v1 = new Vertex(x - len/2.0, y - (len*sqrt(3.0)/2.0)/3.0, z + (len*sqrt(2.0/3.0))/3.0);
      Vertex v2 = new Vertex(x + len/2.0, y - (len*sqrt(3.0)/2.0)/3.0, z + (len*sqrt(2.0/3.0))/3.0);
      Vertex v3 = new Vertex(x, y + (len*sqrt(3.0)/2.0)*(2.0/3.0), z + (len*sqrt(2.0/3.0))/3.0);
      Vertex v4 = new Vertex(x, y, z - (len*sqrt(2.0/3.0)) * (2.0/3.0));

      firstVertices.add(v1);
      firstVertices.add(v2);
      firstVertices.add(v3);
      firstVertices.add(v4);
    }
  }

  // Create all transformation matrices
  void createMatrices() {

    // Set first matrix for first tetrahedron (prior to transformation
    for (int i = 0; i < firstVertices.size (); i++) {
      m.setVertex(i, firstVertices.get(i));
    }

    // Create rotational matrix for xy plane
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

    // Create rotational matrix for yz plane (for 180 degree rotation)
    yz180Rotation.setValue(0, 0, 1);
    yz180Rotation.setValue(0, 1, 0);
    yz180Rotation.setValue(0, 2, 0);
    yz180Rotation.setValue(0, 3, 0);  
    yz180Rotation.setValue(1, 0, 0);
    yz180Rotation.setValue(1, 1, cos(PI));
    yz180Rotation.setValue(1, 2, -sin(PI));
    yz180Rotation.setValue(1, 3, 0);  
    yz180Rotation.setValue(2, 0, 0);
    yz180Rotation.setValue(2, 1, sin(PI));
    yz180Rotation.setValue(2, 2, cos(PI));
    yz180Rotation.setValue(2, 3, 0);  
    yz180Rotation.setValue(3, 0, 0);
    yz180Rotation.setValue(3, 1, 0);
    yz180Rotation.setValue(3, 2, 0);
    yz180Rotation.setValue(3, 3, 1);

    // Translation matrix to move shape to origin
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

    // Translation matrix to move shape back to original position
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
  }

  void doMatrixTransformations() {
    // Create two new matrices moved to origin
    // Each matrix represents the vertices for one tetrahedron
    updatedMatrix1 = m.addMatrices(m, originTranslate);
    updatedMatrix2 = m.addMatrices(m, originTranslate);

    // Rotate second tetrahedron so that it forms a dual tetrahedron with the first
    updatedMatrix2 = m.multiplyMatrices(updatedMatrix2, yz180Rotation);

    //Rotate both tetrahedrons in xy plane (in unison)
    updatedMatrix1 = m.multiplyMatrices(updatedMatrix1, xyRotation);
    updatedMatrix2 = m.multiplyMatrices(updatedMatrix2, xyRotation);

    // Put both back at the corect location
    updatedMatrix1 = m.addMatrices(updatedMatrix1, destinationTranslate);
    updatedMatrix2 = m.addMatrices(updatedMatrix2, destinationTranslate);

    // Create list of vertices for new (second) tetrahedron
    // Update list of vertices for first tetrahedron after transformation
    for (int i = 0; i < firstVertices.size (); i++) {

      // Add vertices for second tetrahedron
      Vertex updatedVertex = updatedMatrix2.getVertex(i);
      secondVertices.add(updatedVertex);

      // Update vertices for first tetrahedron
      Vertex updatedVertex2 = updatedMatrix1.getVertex(i);
      Vertex currentVertex2 = firstVertices.get(i);
      currentVertex2.setVertex(updatedVertex2);
    }
  }

  // Determine if tetrahedron has collided with the bounding box
  void detectCollisions() {
    // Indicate whether the shape has collided with the bounding box at least once
    boolean xBounce = false;
    boolean yBounce = false;
    boolean zBounce = false;

    // Iterate through all the vertices and detect if a collision has occurred
    for (int i = 0; i < firstVertices.size (); i++) {
      Vertex v = firstVertices.get(i);
      Vertex v2 = firstVertices.get(i);

      // If collision detected, negate the current speed in the indicated direction
      if (xBounce == false && abs(v.getX()) >= BOX_SIZE/2.0 || v2.getX() >= BOX_SIZE/2.0) {
        vx *= -1;
        //x += Math.signum(vx) * 10;
        xBounce = true;
      }
      if (yBounce == false && abs(v.getY()) >= BOX_SIZE/2.0 || v2.getY() >= BOX_SIZE/2.0) {
        vy *= -1;
        //y += Math.signum(vy) * 10;
        yBounce = true;
      }
      if (zBounce == false && abs(v.getZ()) >= BOX_SIZE/2.0 || v2.getZ() >= BOX_SIZE/2.0) {
        vz *= -1;
        //z += Math.signum(vz) * 10;
        zBounce = true;
      }
    }
  }

  void drawFaces() {

    noStroke(); // No borders on the shape
    fill(255);  // White color for shape

    // Adjust the vertex positions based on their corresponding velocities
    x += vx;
    y += vy;
    z += vz;

    // Draw the vertices for the first tetrahedron
    for (int i = 0; i < firstVertices.size (); i++) {
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

    // Draw the vertices for the second tetrahedron
    for (int i = 0; i < secondVertices.size (); i++) {
      Vertex v1 = secondVertices.get(i % 4);
      Vertex v2 = secondVertices.get((i+1) % 4);
      Vertex v3 = secondVertices.get((i+2) % 4);

      beginShape();
      vertex(v1.getX(), v1.getY(), v1.getZ());
      vertex(v2.getX(), v2.getY(), v2.getZ());
      vertex(v3.getX(), v3.getY(), v3.getZ());
      endShape(CLOSE);
    }
  }
}