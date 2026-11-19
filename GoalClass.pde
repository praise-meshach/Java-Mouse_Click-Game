class Goal
{
  float x, y, size;
  
  PImage GoalImage;
  
  Goal(float x, float y, float size, PImage GoalImage){
    
    this.x = x;
    this.y = y;
    this.size = size;
    this.GoalImage = GoalImage;
  }
  void display(){
    
    imageMode(CENTER);
    image(GoalImage, x,y, size,size);
  
  }
    
    boolean IfGoalCapture(Enemy enemy){
    
     float a = sq(this.x - enemy.x);
     float b = sq(this.y - enemy.y);

    
    float c = sqrt(a+b);

    
    return (c < (size /2));
       
}
}
