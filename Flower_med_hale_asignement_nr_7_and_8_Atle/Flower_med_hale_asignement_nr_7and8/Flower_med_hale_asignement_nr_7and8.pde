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
{ 
  x[0] = 100;
} //Sets the flowers starting position
int [] y = new int [index];
{ 
  y[0] = 100;
}

int yspeed = 5; 
int xspeed = 4;


//variables to the seond tail
int num = 60; 
int[] x_ = new int[num];
int[] y_ = new int[num];
int indexPos = 0;
color circleColour = color(200,200,50);
float opSpeed = 5; //sets the speed of tunring opaque. 

void setup () {
  size(1000, 700);
}

void draw () {
  background(0);

  myFlower = new Object(petals, 0, colorP, colorC);


  // Thank you to Processing tutorial 
  for (int i = index-1; i > 0; i--) { // Shifts all the x[i] values down one step
    x[i] = x[i-1]; 
    y[i] = y[i-1];
  }
  // Sets the speed, and makes sure it bounces. 
  y[0] = y[0] + yspeed;
  x[0] = x[0] + xspeed;
  if (y[0] >= height || y[0] <= 0) yspeed = - yspeed;
  if (x[0] >= width || x[0] <= 0) xspeed = - xspeed;


  for (int i = 0; i < index; i++) {
    float m = map(x[i], 100, 255, 0, index*2); //sets the opaqu by using the map function
    myFlower.flower(x[i], y[i], i/2, m); //Draws the flowers
  }


  // The second object with tail
  //sets current indexPos x and y to the mouse. 
  x_[indexPos] = mouseX; 
  y_[indexPos] = mouseY;
  indexPos = (indexPos+1) % num; // cycles indexPos to num. When it hits num, sets it to 0. 
  for (int i = 0; i < num; i++) { //standard for-loop
    int pos = (indexPos + i) % num; // pos = cycles through all the places in the aray (same as above), from the indexPos, instead of from 0. 
    float radius = (num-i); //set the radi acoarding to num and i
    fill(circleColour, i*opSpeed); // controls the color and opaquecity
    ellipse(x_[pos], y_[pos], radius, radius); //Draws all the circles. 
  }
}
