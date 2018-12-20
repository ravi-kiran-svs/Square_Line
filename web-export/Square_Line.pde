int x, screen=0, score;
int playerSpeed, gameSpeed;
boolean dir;  //dir == true  =>right move  =>x++;
boolean touch;
obs[] a;

void setup()  {
  fullScreen();
  orientation(PORTRAIT);
  frameRate(60);
  playerSpeed = width/60;
  gameSpeed = width/30;
  a = new obs[4];
  for  (int i=0; i<4; i++)  {  a[i] = new obs();  }
  
  rectMode(CENTER);
  textAlign(CENTER);
  noStroke();
  noFill();
}

void draw()  {
  translate(width/2,height/2);
  if  (screen == 0)  screen0();
  if  (screen == 1)  screen1();
  if  (screen == 2)  screen2();
}

void mousePressed()  {
  if  (screen == 0)  {
    if  (mouseX > width/10 && mouseX < 9*width/10 &&
    mouseY > 9*height/14-height/20 && mouseY < 9*height/14+height/20)
    {  x=-9*width/20;  dir = true;  screen = 2;  score = 0;  }
  }
  
  if  (screen == 1)  {
    if  (mouseX > width/10 && mouseX < 9*width/10 &&
    mouseY > 9*height/14-height/20 && mouseY < 9*height/14+height/20)
    {  x=-9*width/20;  dir = true;  screen = 2;  score = 0;  }
    
    if  (mouseX > 13*width/20 && mouseX < 17*width/20 &&
    mouseY > 11*height/14-height/20 && mouseY < 11*height/14+height/20)
    {  screen = 0;  }
  }
  
  if  (screen == 2)  {
    touch = true;
  }
}

void mouseReleased()  {
  if  (screen == 2)  {
    touch = false;
  }
}
void bound()  {
  background(255);
  fill(0);
  noStroke();
  rect(0,0,width-width/20,height-width/20,width/20);
}
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
    }
    
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
void screen0()  {
  bound();
  textSize(width/4);
  fill(255);
  text("Square" + "\n" + "Line",0,-height/3);
  textSize(width/24);
  fill(125);
  text("Developed by RK",0,0);
  textSize(width/18);
  fill(150);
  text("Beat me:",width/5,height/20);
  noFill();
  stroke(255);
  rect(0,height/7,width-width/5,height/10,width/10);
  textSize(width/9);
  fill(255);
  text("Play!",0,height/7+height/50);
  noFill();
  stroke(50);
  rect(0,2*height/7,width-width/5,height/10,width/10);
  textSize(width/9);
  fill(50);
  text("Lite",0,2*height/7+height/50);
}

void screen1  ()  {
  bound();
  textSize(width/4);
  fill(255);
  text("HA!HA!" + "\n" + "HA!HA!",0,-height/3);
  textSize(width/24);
  fill(200);
  text("Score:" + score,width/4,-height/20);
  textSize(width/24);
  fill(125);
  text("Developed by RK",0,0);
  noFill();
  stroke(255);
  rect(0,height/7,width-width/5,height/10,width/10);
  textSize(width/9);
  fill(255);
  text("Touch here",0,height/7+height/50);
  noFill();
  stroke(50);
  rect(-width/6,2*height/7,2*width/5,height/10,width/20);
  textSize(width/9);
  fill(50);
  text("Lite",-width/6,2*height/7+height/50);
  noFill();
  stroke(255);
  rect(width/4,2*height/7,width/5,height/10,width/20);
  textSize(width/18);
  fill(255);
  text("back",width/4,2*height/7+height/80);
  
  for  (int i=0; i<4; i++)  {  a[i].dead();  }
}

void screen2()  {
  bound();
  fill(255);
  ellipse(x,height/4,width/36,width/36);
  
  if  (score >= 0)    a[0].display(0);
  if  (score >= 10)   a[1].display(2*int(height/4 + width/14.4));
  if  (score >= 20)   a[2].display(int(height/4 + width/14.4));
  if  (score >= 40)   a[3].display(3*int(height/4 + width/14.4));
  
  stroke(255);
  if  (x <= -9*width/20)  dir = true;
  else if  (x >= 9*width/20)  dir = false;
  
  if  (touch)  {  line(x,height/4,x,height/4+25);  }
  else  {
    if  (dir)  {  line(x,height/4,x-25,height/4);  x+=playerSpeed;  }
    else  {  line(x,height/4,x+25,height/4);  x-=playerSpeed;  }
  }
  
  textSize(width/20);
  fill(0);
  rect(width/4,-2*height/5,width/3,height/20,width/20);
  fill(255);
  text("Score:" + score,width/4,-2*height/5+height/100);
}

void screen3()  {
  
}