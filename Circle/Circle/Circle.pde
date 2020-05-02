infoCircle circle;

void setup() {
  fullScreen();
  smooth();
  frameRate(60);
  
  background(0);
  circle = new infoCircle();
}

void draw() {
  noCursor();
fill(0,0,0,100);
rect(-1,-1,width+1,height+1);
stroke(255,255,255,50);
strokeWeight(1);
strokeCap(SQUARE);
strokeJoin(ROUND);
noFill();
circle.display();
circle.update();
}
