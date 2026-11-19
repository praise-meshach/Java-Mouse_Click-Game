class Enemy2 extends Enemy {

  
  PImage enemy2Img1;
  PImage enemy2Img2;
  PImage enemy2Img3;

  Enemy2(float y, float size,
             PImage img1, PImage img2, PImage img3) {

    super(y, size);

    enemy2Img1 = img1;
    enemy2Img2 = img2;
    enemy2Img3 = img3;

    speedY = 3;
  }


  void Display() {

    if (frameCount % FrameDelay == 0) {
      Frame = (Frame + 1) % 3;
    }

    if (Frame == 0) {
    image(enemy2Img1, x, y);
    } 
    else if (Frame == 1) {
      image(enemy2Img2, x, y);
    } 
    else {
      image(enemy2Img3, x, y);
    }
  }
  boolean TouchMouse(){
  float d = dist(mouseX, mouseY, x,y);
  return d < size/2;
  
  }
}
