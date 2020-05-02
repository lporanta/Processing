int count = 0;
int limit = 300;
int time = 0;
boolean mode = true;
boolean fail = false;

void setup() {
  fullScreen();
  frameRate(60);
}

void draw() {
  if (mode) {
    if(count<limit) {
      fail = false;
      write("Venaa viel...");
      } else {
      write("Ny!");
      if (count==limit) {
      time = millis();
      }
      } 
      count++;
  } else if (fail) {
    write("Eipäs hötkyillä!");
  }
    else {
      write(time + " ms");
  }
}

void mousePressed() {
  time = millis()-time;
  mode = !mode;
  if (count<limit) {
  fail = true;
  }
  count = 0;
}

void write(String a) {
background(0);
fill(255);
textSize(width/30);
textAlign(CENTER, CENTER);
text(a, width/2, height/2);
}
