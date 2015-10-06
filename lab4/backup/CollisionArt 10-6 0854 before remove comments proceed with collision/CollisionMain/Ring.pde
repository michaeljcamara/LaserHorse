class Ring {
  private Ring parent;
  //float centerX, centerY, centerZ;
  float x, y, z;
  float r;
  int type;

  Ring(Ring parent) {

    this.parent = parent;
    float px = parent.getX();
    float py = parent.getY();
    float pz = parent.getZ();
    float pr = parent.getRadius();
    x = px + pr/2.0;
    y = py + pr/2.0;
    z = pz + pr/2.0;
    //r = pr * 0.9;
    r = pr;

    //type = (int) random(0, 14);
    
    type = (parent.getType() + 1) % 6;
    println(type);
    
    // See where other node comes from
    // adjust type of start nodes
  }

  Ring(float x, float y, float z, float r, float type) {
    parent = null;
    this.x = x;
    this.y = y;
    this.z = z;
    this.r = r;

    //type = (int) random(0, 14);
    this.type = 0;
  }
  
  int getType() {
    return type;
  }

  float getRadius() {
    return r;
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

  void adjustX(float adjX) {
    x += adjX;
  }

  void updatePosition() {
    float px = parent.getX();
    float py = parent.getY();
    float pz = parent.getZ();
    float pr = parent.getRadius();

    float moveSpeed = frameCount/10.0;
    //pr = pr/3.0;

    //if(type ==0) {
    // x = px + pr * sin(moveSpeed);
    //y = py + pr * sin(moveSpeed);
    //z = pz + pr * sin(moveSpeed);
    //}
    //else if(type == 1) {
    // x = px + pr * sin(moveSpeed);
    //y = py + pr * sin(moveSpeed);
    //z = pz + pr * cos(moveSpeed);
    //}
    //else if(type == 2) {
    // x = px + pr * sin(moveSpeed);
    //y = py + pr * cos(moveSpeed);
    //z = pz + pr * sin(moveSpeed);
    //}
    //else if(type == 3) {
    // x = px + pr * cos(moveSpeed);
    //y = py + pr * sin(moveSpeed);
    //z = pz + pr * sin(moveSpeed);
    //}
    //else if(type == 4) {
    // x = px + pr * sin(moveSpeed);
    //y = py + pr * cos(moveSpeed);
    //z = pz + pr * cos(moveSpeed);
    //}
    //else if(type == 5) {
    // x = px + pr * cos(moveSpeed);
    //y = py + pr * cos(moveSpeed);
    //z = pz + pr * sin(moveSpeed);
    //}
    //else if(type == 6) {
    // x = px + pr * cos(moveSpeed);
    //y = py + pr * sin(moveSpeed);
    //z = pz + pr * cos(moveSpeed);
    //}
    //else if(type == 7) {
    // x = px + pr * cos(moveSpeed);
    //y = py + pr * cos(moveSpeed);
    //z = pz + pr * cos(moveSpeed);
    //}
    
    /////////////////////////////////////////////////

    //if (type ==0) {
    // x = px + pr * sin(moveSpeed);
    // y = py + pr * sin(moveSpeed);
    // z = pz + pr * sin(moveSpeed);
    //} else if (type == 1) {
    // x = px + pr * sin(moveSpeed);
    // y = py + pr * sin(moveSpeed);
    // z = pz + pr;
    //} else if (type == 2) {
    // x = px + pr * sin(moveSpeed);
    // y = py + pr;
    // z = pz + pr * sin(moveSpeed);
    //} else if (type == 3) {
    // x = px + pr;
    // y = py + pr * sin(moveSpeed);
    // z = pz + pr * sin(moveSpeed);
    //} else if (type == 4) {
    // x = px + pr;
    // y = py + pr * cos(moveSpeed);
    // z = pz + pr * cos(moveSpeed);
    //} else if (type == 5) {
    // x = px + pr * cos(moveSpeed);
    // y = py + pr * cos(moveSpeed);
    // z = pz + pr;
    //} else if (type == 6) {
    // x = px + pr * cos(moveSpeed);
    // y = py + pr;
    // z = pz + pr * cos(moveSpeed);
    //} else if (type == 7) {
    // x = px + pr * cos(moveSpeed);
    // y = py + pr * cos(moveSpeed);
    // z = pz + pr * cos(moveSpeed);
    //} else if (type == 8) {
    // x = px + pr;
    // y = py + pr;
    // z = pz + pr * cos(moveSpeed);
    //} else if (type == 9) {
    // x = px + pr;
    // y = py + pr * cos(moveSpeed);
    // z = pz + pr;
    //} else if (type == 10) {
    // x = px + pr * cos(moveSpeed);
    // y = py + pr;
    // z = pz + pr;
    //} else if (type == 11) {
    // x = px + pr;
    // y = py + pr;
    // z = pz + pr * sin(moveSpeed);
    //} else if (type == 12) {
    // x = px + pr;
    // y = py + pr * sin(moveSpeed);
    // z = pz + pr;
    //} else if (type == 13) {
    // x = px + pr * sin(moveSpeed);
    // y = py + pr;
    // z = pz + pr;
    //}
    
     //x = -px + pr * cos(moveSpeed);
     //y = py + pr * sin(moveSpeed);
     //z = pz + pr * sin(moveSpeed);

     //x = -px + pr * sin(moveSpeed);
     //y = py + pr * cos(moveSpeed);
     //z = pz + pr * cos(moveSpeed);
     
     if(type == 0) {
     x = px + pr * sin(moveSpeed);
     y = py + pr * cos(moveSpeed);
     z = pz + pr * cos(moveSpeed);
     }
     else if(type ==1) {
     x = -px + pr * sin(moveSpeed);
     y = py + pr * cos(moveSpeed);
     z = pz + pr * cos(moveSpeed);
     }
     else if(type ==2) {
     x = px + pr * sin(moveSpeed);
     y = -py + pr * cos(moveSpeed);
     z = pz + pr * cos(moveSpeed);
     }
     if(type == 3) {
     x = px + pr * sin(moveSpeed);
     y = py + pr * cos(moveSpeed);
     z = -pz + pr * cos(moveSpeed);
     }
     else if(type ==4) {
     x = -px + pr * sin(moveSpeed);
     y = -py + pr * cos(moveSpeed);
     z = pz + pr * cos(moveSpeed);
     }
     else if(type ==5) {
     x = px + pr * sin(moveSpeed);
     y = -py + pr * cos(moveSpeed);
     z = -pz + pr * cos(moveSpeed);
     }
     //else if(type ==6) {
     // x = px + pr * cos(moveSpeed);
     //y = py + pr * cos(moveSpeed);
     //z = pz + pr * sin(moveSpeed);
     //}
    //x = px + pr * sin(frameCount/100.0);
    //y = py + pr * sin(frameCount/100.0);
    //z = pz + pr * cos(frameCount/100.0);
  }

  void drawRing() {

    pushMatrix();
    pushStyle();
    translate(x, y, z);

    //stroke(0);
    //strokeWeight(3);
    sphere(r);

    popStyle();
    popMatrix();
  }
}