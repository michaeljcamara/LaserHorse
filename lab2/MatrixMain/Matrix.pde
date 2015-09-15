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

/** This class represents a single matrix with a defined number of rows and columns.
/*  Each matrix can add or multiply with other matrices, provided it is valid to do
/*  so given the order and dimensions or each. */
class Matrix {
  int rows, columns;      // Dimensions of the matrix
  float[][] matrixArray;  // 2D array representation of matrix values

  // Initialize the matrix with the indicated number of rows and columns
  Matrix(int rows, int columns) {
    this.rows = rows;
    this.columns = columns;

    matrixArray = new float[rows][columns];
  } 
  
  // Retrieve the number of rows in this matrix
  int getRows() {
    return rows;
  }

  // Retrieve the number of columns in this matrix
  int getColumns() {
    return columns;
  }

  // Change the value of a particular element in the matrix, given the row and column
  void setValue(int row, int column, float value) {
    matrixArray[row][column] = value;
  }

  // Retrieve the value of a particular element in the matrix, given the row and column
  float getValue(int row, int column) {
    return matrixArray[row][column];
  }

  // Check to see whether two matrices have the same dimensions (i.e. the same # rows and 
  // the same # columns
  boolean haveSameDimensions(Matrix m1, Matrix m2) {
    if (m1.getRows() == m2.getRows() && m1.getColumns() == m2.getColumns()) {
      return true;
    } else {
      return false;
    }
  }

  // Generate a new matrix from adding two matrices of equal dimensions
  Matrix addMatrices(Matrix m1, Matrix m2) {

    // Ensure that the matrices have the same dimensions
    if (!m1.haveSameDimensions(m1, m2)) {
      println("These matrices do not share the same number of rows and columns.");
      println("Matrix addition cannot be performed");
      return null;
    }

    // Create an initially empty matrix to hold new values from addition
    Matrix updatedMatrix = new Matrix(m1.getRows(), m1.getColumns());

    // Iterate through the rows and columns of each matrix
    for (int row = 0; row < m1.getRows(); row++) {
      for (int column = 0; column < m1.getColumns(); column++) {

        // Add together matching elements using the same row/column indices
        float sum = m1.getValue(row, column) + m2.getValue(row, column);

        // Update the addition matrix with this value
        updatedMatrix.setValue(row, column, sum);
      }
    } 

    return updatedMatrix;
  }

  // Generate a new matrix from multiplying two matrices, where the number of columns
  // from m1 equal the number of rows from m2
  Matrix multiplyMatrices(Matrix m1, Matrix m2) {

    // Ensure that the # columns from m1 equal the # rows from m2
    if (m1.getColumns() != m2.getRows()) {
      println("Invalid matrices for dot product.");
      println("The number of columns in m1 should equal the number of rows in m2");
      return null;
    }

    // Create an initially empty matrix to hold 
    Matrix updatedMatrix = new Matrix(m1.getRows(), m2.getColumns());

    // Iterate through all rows and columns of the matrices
    for (int row = 0; row < m1.getRows(); row++) {

      // Copy the entire row of the first matrix at the current index 
      Matrix rowVector = m1.getRowVector(row);

      for (int column = 0; column < m2.getColumns(); column++) {

        // Copy the entire column of the second matrix at the current index
        Matrix columnVector = m2.getColumnVector(column);

        // Calculate the dot product of the given row and column
        float product = m1.dotProduct(rowVector, columnVector);

        // Place the dot product in the correct place in the new matrix
        updatedMatrix.setValue(row, column, product);
      }
    }

    return updatedMatrix;
  }

  // Calculate the dot product of two vectors (represented as Matrix objects)
  // NOTE: the first vector should be a row; the second vector should be a column
  float dotProduct(Matrix rowVector, Matrix columnVector) {

    // Ensure that the first vector is a row, and the second vector is a column
    if (!(rowVector.getRows() == 1 && columnVector.getColumns() == 1)) {
      println("Invalid matrices for dot product.");
      println("The number of columns in m1 should equal the number of rows in m2");
      return 0;
    }

    // Iterate through each index of the rowVector and columnVector
    float product = 0;
    for (int i = 0; i < rowVector.getColumns(); i++) {
      float rowValue = rowVector.getValue(0, i);
      float columnValue = columnVector.getValue(i, 0);
      
      // Multiply each pair of values and add to running total
      product += rowValue * columnValue;
    }

    return product;
  }

  // Retrieve the row at the given index, represented as a Matrix object
  Matrix getRowVector(int row) {
    Matrix rowVector = new Matrix(1, columns);
    for (int column = 0; column < columns; column++) {
      rowVector.setValue(0, column, matrixArray[row][column]);
    }

    return rowVector;
  }
  
  // Retrieve the column at the given index, represented as a Matrix object
  Matrix getColumnVector(int column) {
    Matrix columnVector = new Matrix(rows, 1);
    for (int row = 0; row < rows; row++) {
      columnVector.setValue(row, 0, matrixArray[row][column]);
    }

    return columnVector;
  }


  // Display this matrix using a standard row/column representation
  String toString() {
    String output = "";
    for (int i = 0; i < rows; i++ ) {
      for (int j = 0; j < columns; j++) {
        output += (matrixArray[i][j] + " ");
      }
      output += "\n";
    } 

    return output;
  }
}