import java.util.Iterator;

ArrayList<PVector> points = new ArrayList<PVector>();
int pointAmount = 40;
int proximity = 120;
PVector[] pointsArray = new PVector[30];
PVector newPoint;
float inc = TWO_PI/96;
float offSet = 0;
float noiseMult = 50;
float r = 0.5;
float drawRadius = 150;
float edge = 100;
int divisionProb= 10;
float attractionMult = 0.0000001;
int randomProb = 10;

void setup() {
  size(640, 480);
  noSmooth();
  frameRate(25);
  for (int i = 0; i<pointAmount; i++) {
    //boolean b = true;
    //while (b) {
    //  b=false;
    newPoint = new PVector(random(width), random(height));
    //  for (PVector point : points) {
    //    if (point.dist(newPoint)<proximity) {
    //      b=true;
    //    }
    //  }
    //}
    points.add(newPoint);
  }
  for (int i = 0; i<1000; i++) {
    update();
  }
  background(0);
}

void draw() {
  float minDist = width+height;
  loadPixels();
  for (int i = 0; i<height; i++) {
    for (int j = 0; j<width; j++) {
      minDist = width+height;
      for (PVector point : points) {
        //  minDist = min(minDist, dist(j, i, point.x+noise(point.x, r*cos(offSet), r*sin(offSet))*noiseMult, point.y+noise(point.y, r*cos(offSet), r*sin(offSet))*noiseMult));
        minDist = min(minDist, dist(j, i, point.x, point.y));
      }
      // colorMode(HSB);
      pixels[j+(i*width)] = color(map(minDist, drawRadius, 0, 0, 255));
    }
  }
  offSet+=inc;
  updatePixels();
  update();
  //if (frameCount>250) {
  //  println("FINISHED RENDERING");
  //} else {
  //  saveFrame("frames/####.tif");
  //  println("saving");
  //}
}

void update() {
  PVector repulsion;

  Iterator<PVector> itr = points.iterator();

  while (itr.hasNext()) {
    PVector point = itr.next();
    //   repulsion = new PVector(point.x-(width/2), point.y-(height/2));
    //  repulsion.normalize();
    //   if (point.x>width || point.x<0 || point.y>height || point.y<0) {
    //  point.add(repulsion.mult(1));
    //   }
    if (random(100)<randomProb) {
      point.add(PVector.random2D());
    }


    for (PVector p : points) {                 // DISTANCING MECHANICS
      repulsion = point.copy().sub(p);
      repulsion.normalize();
      if (point.dist(p)>0 && point.dist(p)<proximity) {
        point.add(repulsion);
      } else if (point.dist(p)>proximity) {    // ATTRACTION
        point.sub(repulsion.mult(attractionMult));
      }
    }


    if (point.x < -edge || point.x > width+edge || point.y < -edge || point.y > height+edge) {
      itr.remove();
    }
  }

  if (points.size()>0 && points.size()<pointAmount && random(100)<divisionProb) {
    points.add(points.get(int(random(points.size()))).copy().add(PVector.random2D()));
    println("division occured");
  }
}

void mousePressed() {
  // saveFrame("worleynoise-######.png");
  PVector nearest = new PVector(10000, 10000);
  for (PVector p : points) {
    if (dist(mouseX, mouseY, p.x, p.y)<dist(mouseX, mouseY, nearest.x, nearest.y)) {
      nearest=p;
    }
  }
  points.remove(nearest);
}
