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


/** The setup for this project includes a few test cases to show that the Matrix
/*  class performs as intended.  Results from the algorithms in the Matrix class
/*  were compared with results obtained from a "TI-nspire" CAS (computer algebra
/*  system). */
void setup() {

  // Initialize two basic matrices containing float values
  int rows = 4;
  int columns = 4;

  Matrix m1 = new Matrix(rows, columns);
  Matrix m2 = new Matrix(rows, columns);

  for (int row = 0; row < rows; row++ ) {
    for (int column = 0; column < columns; column++) {
      m1.setValue(row, column, row);
      m2.setValue(row, column, column * 2);
    }
  }

  // Output initial matrices
  println("Matrix 1: \n" + m1);
  println("Matrix 2: \n" + m2);
  println("---------------------------------------------\n");

  // Test addition method
  Matrix additionMatrix = m1.addMatrices(m1, m2);
  println("Matrix 1 + Matrix 2:");
  println("Actual result: \n" + additionMatrix);
  println("Expected result: \n");

  // Results from TI-nspire CAS manually entered here
  Matrix expectedMatrix = new Matrix(4, 4);
  expectedMatrix.setValue(0, 0, 0);
  expectedMatrix.setValue(0, 1, 2);
  expectedMatrix.setValue(0, 2, 4);
  expectedMatrix.setValue(0, 3, 6);
  expectedMatrix.setValue(1, 0, 1);
  expectedMatrix.setValue(1, 1, 3);
  expectedMatrix.setValue(1, 2, 5);
  expectedMatrix.setValue(1, 3, 7);
  expectedMatrix.setValue(2, 0, 2);
  expectedMatrix.setValue(2, 1, 4);
  expectedMatrix.setValue(2, 2, 6);
  expectedMatrix.setValue(2, 3, 8);
  expectedMatrix.setValue(3, 0, 3);
  expectedMatrix.setValue(3, 1, 5);
  expectedMatrix.setValue(3, 2, 7);
  expectedMatrix.setValue(3, 3, 9);

  println(expectedMatrix);

  // Explicitly indicate whether the addition worked as intended
  print("Addition Test Status: ");
  if (additionMatrix.isEqual(additionMatrix, expectedMatrix)) {
    println("PASSED\n");
  } else {
    println("FAILED\n");
  }
  println("---------------------------------------------\n");

  // Test multiplication method
  Matrix multiplicationMatrix = m1.multiplyMatrices(m1, m2);
  println("Matrix 1 * Matrix 2:");
  println("Actual result: \n" + multiplicationMatrix);
  println("Expected result: \n");

  // Results from TI-nspire CAS manually entered here
  expectedMatrix = new Matrix(4, 4);
  expectedMatrix.setValue(0, 0, 0);
  expectedMatrix.setValue(0, 1, 0);
  expectedMatrix.setValue(0, 2, 0);
  expectedMatrix.setValue(0, 3, 0);
  expectedMatrix.setValue(1, 0, 0);
  expectedMatrix.setValue(1, 1, 8);
  expectedMatrix.setValue(1, 2, 16);
  expectedMatrix.setValue(1, 3, 24);
  expectedMatrix.setValue(2, 0, 0);
  expectedMatrix.setValue(2, 1, 16);
  expectedMatrix.setValue(2, 2, 32);
  expectedMatrix.setValue(2, 3, 48);
  expectedMatrix.setValue(3, 0, 0);
  expectedMatrix.setValue(3, 1, 24);
  expectedMatrix.setValue(3, 2, 48);
  expectedMatrix.setValue(3, 3, 72);

  println(expectedMatrix);

  // Explicitly indicate whether multiplication worked as intended
  print("Multiplication Test Status: ");
  if (multiplicationMatrix.isEqual(multiplicationMatrix, expectedMatrix)) {
    println("PASSED\n");
  } else {
    println("FAILED\n");
  }
  println("---------------------------------------------\n");

  // Test subtraction method
  Matrix subtractionMatrix = m1.subtractMatrices(m1, m2);
  println("Matrix 1 - Matrix 2:");
  println("Actual result: \n" + subtractionMatrix);
  println("Expected result: \n");

  // Results from TI-nspire CAS manually entered here
  expectedMatrix = new Matrix(4, 4);
  expectedMatrix.setValue(0, 0, 0);
  expectedMatrix.setValue(0, 1, -2);
  expectedMatrix.setValue(0, 2, -4);
  expectedMatrix.setValue(0, 3, -6);
  expectedMatrix.setValue(1, 0, 1);
  expectedMatrix.setValue(1, 1, -1);
  expectedMatrix.setValue(1, 2, -3);
  expectedMatrix.setValue(1, 3, -5);
  expectedMatrix.setValue(2, 0, 2);
  expectedMatrix.setValue(2, 1, 0);
  expectedMatrix.setValue(2, 2, -2);
  expectedMatrix.setValue(2, 3, -4);
  expectedMatrix.setValue(3, 0, 3);
  expectedMatrix.setValue(3, 1, 1);
  expectedMatrix.setValue(3, 2, -1);
  expectedMatrix.setValue(3, 3, -3);

  println(expectedMatrix);

  // Explicitly indicate whether subtraction worked as intended
  print("Subtraction Test Status: ");
  if (subtractionMatrix.isEqual(subtractionMatrix, expectedMatrix)) {
    println("PASSED\n");
  } else {
    println("FAILED\n");
  }
  println("---------------------------------------------\n");
}

