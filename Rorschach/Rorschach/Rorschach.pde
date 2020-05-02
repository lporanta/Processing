float pixel;
//float[][] pixels;
int resolution = 10;
float xOff = 0;
float yOff = 0;
float zOff = 1;
float inc = 0.03; //SCALES THE ANIMATION
float zOffInc = 0.006;
int xAmount = 200;
int yAmount = 200;
float background = 30;
float edgeColor = 0;
float xRatio;
float yRatio;
float size = 6;
int edge = 70;


void setup() {
  //  size(400, 400);
  fullScreen();

  //fullScreen();
  //  xAmount=width/resolution;
  //  yAmount=height/resolution;
  //noSmooth();
  noCursor();
  frameRate(24);
  xRatio = resolution;
  yRatio = resolution;
  //  pixels = new float[width/resolution][height/resolution];
  background(0);
}

void draw() {
  //background(0);
  strokeCap(PROJECT);
  translate(width/2, height/2);
  translate(-xAmount*resolution/2, -yAmount*resolution/2);

  yOff=2;
  for (int i = 0; i<xAmount; i++) {
    xOff=2;
    for (int j = 0; j<=yAmount/2; j++) {
      pixel = 255*noise(xOff, yOff, zOff);

      if (pixel<100) {
        pixel=0;
      } else if (pixel>170) {
        pixel=255;
      } else {
        pixel=lerp(pixel, background, 0.6);  //SMOOTHES THE BACKROUND (OPTIONAL)
      }



      //CALCULATIONS FOR EDGE SMOOTHING
      //if (i<=edge && j>=i) {  //IF PIXEL IN TOP AREA (OR AT THE EDGE BETWEEN TOP AND LEFT)
      //  pixel=lerp(edgeColor, pixel, map(i, 0, edge, 0, 1));
      //} else if (j<=edge && j<i && j<xAmount-i) { //IF PIXEL IN LEFT AREA (AND NOT AT ANY EDGE BETWEEN AREAS)
      //  pixel=lerp(edgeColor, pixel, map(j, 0, edge, 0, 1));
      //} else if (xAmount-i<=edge && xAmount-i<=j) {  //IF PIXEL AT THE BOTTOM (OR AT THE EDGE BETWEEN BOTTOM AND LEFT)
      //  pixel=lerp(edgeColor, pixel, map(i, xAmount, xAmount-edge, 0, 1));
      //}


      //EDGE SMOOTHING BASED ON DISTANCE FROM ORIGO
      pixel=map(dist(i, j, xAmount/2, xAmount/2), 0, dist(0, 0, xAmount/2, xAmount/2), pixel, 0);
      //pixel=map(dist(i, j, xAmount/2, xAmount/2), 0, dist(0, 0, xAmount/2, xAmount/2), pixel, 0);

      //ADD SOME NOISE
      float pixel2 = addRandomNoise(pixel); //TWO DIFFERENT VALUES BECAUSE ASYMMETRIC NOISE IS ESSENTIAL
      pixel = addRandomNoise(pixel);




      stroke(pixel);
      strokeWeight(size);
      point(j*resolution, i*resolution);
      stroke(pixel2);
      point((xAmount*resolution)+resolution - (j*resolution), i*resolution);

      xOff+=inc;
    }
    yOff+=inc;
    //  xOff+=1;
  }

  zOff+=zOffInc;
}

float addRandomNoise(float p) {
  p -= 30*random(0, 1);
  if (random(0, 1)<0.000003) {
    p = 255;
  }
  if (random(0, 1)<0.00005) {
    p = 0;
  }
  return p;
}

//void draw() {
//  //background(0);

//  yOff=2;
//  for (int i = 0; i<xAmount; i++) {
//    xOff=2;
//    for (int j = 0; j<yAmount; j++) {
//      pixel = 255*noise(xOff, yOff, zOff);

//      if (pixel<100) {
//        pixel=0;
//      } else if (pixel>170) {
//        pixel=255;
//      } else {
//        pixel=lerp(pixel, 100, 0.6);  //SMOOTHES THE BACKROUND (OPTIONAL)
//      }

//      pixel -= 30*random(0, 1);
//      if (random(0, 1)<0.000003) {
//        pixel = 255;
//      }
//      if (random(0, 1)<0.00005) {
//        pixel = 0;
//      }
//      stroke(pixel);
//      strokeWeight(size);
//      point(j*xRatio, i*yRatio);

//      if (j>=xAmount/2) {
//        xOff-=inc;
//      } else {
//        xOff+=inc;
//      }
//    }
//    yOff+=inc;
//    //  xOff+=1;
//  }

//  zOff+=zOffInc;
//}
