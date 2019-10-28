class Object {
  float x;
  float y;
  //float r;
  int petals;
  float speedx;
  color circlecolor;
  color petalcolor;
  color flowercentercolor;

  // Constructer for the flower
  Object(int tpetals, float tspeedx, color tpetalcolor, color tflowercentercolor) {

    // x=tx;
    // y=ty;
   // r=tr;
    petals=tpetals;
    speedx = tspeedx;
    petalcolor = tpetalcolor;
    flowercentercolor = tflowercentercolor;
  }
  //Constructor for the circle
  // Object(float tx, float ty, float tr, color tcircleocolor) {
  //   x=tx;
  //   y=ty;
  //   r=tr;
  //   circlecolor = tcircleocolor;
  //}



  void flower(float x, float y, float r) {
    float ballX;
    float ballY;
    fill(petalcolor);
    //This code draws the shape of the flower - Based on the code from "FlowerFunctionParameters"
    for (float i=0; i<PI*2; i+=2*PI/petals) { //draw "petals" amount of small petals. 
      ballX=r*cos(i);
      ballY=r*sin(i);
      ellipse(x+ballX, y+ballY, r, r);
    }
    fill(flowercentercolor);
    ellipse(x, y, r*1.2, r*1.2); //draws flower center
  }

  void circle() {
    stroke(0);
    fill(circlecolor);
    ellipse(x, y, r, r);
  }

  void move() {
    x = x + speedx;
    // y = y + speedy;
    if (x >= width-r || x <= 0+r) {
      speedx = -speedx;
    }
  }

  void mouseControl () {
    x = mouseX;
    y = mouseY;
  }

  void bounce() {
    if (x >= width || x <= 0) x = -x;

    if (y >= height || y <= 0) y = -y;
  }
}
