import java.util.*;

void setup() {
  Table table = loadTable("data1.csv", "header");
//  HashMap<Integer, String> dataTable = new HashMap<Integer, String>();
//  
//  for(int row = 0; row < table.getRowCount(); row++) {
//    Animal animal = new Animal
//    for(int col = 0; col < table.getColumnCount(); col++) {
//      String value = table.getString(row,col);
//      println(value);
//      
//    }
//  }
  ArrayList<Animal> animals = new ArrayList<Animal>();
  
  for(TableRow row : table.rows()) {
    Animal animal = new Animal(row);
    animals.add(animal);
  }
  
  for(Animal animal : animals) {
    println(animal);
  }
  
  Collections.sort(animals, new AnimalComparator());
  
  println("----------------");
  
  for(Animal animal : animals) {
    println(animal);
  }
  
  float maxWeight = animals.get(animals.size() - 1);
  float minAge = 
  
  
  
}

void draw() {
  
}
