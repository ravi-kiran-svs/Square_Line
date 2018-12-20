class obs  {
  int xPos, yPos;
  int type;
  boolean dead = true, first = true, right, scorefirst;
  
  void display  (int deviation)  {
    if  (dead)  {
      xPos = int(random(-9*width/20,9*width/20));
      
      if  (score >=  0)  type = 0;
      if  (score >=  5)  type = int(random(0,2));
      if  (score >= 20)  type = int(random(0,3));
      if  (score >= 40)  type = int(random(0,4));
      
      if  (type == 2 || type == 3)  {
        if  (int(random(0,2)) == 0)  right = true;
        else  right = false;
      }
      
      if  (first)  yPos = int(-height/2 - width/7.2 - deviation);
      else  yPos = int(-height/2 - width/7.2);
      dead = false;
    }
    
    if  (touch)  yPos+=gameSpeed;
    if  (yPos >=  height/2 + width/7.2)  {  dead = true;  score++;  }
    
    fill(255);
    
    if  (type == 0)  {
      ellipse  (xPos, yPos, width/3.6, width/3.6);
      if  (dist(x,height/4,xPos,yPos) < width/7.2 + width/72)  screen = 1;
    }
    
    else if  (type == 1)  {
      rect  ( (width/2 + xPos + width/14.4)/2, yPos, 
               width/2 - xPos - width/14.4, width/14.4, width/72);
      rect  (-(width/2 - xPos + width/14.4)/2, yPos, 
               width/2 + xPos - width/14.4, width/14.4, width/72);
      if  (abs(yPos - height/4) < width/28.8 + width/72)  {
        if  (abs(x - xPos) > width/14.4 - width/72)  screen = 1;
      }
    } //<>//
    
    if  (type == 2)  {
      ellipse  (xPos, yPos, width/3.6, width/3.6);
      if  (dist(x,height/4,xPos,yPos) < width/7.2 + width/72)  screen = 1;
      
      if  (xPos <= -9*width/20)  right = true;
      else if  (xPos >= 9*width/20)  right = false;
      if  (right)  xPos ++;
      else  xPos--;
    }
    
    else if  (type == 3)  {
      rect  ( (width/2 + xPos + width/14.4)/2, yPos, 
               width/2 - xPos - width/14.4, width/14.4, width/72);
      rect  (-(width/2 - xPos + width/14.4)/2, yPos, 
               width/2 + xPos - width/14.4, width/14.4, width/72);
      if  (abs(yPos - height/4) < width/28.8 + width/72)  {
        if  (abs(x - xPos) > width/14.4 - width/72)  screen = 1;
      }
      
      if  (xPos <= -9*width/20)  right = true;
      else if  (xPos >= 9*width/20)  right = false;
      if  (right)  xPos ++;
      else  xPos--;
    }
    
    first = false;
  }
  
  void dead()  {  dead = true;  first = true;  }
}