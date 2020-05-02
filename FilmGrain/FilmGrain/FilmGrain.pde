float pixel;
float xOff = 1;
float yOff = 1;
float zOff = 1;

void setup() {
  size(600,400);
  noSmooth();
  frameRate(12);
  background(0);  
}

void draw() {
  background(0);
  for (int i = 0; i<height; i++) {
    for (int j = 0; j<width; j++) {
      //pixels[j][i] = 200*noise(xOff, yOff, zOff);
      pixel = 40*random(0,1);
      if (random(0,1)<0.0001) {
        pixel += 215*random(0,1);
      }
      stroke(pixel);
      point(j,i);
      xOff+=1;
    }
    yOff+=1;
  }
  zOff+=1;

}
