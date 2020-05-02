int colour = 0;

void setup() {
  fullScreen();
  frameRate(5);
}

void draw() {
  background(colour);
  if (colour == 0) {
  colour = 255;
  } else {
  colour = 0; 
  }
  
  
//  if (mousePressed) {
//    if (mouseX < width/2) {
//      rect(0, 0, width/2, height); // Left
//    } else {
//      rect(width/2, 0, width/2, height); // Right
//    }
//  }
}
