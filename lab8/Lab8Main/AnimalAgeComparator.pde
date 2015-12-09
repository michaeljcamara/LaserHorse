class AnimalAgeComparator implements Comparator<Animal> {
  
  int compare(Animal a1, Animal a2) {
    float age1 = a1.getAge();
    float age2 = a2.getAge();
    
    // Sort in ascending order based on age of animals
    // i.e. first element is the lightest animal, last is the heaviest
    return (int) (age1 - age2);
  }
}