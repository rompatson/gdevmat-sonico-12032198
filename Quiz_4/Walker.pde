public class Walker
{
  public float x;
  public float y;
  public float z;
  //public float rgb;
  //public float rgbx = 0, rgby = 10000;
  public float tx = 0, ty = 10000;
  public float zx = 0, zy = 10000;
 
  void render()
  {
    //rgb = map(noise(rgbx, rgby), 0, 1, 0, 255);
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    z = map(noise(zx, zy), 0, 1, 5, 150);
   
    color randColor = color (r, g, b);
    fill(randColor);
    noStroke();
    circle(x, y, z);
    //println(z);
    //println(rgbx);
    
    if (z > 150)
    {
      exit();
    }
    
    //rgbx += 10.01f;
    //rgby += 10.01f;
    zx += 0.01f;
    zy += 0.01f;
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -640, 640);
    y = map(noise(ty), 0, 1, -360, 360);
    
    tx += 0.01f;
    ty += 0.01f;
  }
  
}
