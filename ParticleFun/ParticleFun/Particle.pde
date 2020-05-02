class Particle {
  PVector loc;
  PVector prevLoc;
  PVector vel;
  PVector mouse;
  float scl = 2;
  int limit = 20;
  int size = 2;

  Particle() { 
    loc = new PVector(random(0, width), random(0, height));
    prevLoc = loc.copy();
    vel = PVector.random2D();
    mouse = new PVector(mouseX, mouseY);
    mouse = mouse.sub(loc);
    mouse.normalize();
    vel.limit(limit);
  }

  void update() {
    prevLoc.x = loc.x;
    prevLoc.y = loc.y;
    
    if (mousePressed) {
    mouse = new PVector(mouseX, mouseY);
    mouse = mouse.sub(loc);
    //  mouse.setMag(1/(mouse.mag()*mouse.mag()));
    //  mouse.mult(scl);
    mouse.normalize();
    mouse.mult(scl);
    vel.add(mouse);
    vel.limit(limit);
    } else {
    vel.mult(0.999);
    }
    
    loc = loc.add(vel);
  }

  void display() {
    strokeWeight(1);
    noStroke();
  //  stroke(255,255,255,150);
    fill(255,255,255,50);
   // line (prevLoc.x, prevLoc.y, loc.x, loc.y);
    ellipse(loc.x, loc.y, size, size);
  }
}
