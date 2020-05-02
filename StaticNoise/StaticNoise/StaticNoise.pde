float pixel;
float xOff = 0;
float yOff = 0;
float zOff = 1;
float inc = 0.005; //SCALES THE ANIMATION
float zOffInc = 0.02;

void setup() {
  size(400,400);
  noSmooth();
  noCursor();
  frameRate(24);
//  background(0);  
}

void draw() {
  //background(0);
  
  yOff=2;
  for (int i = 0; i<height; i++) {
    xOff=2;
    for (int j = 0; j<width; j++) {
      pixel = 255*noise(xOff, yOff, zOff);
      
      if(pixel<100) {
       pixel=0;
      }
      else if(pixel>170) {
       pixel=255; 
      } else {
       pixel=lerp(pixel, 100, 0.6);  //SMOOTHES THE BACKROUND (OPTIONAL)
      }
      
      pixel -= 30*random(0,1);
      if (random(0,1)<0.000003) {
       pixel = 255; 
      }
      if (random(0,1)<0.00005) {
       pixel = 0; 
      }
      stroke(pixel);
      point(j,i);
      
      if (j>width/2) {
       xOff-=inc;
      } else {
        xOff+=inc;
      }
    }
    yOff+=inc;
//  xOff+=1;
  }
  
  zOff+=zOffInc;
  
}
