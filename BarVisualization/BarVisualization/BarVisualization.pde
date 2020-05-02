import processing.sound.*;
import java.util.Arrays;
Amplitude amp;
AudioIn in;
float yPos = 0;
float yPosLimit = 400;
int sampleSize = 30;
float[] samples;
float resolution;
float colour = 0;
float colourInc = -5;
float realBoost = 0;
float boostInc = -10;
float boost = 0;
float scale = 15;

void setup() {
 resolution = width/sampleSize;
  samples = new float[sampleSize];
  size(600, 600);
  //fullScreen();
  //fullScreen();
  //  xAmount=width/resolution;
  //  yAmount=height/resolution;
  //noSmooth();
  noCursor();
  frameRate(24);
  background(0);
  amp = new Amplitude(this);
  in = new AudioIn(this, 0);
  in.start();
  amp.input(in);
}

void draw() {
  noStroke();
  fill(0,0,0,255);
  rect(0,0,width,height);
  
  translate(width/2, height/2);
  yPos=map(amp.analyze(),0,1,0,height)*scale;
  if (yPos>yPosLimit) {
   yPos=yPosLimit; 
  }
  float[] temp = new float[sampleSize];
  for (int i = 1; i<sampleSize; i++) {
    temp[i-1] = samples[i];
  }
  temp[sampleSize-1] = yPos;
  samples = Arrays.copyOf(temp, temp.length);
  
  
  
  noFill();
  float angleInc = PI/(sampleSize);
  float angle = 3*HALF_PI;
  realBoost = lerp(samples[sampleSize-1], samples[sampleSize-2], 0.5);
  
  
  if (boost*2>colour) {
  colour=boost*2;  
  if (colour>255) {
   colour=255; 
  }
  }
  if (realBoost>boost) {
  boost=realBoost;  
  }
  
  stroke(colour);
  strokeCap(PROJECT);
  strokeWeight(4);
  
  beginShape(LINES);
  for (int i = 0; i<sampleSize; i++) {
    //quadraticVertex((boost/2+samples[i])*cos(angle), (boost/2+samples[i])*sin(angle),0,+samples[i]);
  //  quadraticVertex(0,+samples[i],-(boost/2+samples[i])*cos(angle), (boost/2+samples[i])*sin(angle));
    stroke(colour-samples[i]);
    vertex((boost/2+samples[i])*cos(angle), (boost/2+samples[i])*sin(angle));
    //vertex(0,+samples[i]);
    vertex(-(boost/2+samples[i])*cos(angle), (boost/2+samples[i])*sin(angle));
    angle-=angleInc;
  }
  endShape();
  colour+=colourInc;
  boost+=boostInc;
  println(amp.analyze());
}
