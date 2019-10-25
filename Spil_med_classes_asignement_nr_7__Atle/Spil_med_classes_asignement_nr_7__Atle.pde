int score = 0;
int highscore = 0;
color backgroundcolor = color(200);
color player_loose = color(255, 0, 100);

//player variables
Player myPlayer;
float player_x;
float player_y;
color player_color = color(0, 255, 0);
float player_r = 50;

//obstacle variables
float obstacle1_x = 100;
float obstacle1_y = 100;
color obstacle_color = color(255, 0, 0);
float obstacle1_xspeed = 3;
float obstacle1_yspeed = 3;
float obstacle_radius = 40;

//scoreboard variables
float scoreboardsize = 40;
color scoreboardcolor = color(30, 240, 250);
float scoreboardx = 140;
float scoreboardy = 50;
float scoreboardx2 = 590;
float scoretext_x = 20;
float highscoretext_x;
String scoretext = "Score: ";
String highscoretext = "Highscore: ";

//Scoreball variables
float sb_initialx = 300;
float sb_initialy = 300;
color sb_color = color(0, 255, 255);
float sb_radius = 10;

// Player obstacle1 = new Player(obstacle1_x, obstacle1_y, obstacle_color, obstacle_radius, obstacle1_xspeed, obstacle1_yspeed);
Player scoreball = new Player(sb_initialx, sb_initialy, sb_color, sb_radius, 0, 0);

//Init the scoreboards. 
Scoreboard myScoreboard;
Scoreboard myHighscore;

int nmb = 20; //Max obstacles on the screen
int obstacleIndex;
Enemy [] obstacles = new Enemy[nmb];


void setup() {
  size(640, 640);


  for (int i = 0; i < obstacles.length; i++) {
    obstacles[i] = new Enemy(random(0, width), random(0, height), obstacle_color, obstacle_radius, obstacle1_xspeed, obstacle1_yspeed);
  }

}

void draw () {
  background(backgroundcolor);

  myScoreboard = new Scoreboard(scoreboardsize, scoreboardcolor, scoreboardx, scoreboardy, scoretext_x, scoreboardy);
  myHighscore = new Scoreboard(scoreboardsize, scoreboardcolor, scoreboardx2, scoreboardy, highscoretext_x, scoreboardy); 
  myPlayer = new Player(player_x, player_y, player_color, player_r, 0, 0);
  
  player_x = mouseX;
  player_y = mouseY;
  scoreboardx2 = width-50;
  highscoretext_x = 380;
  
  //Displays "myPlayer"
  myPlayer.display();

  // Tries to access .display and .collision on all the obstacles, but fails if obstacles.activate = false.
  for (int i = 0; i < obstacles.length; i++) {  
    obstacles[i].display();
    obstacles[i].collision(myPlayer);
  }
  
  //Displays the "scoreball"
  scoreball.display();
  
  //Allows "myPlayer" to interact with "scoreball"
  myPlayer.score(scoreball);


  // Displays the scoreboards
  myScoreboard.display(score, scoretext);
  myHighscore.display(highscore, highscoretext);
  
  //Sets the highscore
  if (score > highscore) {
    highscore = score;
  }
  
  //println(obstacleIndex); // for debugging
}

void activateObstacle() { // Sets the next obstacle.activate in the array to True.
  obstacles[obstacleIndex].active = true; 
  if (obstacleIndex < obstacles.length-1) obstacleIndex++;
}
