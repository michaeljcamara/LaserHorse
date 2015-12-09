class AnimalWeightComparator implements Comparator<Animal> {
  
  int compare(Animal a1, Animal a2) {
    float weight1 = a1.getWeight();
    float weight2 = a2.getWeight();
    
    // Sort in ascending order based on weight of animals
    // i.e. first element is the lightest animal, last is the heaviest
    return (int) (weight1 - weight2);
  }
  
}
