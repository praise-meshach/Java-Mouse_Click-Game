PImage BackgroundImage, GoalImage, EnemyImage1, EnemyImage2, EnemyImage3;
PImage enemy2_1, enemy2_2, enemy2_3;

// global variables
int playerLife = 10;

boolean gameOver = false;
boolean gameLost = false;

int score = 0;
int highscore = 0;

String highScoreFile = "highscore.txt";

//Array used to display multiple enememies

Enemy[] enemies;

int enemyCount = 12;

//creates goal
Goal goal;

void setup()
{
  
  size(900, 800);
  
  
  BackgroundImage = loadImage("Background.jpg");
  BackgroundImage.resize(900,800);
  
  loadHighScore();
 

  EnemyImage1 = loadImage("Crow1.png");
  EnemyImage1.resize(50,50);
  EnemyImage2 = loadImage("Crow2.png");
  EnemyImage2.resize(50,50); 
  EnemyImage3 = loadImage("Crow3.png");
  EnemyImage3.resize(50,50);
  
  enemy2_1 = loadImage("Wasp1.png");
  enemy2_1.resize(50,50);
  enemy2_2 = loadImage("Wasp2.png");
  enemy2_2.resize(50,50);
  enemy2_3 = loadImage("Wasp3.png");
  enemy2_3.resize(50,50);
  
  imageMode(CENTER);

  enemies = new Enemy[enemyCount];
  
   for (int i = 0; i < enemies.length; i++) {
     
     if(i % 2 ==0 ){
       //Crow
       enemies[i] = new Enemy(10, 50);}
       else{
         //wasp
    enemies[i] = new Enemy2(-i * 100, 50, enemy2_1, enemy2_2, enemy2_3);
  }
   }
  
  
  
  GoalImage = loadImage("Corn.png");

  goal = new Goal(450, 700, 150, GoalImage);
  
  
}


void draw()
{
  
  if(gameOver){
  showGameOverMessg();
  return;
  }
  
  
  if (gameLost){
    showLoseMessg();
    return;
  }
  
  background(BackgroundImage);
  displayLifeScore();
  
  if (playerLife <= 0){
  gameOver = true;
  checkHighScore();
  saveHighScore();
  return;
 }
  
  if (goal != null) {
      goal.display();
    }

  for (int i= 0; i< enemies.length; i++)
  {
    enemies[i].Update();
    
      if (goal != null && enemies[i] instanceof Enemy&& !(enemies[i] instanceof Enemy2)&& goal.IfGoalCapture(enemies[i]))
      {
        gameLost = true;
        checkHighScore();
        saveHighScore();
        return;
      }
    
    
    if (enemies[i] instanceof Enemy2) {
      
    Enemy2  enemy2 = (Enemy2) enemies[i];
    
    if (enemy2.TouchMouse()){
    
      playerLife = playerLife - 1;
      
      enemy2.x = random(width);
      enemy2.y = - enemy2.size;
    }
  }
   
}
}


void displayLifeScore(){
 
  fill(255);
  textSize(20);
  textAlign(LEFT, TOP);
  text("Life: "+ playerLife,20,20 );
  text("Score: "+ score,20,50 );
  text("High Score: "+ highscore,20,80 );

}

void showGameOverMessg(){

  background(0);
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("GAME OVER", width/2, height/2-20);
  
  
  textSize(20);
  text("You Score: " + score, width/2, height/2 + 20);
  text("Click to restart", width/2, height/2 + 50);

}
void showLoseMessg(){

  background(0);
  fill(0, 0, 255);
  textAlign(CENTER, CENTER);
  textSize(50);
  text("YOU LOST!", width/2, height/2-20);
  
  textSize(20);
  fill(255);
  text("You Score: " + score, width/2, height/2 + 20);
  text("Click to restart", width/2, height/2 + 50);

}


void mouseClicked(){
  
  if (gameOver || gameLost){
  
    restartGame();
    return;
  }
  
  for (int i=0 ; i< enemies.length; i++){
    
  if (enemies[i] != null && !(enemies[i] instanceof Enemy2) && enemies[i].MouseClick()) 
  {
    enemies[i] = new Enemy(10, 50);
    score += 1;
    
  }
}

}


void restartGame(){

  playerLife= 5;
  score = 0;
  gameOver = false;
  gameLost = false;
  
  goal = new Goal(450, 700, 150, GoalImage);
  
  
  for (int i = 0; i < enemies.length; i++) {
    
    if(i % 2 == 0)
    enemies[i] = new Enemy(10, 50);
    else
    enemies[i] = new Enemy2( -i * 100, 50,enemy2_1,enemy2_2,enemy2_3);
  

}
  }


void loadHighScore(){

  String[] data = loadStrings(highScoreFile);
  
  if (data != null && data.length> 0 ){
    
    highscore = int(data[0]);
  }
  else{
    highscore = 0;
  }
}

void checkHighScore(){
  if(score> highscore){
  highscore = score;
  }
}

void saveHighScore(){
   
  String[] data = {str(highscore)};
  saveStrings(highScoreFile, data);
}
