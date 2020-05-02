class Particle {
  PVector loc;
  PVector prevLoc;
  PVector vel;
  PVector prevVel;
  PVector mouse;
  PVector colour;
  PVector explVect;
  float scl = 0.7;
  float slowScl = 0.0007;
  int maxLimit = 10;
  int minLimit = 5;
  int limit;
  int speed;
  int mousePressLimit=10;
  float size;
  int inc;
  int age;
  int life;
  int maxLife = 100;
  float maxOpacity;
  float jitterDefault = 0.1;
  float jitter = 0.1;
  float explFactor = 0.55;
  float explPush = 2;
  int explMult = 3000;
  int explCalc = 0;
  int explLimit = 60;

  Particle() { 
    prevVel=new PVector(0, 0);
    init();
  }

  void init() {
    explVect=new PVector(0, 0);
    limit = int(random(minLimit, maxLimit));
    speed = limit;
    maxOpacity=random(240, 250);
    age=0;
    size=4;
    life=parseInt(random(10, maxLife));
    inc=1;
    colour = new PVector(255, random(0, 256), 255);
    loc = new PVector(random(0, width), random(0, height));
    prevLoc = loc.copy();
    vel = prevVel.copy();
    mouse = new PVector(mouseX, mouseY);
    mouse = mouse.sub(loc);
    mouse.normalize();
    vel.limit(limit);
  }

  void mature() {
    if (dist(loc.x, loc.y, width/2, height/2)<100) {
     init(); 
    }
    age+=inc;
    size+=(0.03*inc);
    if (age>life) {
      inc=-1;
    } else if (age==-1) {
      prevVel=vel.copy();
      init();
    } 

    if (mousePressed) {
      if (random(0, 100)<50 && limit>minLimit) {
        limit--;
      } else if (limit<maxLimit) {
        limit++;
      }
    }
  }

  void update() {
    float distance = dist(mouseX, mouseY, loc.x, loc.y);
    saveLocation();
    if (mousePressed) {
      explVect=new PVector(0, 0);
      mouse = new PVector(mouseX, mouseY);
      mouse = mouse.sub(loc);
      //mouse.mult(1/(mouse.mag()*1.5));
      mouse.normalize();
      if (mouseButton==LEFT && mouseButton==RIGHT) { // I GUESS THIS IS NOT WORKING
        explCalc=explLimit+1;
      } else if (mouseButton==LEFT) {
        mouse.mult(scl);
        //mature();
        //if (random(0, 100)<50 && life<maxLife) {
        //  life++;
        //}

        vel.add(mouse);
        vel.limit(mousePressLimit);

        loc.add(vel);

        edges();
        mouse.normalize();
      } else { //IF MOUSEBUTTON = RIGHT       
        jitter+=0.001;
        explCalc++;

        if (random(0, 10)<3) {
          mature();
        }
        vel.add(PVector.random2D().mult((0.05+jitter*jitter)*map(distance, 0, width, 1, 0)));
        // mouse.mult(-slowScl);
        //loc.add(mouse);
        loc.add(vel.mult(0.8));
        edges();
        //loc.add(PVector.random2D().mult(jitter));
        //mouse.normalize();
        // loc.add(mouse.mult(slowScl*100));
      }
    } else { // IF MOUSE NOT PRESSED (DEFAULT STATE)
      //   if (explCalc>explLimit) { // EXPLOSION MECHANICS
      if (explCalc>explLimit) { // EXPLOSION MECHANICS
        //vel.add(PVector.random2D().mult(explMult));
        //explVect=PVector.random2D().mult(explMult);

        explVect=PVector.random2D().mult((1/distance)*explMult);
        explVect.add(mouse.copy().mult(-explPush));
        explCalc=0;


               if(distance<width/5) {  // DISTANCE TO KILL THE PARTICLE IN EXPLOSION
                inc=-1;  
               }
      } else {
        explCalc=0;
      }

      if (jitter>jitterDefault) {
        jitter=jitterDefault;
      }

      if (random(0, 10)<2) {
        mature();
        //vel.add(PVector.random2D().mult(0.2));
      }
      

      vel.add(mouse.mult(0.9));
      if (explVect.mag()>10) {
      vel.add(explVect.mult(explFactor));
      }
      //loc.add(vel.add(PVector.random2D().mult(jitter*jitter)));
      loc.add(vel);
      edges(); //checks for particle offscreen
    }


    // EVERYTIME THINGS
  }

  void saveLocation() {
    prevLoc.set(loc.x, loc.y);
  }

  void flowFollow(Field flow) {
    if (!mousePressed) {
      vel.add(flow.checkGrid(loc));
      vel.limit(limit);
    }
  }

  void edges() {
    if (loc.x<0-(size*2)) {
      loc.x=width+(size*2);
      if (mouseButton==RIGHT) {
        init();
      }
      saveLocation();
    } 
    if (loc.x>width+(size*2)) {
      loc.x=0-(size*2);
      if (mouseButton==RIGHT) {
        init();
      }
      saveLocation();
    } 
    if (loc.y<0) {
      loc.y=height;
      if (mouseButton==RIGHT) {
        init();
      }
      saveLocation();
    } 
    if (loc.y>height) {
      loc.y=0;
      if (mouseButton==RIGHT) {
        init();
      }
      saveLocation();
    }
  }

  void display() {
    strokeWeight(size-1);
    strokeCap(SQUARE);
    //if (mouseButton==RIGHT) {
   //   strokeCap(ROUND);
    //}
    stroke(colour.x, colour.y, colour.z, map(age, 0, life, 0, maxOpacity));
    fill(colour.x, colour.y, colour.z, map(age, 0, life, 0, maxOpacity));
    //  if (vel.mag()<=mousePressLimit) {
        line (prevLoc.x, prevLoc.y, loc.x, loc.y);
    //  }

    noStroke();
   //noFill();
    ellipse(loc.x, loc.y, size, size);
    //ellipse((loc.x+prevLoc.x)/2, (loc.y+prevLoc.y)/2, size, size);
  }
}
