public class Walker
{
  public PVector position = new PVector(0, 0);
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float r = 255, g = 255, b = 255, a = 255;
  public float velocityLimit = 10;
  public float scale = 50;
  public float mass;
  
  public Walker(float m)
  {
    mass = m;
    this.velocity = new PVector(0,0);
    this.acceleration = new PVector(0,0);
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    this.acceleration.add(f);
  }
  
  public void update()
  {
    //this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration);
    //this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0);
  }
  
  public void render()
  {
    fill(r,g,b,a);
    circle(position.x, position.y, scale);
  }
  
  public void setRandomGaussianColor(int minVal,int maxVal)
   {
     r =  map( randomGaussian(), -1,1, minVal,maxVal);
     g =  map( randomGaussian(), -1,1, minVal,maxVal);
     b =  map( randomGaussian(), -1,1, minVal,maxVal);
   }
  
  
  public void checkEdges()
  {
    if (this.position.x > Window.right)
    {
      this.position.x = Window.left;
      
    }
    else if (this.position.x < Window.left)
    {
      this.position.x = Window.right;
    }
    
    if (this.position.y > Window.top)
    {
      this.position.y = Window.bottom;
    }
    else if (this.position.y < Window.bottom)
    {
      this.position.y = Window.top;
    }
  }
}
