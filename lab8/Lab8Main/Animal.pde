class Animal {
  private String name, species, breed, coatColor;
  private float weight, age;
  private boolean neutered;
  
  public Animal(String name, String species, String breed, float weight, float age) {
    this.name = name;
    this.species = species;
    this.breed = breed;
    this.weight = weight;
    this.age = age;
  }
  
  public Animal(TableRow row) {
   name = row.getString(0);
   species = row.getString(1);
   breed = row.getString(2);
   coatColor = row.getString(3);
   weight = row.getFloat(4);
   age = row.getFloat(5);
   
   String neuterStatus = row.getString(6);
   if(neuterStatus.equals("yes")) {
     neutered = true;
   }
   else {
     neutered = false;
   }
//   (neuterStatus.equals("yes")) ? (neutered = true) : (neutered = false);
   
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
  
  public float getAge() {
    return age;
  }  
  
}

