class Player {

  float x;
  float y;
  color playercolor;
  float r;
  float sx;
  float sy;

  Player(float temp_x, float temp_y, color temp_playercolor, float temp_r, float temp_sx, float temp_sy) {
    x = temp_x;
    y = temp_y;
    playercolor = temp_playercolor;
    r = temp_r;
    sx = temp_sx;
    sy = temp_sy;
  }


  void display () {    
    fill (playercolor);
    ellipse(x, y, r, r); // draws an ellipse. 
    x = x+sx;
    y = y+sy;
    if (x >= width || x <= 0) { // Makes the ball bounce on the X-axis
      sx = sx +random(-1, 1);
      sx = -sx;
    }
    if (y >= height || y <= 0) { // Makes the ball bounce on the Y-axis
      sy = sy + random(-1, 1);
      sy = -sy;
    }
  }

  void collision (Player player) {
    if (dist(this.x, this.y, player.x, player.y) < this.r/2 + player.r/2) { // Calculates if collision is happening. 
      fill(player_loose);
      ellipse(player.x, player.y, player.r, player.r); //This gives visual feedback that you have lost the game. 

      for (int i = 0; i < obstacles.length; i++) { //This for loop set every Enemy.active to false, thus not letting them be displayed.
        obstacles[i].active = false; 
      }
      score = 0;
    }
  }

  void score (Player scoreball) {
    if (dist(this.x, this.y, scoreball.x, scoreball.y) < this.r/2 + scoreball.r/2) {// Calculates if collision is happening. 
      score ++; // adds to score
      scoreball.x = random(0, width); // Spawns new scoreball
      scoreball.y = random(0, height);

      activateObstacle(); // Sets a new Enemy.activate to true. 
    }
  }
}

//Credit til Nicolai for at lære mig hvordan man extender en class, og hvordan man bruger "super"
class Enemy extends Player { // an extension of the Player class. 
  boolean active;

  Enemy(float temp_x, float temp_y, color temp_playercolor, float temp_r, float temp_sx, float temp_sy) {
    super (temp_x, temp_y, temp_playercolor, temp_r, temp_sx, temp_sy);
  }

  void display() {
    if (!active) return; // returns null instead of .display if activate = false. 
    super.display(); //Calls the same .display function of the Player class. 
  }

  void collision(Player _player) { // same as display, but with collision. 
    if (!active) return;
    super.collision(_player);
  }
}
