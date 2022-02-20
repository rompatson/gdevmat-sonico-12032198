class Walker
{
  float x;
  float y;
  
  void render()
  {
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    int a = int(random(50, 100));
    color randColor = color (r, g, b, a);
    fill(randColor);
    stroke(randColor);
    circle(x, y, 30);
  }
  
 
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0)
    {
      y++;
    }
    else if (rng == 1)
    {
      y--;
    }
    else if (rng == 2)
    {
      x++;
    }
    else if (rng == 3)
    {
      x--;
    }
    if (rng == 4)
    {
      y++;
      x++;
    }
    else if (rng == 5)
    {
      y++;
      x--;
    }
    else if (rng == 6)
    {
      y--;
      x++;
    }
    else if (rng == 7)
    {
      y--;
      x--;
    }
   
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(4));
    
    if (rng == 0)
    {
      y+= 20;
    }
    else if (rng == 1)
    {
      y-= 10;
    }
    else if (rng == 2)
    {
      x+= 10;
    }
    else if (rng == 3)
    {
      x-= 10;
    }
  }

}
