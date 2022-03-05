Mover blackhole;
ArrayList<Mover> matters = new ArrayList<Mover>();
int noMatters = 125;
float speed = 9;

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  blackhole = new Mover(50);
  respawn();
}


void draw()
{
  background(0);
  if(allReached())
  {
   respawn(); 
  }
  for(int i=0; i<matters.size(); i++)
  {
    matters.get(i).moveToTarget(speed);
    matters.get(i).render();
  }
  blackhole.render();
}

void respawn()
{
  blackhole.setRandomPerlinPosition(Window.left,Window.right,Window.bottom,Window.top);
  matters.clear();
  for(int i=0; i<noMatters; i++)
  {
   Mover matter = new Mover();
   matter.setRandomGaussianPosition(Window.left*0.4,Window.right*0.4,Window.bottom*0.4,Window.top*0.4);
   matter.setRandomGaussianColor(100,200);
   matter.setRandomGaussianScale(8,24);
   matter.setTarget(blackhole.getPosition());
   matters.add(matter);
  }
  
}

boolean allReached()
{
  boolean ret = true;
  for(int i=0; i<matters.size(); i++)
  {
    if( matters.get(i).reached==false )
    {
     ret = false;
     break;
    }
  }
  return ret;
}
