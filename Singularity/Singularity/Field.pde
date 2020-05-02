class Field {


  //PVector[][] grid;
  //int resolution;
  //int cols, rows;
  //float increment = 0.2;
  //float zoffInc=0.000001;
  //float zoff = 0;

  Field(int r) {
    //resolution = r;
    //cols = width/resolution;
    //rows = height/resolution;
    //grid = new PVector[cols][rows];
    //init();
  }

  void init() {
    //float xoff = 0;
    //for (int i = 0; i < cols; i++) {
    //  float yoff = 0;
    //  for (int j = 0; j < rows; j++) {
    //    float angle = map(noise(xoff, yoff,zoff*random(1,2)), 0, 1, PI, TWO_PI);
    //    grid[i][j] = PVector.fromAngle(angle);
     
    //      grid[i][j].add(PVector.fromAngle(TWO_PI).mult(map(i,0,cols-1,1,-1)));
        
    //    yoff+=increment;
    //    zoff+=zoffInc;
    //  }
    //  xoff+=increment;
    //}
  }


  PVector checkGrid(PVector check) {
    //int column = int(constrain(check.x/resolution, 0, cols-1));
    //int row = int(constrain(check.y/resolution, 0, rows-1));
  //  return grid[column][row];
  return ((new PVector(width/2, height/2).mult(-1).add(check)).rotate(HALF_PI+0.5)).mult(0.7);//(abs(height/2-check.y), abs(width/2-check.x));
    
  }
}
