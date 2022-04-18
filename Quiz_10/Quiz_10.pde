Liquid ocean = new  Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] ws = new Walker[10];
PVector wind = new PVector(0.1, 0);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);  
  int posX = 0;
  for(int i = 0; i < 10; i++)
  {
  posX = 2 * (Window.windowWidth / 10) * (i - 5);
  ws[i] = new Walker();
  ws[i].position = new PVector(posX, 200);
  ws[i].mass = 10 - i;
  ws[i].scale = ws[i].mass * 10;
  ws[i].r = random(1, 255);
  ws[i].g = random(1, 255);
  ws[i].b = random(1, 255);
  ws[i].a = random(150, 255);
  }

}

void draw()
{
  background(255);
  ocean.render();
  for(int i = 0; i < 10; i++)
  {
  
  ws[i].render();
  ws[i].update();
  
  PVector gravity = new PVector(0, -0.15f * ws[i].mass);
  ws[i].applyForce(gravity);
  ws[i].applyForce(wind);
  float c = 0.1f;
  float normal = 1;
  float frictionMagnitude = c * normal;
  PVector friction = ws[i].velocity.copy();
  ws[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
  
  if (ws[i].position.y <= Window.bottom)
  {
    ws[i].position.y = Window.bottom;
    ws[i].velocity.y *= -1;
  }
  
  if (ws[i].position.x >= Window.right)
  {
    ws[i].position.x = Window.right;
    ws[i].velocity.x *= -1;
  }
  
  if (ocean.isCollidingWith(ws[i]))
  {
    PVector dragForce = ocean.calculateDragForce(ws[i]);
    ws[i].applyForce(dragForce);
  }
  }
}
