int count = 1;
int div = 10;

void setup() {
  fullScreen();
  frameRate(60);
}

void draw() {
  background(0);
  if (count>div) {
  background(255);
  count=1;
} 
  
if (mousePressed) {
  div = round(map(mouseY, 0, height, 2, 60));

}
count++;
}
