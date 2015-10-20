PImage img;
Tile[] tiles;
int id = 0;

void setup() {
  img = loadImage("lunar.jpg");
  size(img.width, img.height+150);
  //image(img, 0, 0);
  tiles = new Tile[288];
  
  int tileNum = 0;
  for (int y = 0; y < img.height; y += 20) {
    for (int x = 0; x < img.width; x += 20) {
      tiles[tileNum] = new Tile(img.get(x, y, 20, 20), x, y);
      tileNum++;
    } //for   
  } //for
  
} //setup

void draw() {
  background(0);


  
  for (int i = 0; i < tiles.length; i++) {
//    tiles[i].update();
    tiles[i].drawTile();
  } //for
} //draw
