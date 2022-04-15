Walker[] walkers = new Walker[100];

void setup()
{
  
  //for some reason this size works??? 
  size(640, 360, P3D);
  
  //camera makes it worse for some reason
  //camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    walkers[i].setRandomGaussianScale(8,24);
  }
}


void draw()
{
 background(0);
 
 for(int i = 0; i < walkers.length; i++)
 {
 walkers[i].update();
 walkers[i].render();
 walkers[i].checkEdges();
 }
 
}


 
