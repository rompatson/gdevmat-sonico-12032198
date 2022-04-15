public class Walker
{
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float speed;
  float scale;
  //public PVector position = new PVector(random(width), random(height));
  //public PVector mouse = new PVector(mouseX, mouseY);
  //public PVector velocity = new PVector();
  //public PVector acceleration = new PVector();
  //public float velocityLimit = 10;
  //public float scale = 15;
  
  public Walker()
  {
    position = new PVector(random(width), random(height));
    velocity = new PVector();
    speed = 10;
  }
  
  public void update()
  {
    
    PVector mouse = new PVector(mouseX, mouseY);
    acceleration = PVector.sub(mouse,position);
    acceleration.normalize();
    acceleration.mult(0.2);
    velocity.add(acceleration);
    velocity.limit(speed);
    position.add(velocity);
   
    //this.acceleration = PVector.sub(mouse,position);
    //this.acceleration = PVector.random2D();
    //this.acceleration.normalize();
    //this.acceleration.mult(0.2);
    //this.velocity.add(this.acceleration);
    //this.velocity.limit(velocityLimit);
    //this.position.add(this.velocity);
  }

  
  public void render ()
  {
    stroke(0);
    strokeWeight(2);
    fill(127,200);
    circle(position.x, position.y, scale);
  }
  
  public void setRandomGaussianScale(int minVal,int maxVal)
   {
     scale = map( randomGaussian(), -1,1, minVal,maxVal);
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
