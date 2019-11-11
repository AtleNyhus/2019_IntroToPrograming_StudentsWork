Object myFlower;
Object myCircle;
int nmb = 40;
int index = 40;

float fy;
float fx;
float r = 2;
int petals = 7;
color colorP = color(60, 250, 20);
color colorC = color(200, 30, 140);


Object [] flowers  = new Object [nmb];


int [] x = new int [index];
int [] y = new int [index];
void setup () {
  size(1000, 1000);
}

void draw () {
  background(0);

  myFlower = new Object(petals, 0, colorP, colorC);


  // Thank you to Processing tutorial 
  for (int i = index-1; i > 0; i--) { // Shifts all the x[i] values down one step
    x[i] = x[i-1]; 
    y[i] = y[i-1];
  }

  x[0] = mouseX;
  y[0] = mouseY;
  fill(255, 102);
  //myFlower.flower();
  for (int i = 0; i < index; i++) myFlower.flower(x[i], y[i], i/2);
  //myFlower.move();
  //myFlower.bounce();
}
