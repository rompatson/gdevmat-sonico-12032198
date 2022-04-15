Walker[] walkers = new Walker[10];
PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walkers.length; i++)
  { 
  walkers[i] = new Walker(random(1,10));
  walkers[i].setRandomGaussianColor(100,200);
  walkers[i].scale = walkers[i].mass * 15;
  }

}

void draw()
{
  background(0);
  
  for (int i = 0; i < walkers.length; i++)
  {
  walkers[i].render();
  walkers[i].update();
  walkers[i].applyForce(wind);
  walkers[i].applyForce(gravity);
  
  if (walkers[i].position.y <= Window.bottom)
  {
    walkers[i].velocity.y *= -1;
  }
   
  if (walkers[i].position.x >= Window.right)
  {
    walkers[i].velocity.x *= -1;
  }
  
  }
  
}
