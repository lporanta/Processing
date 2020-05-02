class infoCircle {
  PVector[] locations;
  PVector[] signLocations;
  int locationAmount = 150;
  float radius = 60;
  int counter = 0;
  int drawUntil = 0;
  PVector sign;
  float sinOff = HALF_PI;
  float sinOffInc = 0.02;

  infoCircle() {
    locations = new PVector[locationAmount];
    float angle = 0;
    for (int i = 0; i<locationAmount; i++) {  //SAVE LOCATIONS FOR THE CIRCLE
      locations[i]=(new PVector(radius*cos(angle), radius*sin(angle)));
      angle+=(PI+HALF_PI)/locationAmount;
      
    }
    //SAVE LOCATIONS FOR THE SIGN
    
    signLocations = new PVector[3];
    sign = new PVector(radius/2, -radius/2);
    signLocations[0] = sign.copy();
    signLocations[1] = sign.copy().mult(2);
    signLocations[2] = signLocations[1].copy().add(new PVector(2*radius, 0));
  }
  
  void init() {
    counter=0;
    drawUntil=0;
  }

  void update() {
    if(mousePressed) {
    sinOff+=sinOffInc;
    counter+=2;   
    if (counter<locationAmount) {
      drawUntil = int(locationAmount*sin(map(counter, 0, locationAmount, 0, HALF_PI)));
    }
    } else {
     init(); 
    }
  }

  void display() {
    //stroke(255,255,255,map(drawUntil, 0, locationAmount, 0, 100));
    stroke(255,255,255,map(sin(sinOff),-1,1,0,30));
    translate(mouseX, mouseY);
    beginShape();  //STARTS THE INFOCIRCLE
    int i = 0;
    for (PVector p : locations) {
      if (i==drawUntil) {
        break;
      }
      
  //  if (i<(locationAmount/2)) {
 //      line(signLocations[0].x,signLocations[0].y,signLocations[1].x,signLocations[1].y);
  //      line(signLocations[1].x,signLocations[1].y,signLocations[2].x,signLocations[2].y);
  //      line(signLocations[0].x,signLocations[0].y,lerp(signLocations[0].x,signLocations[1].x, i/(locationAmount/2)),lerp(signLocations[0].y,signLocations[1].y, i/(locationAmount/2)));
  //  }
      
      curveVertex(p.x, p.y);
      i++;
    }
    endShape(); //INFOCIRCLE DRAWING ENDS HERE
        
      if(drawUntil>0) {
//         textSize(10);
//     text(mouseX + ", " + mouseY, signLocations[1].x,signLocations[1].y-5);
  //  beginShape();
 //   vertex(signLocations[0].x,signLocations[0].y);
   // vertex(lerp(signLocations[0].x,signLocations[1].x, drawUntil/locationAmount),lerp(signLocations[0].y,signLocations[1].y, drawUntil/locationAmount));
 //   vertex(signLocations[1].x,signLocations[1].y);
 //   vertex(signLocations[2].x,signLocations[2].y);
//    endShape();
    
    translate(-mouseX,-mouseY);
    
    line(mouseX, 0, mouseX, height);
    line(0, mouseY, width, mouseY);
       }
    
  }
}
