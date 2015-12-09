class Animal {
  private String name, species, breed, coatColor, sex;
  private float weight, age;
  private boolean neutered;
  private float x, y, wid, hei;
  
  // Put all info from table into animal object
  public Animal(TableRow row) {
   name = row.getString(0);
   species = row.getString(1);
   breed = row.getString(2);
   coatColor = row.getString(3);
   weight = row.getFloat(4);
   age = row.getFloat(5);
   sex = row.getString(6);
   
   String neuterStatus = row.getString(7);
   if(neuterStatus.equals("yes")) {
     neutered = true;
   }
   else {
     neutered = false;
   }
  }
  
  public String getName() {
    return name;
  }
  
  @Override
  public String toString() {
    return name;
  }
  
  public String getSpecies() {
    return species;
  }
  
  public String getBreed() {
    return breed;
  }
  
  public float getWeight() {
    return weight;
  }
  
  public String getCoatColor() {
    return coatColor;
  }
  
  public float getAge() {
    return age;
  }
  
  public boolean getNeutered() {
    return neutered;
  }
  
  public String getSex() {
    return sex;
  }
  
  public void setX(float x) {
    this.x = x;
  }
  
  public void setY(float y) {
    this.y = y;
  }
  
  public void setWidth(float wid) {
    this.wid = wid;
  }
  
  public void setHeight(float hei) {
    this.hei = hei;
  }
  
  public float getX() {
    return x;
  }
  
  public float getY() {
    return y;
  }
  
  public float getWidth() {
    return wid;
  }
  
  public float getHeight() {
    return hei;
  }
}