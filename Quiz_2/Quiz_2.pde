void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker();

void draw()
{
  int call = int(random(2));
  println(call);
  
  if (call == 0)
  {
    myWalker.randomWalk();
  }
  
  else if (call == 1)
  {
  myWalker.randomWalkBiased();
  }
  
  myWalker.render();
}
