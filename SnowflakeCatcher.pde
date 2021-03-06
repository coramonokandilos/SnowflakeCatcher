SnowFlake [] snowflakes;

void setup()
{
  size(400, 400);

  background(0);
  snowflakes = new SnowFlake[300];
  for (int i = 0; i < snowflakes.length; i++)
  {
    snowflakes[i] = new SnowFlake();
  }
}
void draw()
{

  for( int j = 0; j < snowflakes.length; j++)
  {
    snowflakes[j].erase();
    snowflakes[j].lookDown();
    snowflakes[j].move();
    snowflakes[j].wrap();
    snowflakes[j].show();
  }
}
void mouseDragged()
{
  if(mouseButton == RIGHT)
  {
    fill(0);
  }
  else
  {
    stroke(0,255,0);
    fill(0, 255, 0);
  }
  ellipse(mouseX, mouseY, 10, 10);

  
}

class SnowFlake
{
  int myX, myY;
  boolean isMoving;
  SnowFlake()
  {
    myX = (int)(Math.random()*401);
    myY = (int)(Math.random()*401);
    isMoving = true;
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(myX, myY, 7, 7);
  }
  void lookDown()
  {
    if (myY > 0 && myY < 395 && get(myX, myY + 5) != color(0, 0, 0))
    {
      isMoving = false;
    }
    else 
    {
      isMoving = true;
    }
  }
  void erase()
  {
    noStroke();
    fill(0);
    ellipse(myX, myY, 10, 10);
  }
  void move()
  {
    if (isMoving == true)
    {
      myY = myY + 1;
    }
  }
  void wrap()
  {
    if(myY > 400)
    {
      myY = 0;
      myX = (int)(Math.random()*401);
    }
  }
}
