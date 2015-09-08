void setup() {

  

  int rows = 4;
  int columns = 4;

  Matrix m1 = new Matrix(rows, columns);
  Matrix m2 = new Matrix(rows, columns);
//  Matrix m2 = new Matrix(rows + 1, columns + 1);

  for (int row = 0; row < rows; row++ ) {
    for (int column = 0; column < columns; column++) {
      m1.setValue(row, column, (int) random(0, 5));
      m2.setValue(row, column, (int) random(0, 5));
    }
  }
  
//  for (int row = 0; row < rows +1; row++ ) {
//    for (int column = 0; column < columns + 1; column++) {
//      m2.setValue(row, column, (int) random(0, 5));
//    }
//  }
  
  println(m1);
  println(m2);
  
  println(m1.addMatrices(m1, m2));
  
}

