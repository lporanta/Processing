int amount = 10000;
ArrayList<Particle> particles;

void setup() {

  fullScreen();
  frameRate(60);
   background(0);
  particles = new ArrayList<Particle>();
  for (int i = 0; i<amount; i++) {
    particles.add(new Particle());
  }
}

void draw() {
 //  background(0);
  fill(0,0,0,10);
  noStroke();
  rect(0,0,width,height);
  for (Particle p : particles) {
    p.update();
    p.display();
  }
} 
