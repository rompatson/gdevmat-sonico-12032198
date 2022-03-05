void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

Walker myWalker = new Walker();

void draw()
{
  
  int call = int(random(2));
  println(call);
  
  if (call == 0)
  {
    myWalker.randomWalk();
    myWalker.moveAndBounce();
  }
  
  else if (call == 1)
  {
    myWalker.randomWalkBiased();
    myWalker.moveAndBounce();
  }
  
  myWalker.render();
   
}
