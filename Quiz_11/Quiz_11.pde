Walker[] bigMatter = new Walker[10];
Walker[] smallMatter = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);  
  int posX;
  for(int i = 0; i < 10; i++)
  {
  posX = 2 * (Window.windowWidth / 10) * (i - 10);
  bigMatter[i] = new Walker();
  bigMatter[i].position.x = random(-500, 500);
  bigMatter[i].position.y = random(-500, 500);
  bigMatter[i].mass = 20 - i;
  bigMatter[i].scale = bigMatter[i].mass * 10;
  bigMatter[i].r = random(1, 255);
  bigMatter[i].g = random(1, 255);
  bigMatter[i].b = random(1, 255);
  bigMatter[i].a = random(150, 255);
  }
  
  for(int j = 0; j < 10; j++)
  {
  posX = 2 * (Window.windowWidth / 10) * (j - 10);
  smallMatter[j] = new Walker();
  smallMatter[j].position.x = random(-500, 500);
  smallMatter[j].position.y = random(-500, 500);
  smallMatter[j].mass = 10 - j;
  smallMatter[j].scale = smallMatter[j].mass * 10;
  smallMatter[j].r = random(1, 255);
  smallMatter[j].g = random(1, 255);
  smallMatter[j].b = random(1, 255);
  smallMatter[j].a = random(150, 255);
  }
  

}

void draw()
{
  background(255);
  
  for(int i = 0; i < 10; i++)
  {
    bigMatter[i].update();
    bigMatter[i].render();
    
    for(int j = 0; j < 10; j++)
    {
      smallMatter[j].update();
      smallMatter[j].render();
      
      if (i != j)
      {
        smallMatter[j].applyForce(bigMatter[i].calculateAttraction(smallMatter[j]));
        bigMatter[i].applyForce(smallMatter[j].calculateAttraction(bigMatter[i]));
      }
     }
    
  }
  
  
  
  
  
}
