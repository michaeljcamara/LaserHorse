//**********************************************************************
// Michael Camara
// Honor Code Pledge: This work is mine unless otherwise cited
// CMPSC 382: Professor Wenskovitch
// Lab 6: More Image Exploration
//**********************************************************************

PImage img;               // The image being manipulated
ArrayList<Tile> tiles;    // A list containing tiles that, together, compose img

final int MIN_SIZE = 5;   // Set min size of Tile
final int MAX_SIZE = 8;   // Set max size of Tile
final float SPEED = 3;    // Set speed of animation (1 = slowest, 10 = fast)

void setup() {
  size(800, 800);
  img = loadImage("eiffel.png");  
  tiles = new ArrayList<Tile>();
  noStroke(); 
  
  // Create tiles of random width and height for the given image
  for (int y = 0, randHeight = 0; y < img.height; y += randHeight) {
    randHeight = (int) random(MIN_SIZE, MAX_SIZE);
    for (int x = 0, randWidth = 0; x < img.width; x += randWidth) {
      randWidth = (int) random(MIN_SIZE, MAX_SIZE);
      tiles.add(new Tile(img.get(x, y, randWidth, randHeight), x+100, y+100, randWidth, randHeight));
    }
  } 
}

void draw() {
  background(0);
  
  // Draw each Tile at its proper position and orientation
  for (int i = 0; i < tiles.size(); i++) {
    tiles.get(i).drawTile();
  }
}