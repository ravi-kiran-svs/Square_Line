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