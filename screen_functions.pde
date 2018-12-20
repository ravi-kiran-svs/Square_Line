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
  text("Score:" + score,width/4,-2*height/5+height/100); //<>//
}

void screen3()  {
  
}