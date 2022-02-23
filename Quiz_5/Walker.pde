class Walker
{
  PVector position = new PVector();
  PVector speed = new PVector(5, 8);
  
  void render()
  {
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    int a = int(random(50, 100));
    color randColor = color (r, g, b, a);
    fill(randColor);
    stroke(randColor);
    circle(position.x, position.y, 50);
  }
  
 
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      speed.y++;
    }
    else if (rng == 1)
    {
      speed.y--;
    }
    else if (rng == 2)
    {
      speed.x++;
    }
    else if (rng == 3)
    {
      speed.x--;
    }
    if (rng == 4)
    {
      speed.y++;
      speed.x++;
    }
    else if (rng == 5)
    {
      speed.y++;
      speed.x--;
    }
    else if (rng == 6)
    {
      speed.y--;
      speed.x++;
    }
    else if (rng == 7)
    {
      speed.y--;
      speed.x--;
    }
   
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(4));
    
    if (rng == 0)
    {
      speed.y+= 20;
    }
    else if (rng == 1)
    {
      speed.y-= 10;
    }
    else if (rng == 2)
    {
      speed.x+= 10;
    }
    else if (rng == 3)
    {
      speed.x-= 10;
    }
  }
  
  void moveAndBounce()
  {
    //add speed to the current position
  position.add(speed);
  
  if ((position.x > Window.right) || (position.x < Window.left))
  {
    speed.x *= -1;
  }
  
  if ((position.y > Window.top) || (position.y < Window.bottom))
  {
    speed.y *= -1;
  }
  
  //render the circle
 
  }

}
