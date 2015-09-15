//*********************************************************************************
// Honor Code: The work I am submitting is a result of my own thinking and efforts.
// Michael Camara
// CMPSC 382 Fall 2015 (Professor Wenskovitch)
// Lab # 2
// Date: 9/8/15
// 
// Purpose: Create a class representation of a matrix, with methods to add and
//          multiply pairs of matrices.
//********************************************************************************



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
  
  
  println(m1);
  println(m2);
  
  //println(m1.addMatrices(m1, m2));
 
  
  //println(m1.dotProduct(m1.getRowVector(0), m2.getColumnVector(0)));
  //println();
  println(m1.multiplyMatrices(m1,m2));
  
}