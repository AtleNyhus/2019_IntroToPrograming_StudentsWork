color background = color(200);
Object myCircle;
Object myRect;

//Cirle Variables
color cColor = color(0, 0, 255);
float cX = 100;
float cY = 100;
float cR = 120;
float cSpeedX = 7;
float sLine = 10;

color newColor;

// rect variables
color rColor = color(0, 255, 0);
float rX = 600;
float rY = 600;
float rR = 300;
float rSpeedX = 4;

void setup () {
  size(800, 800);
  myCircle = new Object(cColor, cX, cY, cR, cSpeedX);
  myRect = new Object(rColor, rX, rY, rR, rSpeedX, sLine);
}

void draw () {
  background(background);
newColor = color(random(0, 255), random(0, 255), random(0, 255));


  myCircle.circle();
  myCircle.move();
  myCircle.bounce();
  myCircle.mouseMoveX();
  myCircle.mouseMoveY();
  myCircle.collision(myRect, newColor);

  myRect.rectangle();
  myRect.move();
  myRect.bounce();
}
