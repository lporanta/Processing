boolean finished = false;
float inc = 0.1;
float randomRange = 0.2;
float randomMultiplier = 1.015;
int iterations = 50;
int size = 1;
float gaussianMultiplier = 3;


void setup() {

  size(600, 600);
  //fullScreen();
  //noSmooth();
  noCursor();
  frameRate(24);
  background(0);
}

void draw() {
  noFill();
  stroke(255);
  strokeWeight(size);
  if (!finished) {



    for (int i=0; i<height; i++) {
      for (int j=0; j<iterations; j++) {
        float colour = random(0, 255);
        stroke(colour);
        float random = random(0, randomRange);
        float pointX = width/2-randomRange/2+random;
        point(pointX, i);
        if (i>0 && i<height-1 && pointX>0 && pointX<width) {
          colour=lerp(colour, 0, 0.2);
          stroke(colour);
         // rect(pointX-1, i-1, 3, 3);
        }
        while (colour>0) {
           colour-=1;
           stroke(colour,colour,colour,10);
           point(pointX+randomGaussian()*gaussianMultiplier, i+randomGaussian()*gaussianMultiplier);
          }
      }
      randomRange*=randomMultiplier;
    }
  }
  
  finished = true;
}

void mouseReleased() {
  saveFrame("randomStudy-######.png"); 
}
