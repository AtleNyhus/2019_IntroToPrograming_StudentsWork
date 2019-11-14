class Scoreboard {
  float textsize;
  color textcolor;
  float x;
  float y;
  float xn;
  float yn;


  Scoreboard(float temp_textsize, color temp_textcolor, float temp_x, float temp_y, float temp_xn, float temp_yn) {
    textsize = temp_textsize;
    textcolor = temp_textcolor;
    x = temp_x;
    y = temp_y;
    xn = temp_xn;
    yn = temp_yn;
  }

  void display (int scorenumber, String word) {
    textSize(textsize);
    fill(textcolor);
    text(word, xn, yn);
    text(scorenumber, x, y);
  }
}
