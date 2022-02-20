void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(0);
  
  
  
  drawCartesianPlane();
  yellowFunc();
  purpleFunc();
  greenCircle();
}

void drawCartesianPlane()
{
  strokeWeight(1);
  color white = color (255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  color white = color (255, 255, 255);
  fill (white);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, x - 3, 2);
  }
}

//1.
void yellowFunc()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x, (float)(x * x) - (15 * x) - 3, 2);
  }
}

//2.
void purpleFunc()
{
  color purple = color(128, 0, 128);
  fill(purple);
  stroke(purple);
  noStroke();
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x, (-5 * x) + 30, 2);
  }
}

//3.
void greenCircle()
{
  color green = color (0, 255, 0);
  fill(green);
  stroke(green);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
     circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 2);
  }
}
