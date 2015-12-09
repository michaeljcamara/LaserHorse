//************************************************************
// Michael Camara
// Honor code pledge: This work is mine unless otherwise cited
// CMPSC 382
//************************************************************

import java.util.*;

ArrayList<Animal> animals;
float maxWeight, minAge, maxAge;
int numAnimals;

// Get data from datasets
void setup() {
  //**************************************************
  // **COMMENT OR UNCOMMENT TO CHANGE DATASET USED!***
  //**************************************************
  //Table table = loadTable("data1.csv", "header");
  Table table = loadTable("data2.csv", "header");
  
  size(1200, 700);
  colorMode(HSB, 360, 100, 100);

  // Create Animal objects from dataset
  animals = new ArrayList<Animal>();
  for (TableRow row : table.rows()) {
    Animal animal = new Animal(row);
    animals.add(animal);
  }

  // Sort animals in ascending order based on weight
  Collections.sort(animals, new AnimalWeightComparator());

  // Get min/max values to allow dynamic resizing of bars
  maxWeight = animals.get(animals.size() - 1).getWeight();
  minAge = Collections.min(animals, new AnimalAgeComparator()).getAge();
  maxAge = Collections.max(animals, new AnimalAgeComparator()).getAge();
  numAnimals = animals.size();
}

void draw() {
  drawBarChart();  // Static bar chart
  infoOnDemand();  // Info on demand using mouse
}

void drawBarChart() {  
  drawAxes();
  drawKey();
  drawAnimalData();
}

void drawAxes() {

  // Print chart title
  background(0, 0, 100);
  stroke(0);
  fill(0);
  textSize(30);
  textAlign(CENTER, BOTTOM);
  text("Comparison of Animal Weights", 500, 35);

  //Print x axis and y axis
  line(0, 500, 1000, 500);
  line(100, 50, 100, 550);

  // Print axis labels
  textSize(25);
  pushMatrix();
  textAlign(CENTER, BOTTOM);
  translate(35, 250);
  rotate(-HALF_PI);
  text("Weight", 0, 0);
  popMatrix();
  text("Names", 500, 670);

  // Print Max weight at top of y axis, and max weight / 2 in middle of axis
  textSize(15);
  textAlign(RIGHT, BOTTOM);
  text("0", 100, 500);
  textAlign(RIGHT, TOP);
  text(maxWeight, 100, 50);
  text(maxWeight / 2, 100, 275);
}

void drawAnimalData() {
  // Calculate width of bar based on number of animals in dataset
  float barWidth = 900.0 / (numAnimals + 1);
  float buffer = (barWidth / numAnimals);

  // Iterate through all animals to create their unique bar on the chart
  for (int i = 0; i < numAnimals; i++) {
    Animal a = animals.get(i);
    String name = a.getName();
    float age = a.getAge();
    float weight = a.getWeight();

    // Attempt to dynamically adjust size of names
    float sizeOfText = map(1.0/numAnimals, 0, 1, 20, 40); 
    textSize(sizeOfText);

    // Determine positional information about this animals bar
    float x = 100 + (i * barWidth) + (i * buffer);
    float barHeight = map(weight, 0, maxWeight, 0, 450);
    float y = 500 - barHeight;

    // Save this info in the Animal object
    a.setX(x);
    a.setY(y);
    a.setHeight(barHeight);
    a.setWidth(barWidth);

    // Fill color of rectangle in following format:
    // If dog, use a red hue (16) ; if cat, use a blue hue (201);
    // If older (compared to maxAge), use higher saturation
    // If younger (compared to maxAge), use lower saturation
    // Keep brightness constant to ensure good luminance contrast
    float barHue = 0, barSaturation = 0, barBrightness = 0;
    if (a.getSpecies().toLowerCase().equals("dog")) {
      barHue = 16;
      barSaturation = map(age, 0, maxAge, 20, 70); 
      barBrightness = 92;
    } else if (a.getSpecies().toLowerCase().equals("cat")) {
      barHue = 201;
      barSaturation = map(age, 0, maxAge, 20, 70); 
      barBrightness = 80;
    }

    // Fill bars in graph using these colors and previously determined
    // locations/dimensions
    pushStyle();
    color customColor = color(barHue, barSaturation, barBrightness);
    fill(customColor);
    strokeWeight(1);
    stroke(0);
    rect(x, y, barWidth, barHeight);
    popStyle();

    // Print names of the animals below their bars in a vertical orientation
    pushMatrix();
    fill(0);
    textAlign(RIGHT, CENTER);
    translate(x, 750);
    rotate(-HALF_PI);
    text(name, 0, 0, 240, barWidth);
    popMatrix();
  }
}

void drawKey() {
  // Print simple key to right side of chart
  // Rect border and label
  fill(0, 0, 100);
  stroke(0);
  rect(1015, 75, 175, 325);
  textAlign(CENTER, BOTTOM);
  fill(0);
  text("KEY", 1100, 100);

  // Colored red/blue boxes for dog/cat
  fill(16, 70, 92); // Red
  rect(1025, 125, 50, 25);
  fill(0);
  textAlign(LEFT, BOTTOM);
  text(" = DOG", 1100, 150);
  fill(201, 70, 80); // Blue
  rect(1025, 175, 50, 25);
  fill(0);
  text(" = CAT", 1100, 200);

  // Use gradient bars to show that saturation reflects age
  // Dog:
  noStroke();
  for (int i = 0; i < 150; i++) {
    fill(16, 70 * (i/150.0), 92);
    rect(1025 + i, 225, 1, 25);
  }

  // Use text to show meaning of gradients
  textAlign(CENTER, CENTER);
  textSize(12);
  fill(0);
  text("<--Younger   Older -->", 1025, 275, 150, 25);

  // Cat:
  for (int i = 0; i < 150; i++) {
    fill(201, 70 * (i/150.0), 80);
    rect(1025 + i, 325, 1, 25);
  }
}

void infoOnDemand() {
  Animal chosenAnimal = null;

  for (int i = 0; i < animals.size(); i++) {
    Animal a = animals.get(i);
    float x = a.getX();
    float y = a.getY();
    float wid = a.getWidth();
    float hei = a.getHeight();
    if (mouseX >= x && mouseX <= (x + wid) && mouseY >= y && mouseY <= (y + hei)) {
      textAlign(CENTER, BOTTOM);
      textSize(15);
      float rectX = mouseX - 100;
      float rectY = mouseY - 160;
      fill(0, 0, 100);
      stroke(0);
      rect(rectX, rectY, 200, 160); 
      fill(0);
      text("Name: " + a.getName(), rectX + 100, rectY += 20);
      text("Weight: " + a.getWeight(), rectX + 100, rectY += 20);
      text("Species: " + a.getSpecies(), rectX + 100, rectY += 20);
      text("Breed: " + a.getBreed(), rectX + 100, rectY += 20);
      text("Color: " + a.getCoatColor(), rectX + 100, rectY += 20);
      text("Age: " + a.getAge() + " years", rectX + 100, rectY += 20);
      text("Sex: " + a.getSex(), rectX + 100, rectY += 20);
      text("Spayed/neutered?: " + a.getNeutered(), rectX + 100, rectY += 20);
    }
  }
}