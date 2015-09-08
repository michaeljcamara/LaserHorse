class Matrix {
  int rows, columns;
  float[][] matrixArray;

  Matrix(int rows, int columns) {
    this.rows = rows;
    this.columns = columns;

    matrixArray = new float[rows][columns];


  } 

  int getRows() {
    return rows;
  }
  
  int getColumns() {
    return columns;
  }

  void setValue(int row, int column, float value) {
    
    matrixArray[row][column] = value;
  }
  
  float getValue(int row, int column) {
    return matrixArray[row][column];
  }

  Matrix addMatrices(Matrix m1, Matrix m2) {
    
    if(m1.getRows() != m2.getRows() || m1.getColumns() != m2.getColumns()) {
      println("These matrices do not share the same number of rows and columns.  Matrix addition cannot be performed");
      return null;
    }

    Matrix updatedMatrix = new Matrix(m1.getRows(), m1.getColumns());

    for(int row = 0; row < m1.getRows(); row++) {
  
       for(int column = 0; column < m1.getColumns(); column++) {
         float sum = m1.getValue(row, column) + m2.getValue(row, column);
         updatedMatrix.setValue(row, column, sum);
       }
    } 
    
    return updatedMatrix;
  }

  Matrix multiplyMatrices(Matrix m1, Matrix m2) {
    
    return null;
  }
  
  float dotProduct(Matrix m1, Matrix m2) {
    
    int minRows = 0;
    int minColumns = 0;
    
    Matrix minRowMatrix = null;
    Matrix minColumnMatrix = null;
    
    if(m1.getRows() < m2.getRows()) {
      minRows = m1.getRows();
      minRowMatrix = m1;
    }
    else {
      minRows = m2.getRows();
      minRowMatrix = m2;
    }
    if(m1.getColumns() > m2.getColumns()) {
      minColumns = m1.getColumns();
      minColumnMatrix = m1;
    }
    else {
      minColumns = m2.getColumns();
      minColumnMatrix = m2;
    }
    
    Matrix updatedMatrix = new Matrix(m1.getRows(), m1.getColumns());

//    for(int row = 0; row < m1.getRows(); row++) {
//       for(int column = 0; column < m1.getColumns(); column++) {
//         float product = m1.getValue(row, column) * m2.getValue(row, column);
//         
//         updatedMatrix.setValue(row, column, product);
//       }
//    }
    
    for(int row = 0; row < m1.getRows(); row++) {
       for(int column = 0; column < m1.getColumns(); column++) {
         for(int iteration = 0; iteration < m2.getColumns(); iteration++) {
           float product = m1.getValue(row, column) * m2.getValue(row, column);
           updatedMatrix.setValue(row, column, sum);
       }
    } 
    
    return 0;
    
  }
  
  Matrix getRowVector() {
    Matrix rowVector = new Matrix(1, columns);
    for(int column = 0; column < columns; column++) {
      rowVector.setValue(0, column, matrixArray[0][column]);
    }
    
    return rowVector;
  }
  
  Matrix getColumnVector() {
    Matrix columnVector = new Matrix(rows, 1);
    for(int row = 0; row < rows; row++) {
      columnVector.setValue(row, column, matrixArray[0][column]);
    }
    
    return rowVector;
  }
  
  
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

