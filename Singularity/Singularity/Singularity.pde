int amount = 300;
int opacity = 200;
ArrayList<Particle> particles;
Field flow;

void setup() {
  fullScreen();
  frameRate(60);
  background(255);
//  smooth(0);
  flow = new Field(100);
  particles = new ArrayList<Particle>();
  for (int i = 0; i<amount; i++) {
    particles.add(new Particle());
  }
  for (Particle p : particles) {
   for (int i = 0; i<1000; i++) {
     p.flowFollow(flow);
    p.update();
   }
  }
}

void draw() {
  //noStroke();
 // background(0);
  fill(0,0,0,150);
  
  rect(0,0,width,height);
  
  
//  flow.init();

//  noStroke();

  for (Particle p : particles) {
    p.flowFollow(flow);
    p.update();
    p.display();
  }
} 
