void setup()
{
  size (1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  float gaussian = randomGaussian();
  float standardDeviation = random(100, 300);
  float mean = random(-100,100);
  
  float standardDeviationZ = random(0, 50);
  float meanZ = random(0, 10);
  
  float x = standardDeviation * gaussian + mean;
  int y = int (random(-360, 360));
  float z = standardDeviationZ * gaussian + meanZ;
  
  noStroke();
  
  int r = int(random(255));
  int g = int(random(255));
  int b = int(random(255));
  int a = int(random(10, 100));
  color randColor = color (r, g, b, a);
  fill(randColor);
  
  circle(x, y, z);
}
