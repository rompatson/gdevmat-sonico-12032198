Walker[] walkers = new Walker[10];
PVector wind = new PVector(0.2, 0);
//PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  int posY = 0;
  for (int i = 0; i < walkers.length; i++)
  { 
  posY = 2 * (Window.windowHeight / 10) * (i - 5);
  walkers[i] = new Walker(random(1,10));
  walkers[i].position = new PVector(-400, posY);
  walkers[i].setRandomGaussianColor(100,200);
  walkers[i].scale = walkers[i].mass * 15;
  }
  
}

void draw()
{
  background(0);
  for (int i = 0; i < walkers.length; i++)
  {
    
  float mew = 0;
  mew = 0.01f;

  if (walkers[i].position.x >= 0)
  {
  mew = 0.4f;
  }
  
  float normal = 1;
  float frictionMagnitude = mew * normal;
  PVector friction = walkers[i].velocity.copy();
  friction.mult(-1);
  friction.normalize();
  friction.mult(frictionMagnitude);
  walkers[i].applyForce(wind);
  walkers[i].applyForce(friction);
  //PVector gravity = new PVector(0, -0.15 * walkers[i].mass);
  walkers[i].render();
  walkers[i].update();
  //walkers[i].applyForce(gravity);
  
  if (walkers[i].position.y <= Window.bottom)
  {
    walkers[i].position.y = Window.bottom;
    walkers[i].velocity.y *= -1;
  }
   
  if (walkers[i].position.x >= Window.right)
  {
    walkers[i].position.x = Window.right;
    walkers[i].velocity.x *= -1;
  }
  
  if(mousePressed)
  {
    walkers[i].position.x = -400;
  }
  
  }
  
}
