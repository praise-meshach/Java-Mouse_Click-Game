class Enemy

{
  float x = random(width);
  float y=10;
  float size = 50;
  float speedY = 2;

// Animastion variable
float Frame = 0;
float FrameDelay = 8;

  Enemy( float y, float size)
  {
    this.y = y;
    this.size = size;
    //this.x= x;
  }

  void Update() {

    Display();
    Move(450, 950);
    
    ifOffEdge();
  }

  void Move(float positionx, float positiony)
  {// calculates distance toward trhe goal position
    float px = positionx - x;
    float py = positiony - y;

    //uses pythagerous theroum to calculate the distance between the enemy and goal
    float distanceToPosition = sqrt((px*px)+ (py*py));

     // normilise direction of vector to the goal.
    if (distanceToPosition >0) {

      px /= distanceToPosition;

      py /= distanceToPosition;
        
       //make the speed random towards the goal.
      x += px* random(1, speedY);
      y += py * random(1, speedY);
    }
  }


  void Display() {
    
    if(EnemyImage1 == null) return;
    
    if (frameCount % FrameDelay == 0){
    
      Frame = (Frame + 1) % 3;
    }
    if (Frame == 0){
    
       image(EnemyImage1, x,y);
    }
    else if (Frame == 1){
   
      image(EnemyImage2, x,y);
    }
    else{
      
    image(EnemyImage3, x,y);
      
    }

  }
  
  void ifOffEdge(){
  
    if(x < -size || x> width + size || y< -size || y > height + size){
    
      y = -size;
      x= random(width);
    
    }
  
  }

  boolean MouseClick() {

    float check = dist(mouseX, mouseY, x, y);

    if (check <= size/2)
    {
      return true;
    }
    return false;
  }
}
