class Object {
  color c;
  float x;
  float y;
  float r;
  float speed;
  float l;


  Object(color tc, float tx, float ty, float tr, float tspeed) {  
    c=tc;
    x=tx;
    y=ty;
    r=tr;
    speed = tspeed;
  }
  Object(color tc, float tx, float ty, float tr, float tspeed, float tl) {  
    c=tc;
    x=tx;
    y=ty;
    r=tr;
    speed = tspeed;
    l=tl;
  }

  void circle() {
    strokeWeight(1);
    fill(c);
    ellipse(x, y, r, r);
  }
  void rectangle() {
    fill(c);
    rectMode(CENTER);
    strokeWeight(l);
    rect(x, y, r, r);
  }
  void move () {
    x = x+speed;
  }

  float bounce () {
    if (x+r/2 >= width || x-r/2 <= 0) { 
      speed = -speed;
    }
    return speed;
  }

  float mouseMoveX () {
    if (mousePressed) {
      x=mouseX;
    }
    return y ;
  }
  float mouseMoveY () {
    if (mousePressed) y=mouseY;
    return y;
  }


  void collision (Object object, color newColor_) {
    if (dist(this.x, this.y, object.x, object.y) < this.r/2 + object.r/2) {
      this.c = newColor_;
    } //else {
    //this.c = initialC;
    //}
  }
  void mouseControl () {
    x = mouseX;
    y = mouseY;
  }
}
