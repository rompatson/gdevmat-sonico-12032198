public class Mover
{
   public PVector position;
   public float scale = 50;
   public float r = 255, g = 255, b = 255, a = 255;
   public PVector target;
   public PVector velocity; 
   public boolean reached = false;
   public float xoff = 0.0;
   public float yoff = 100.0;
   public float increment = 1;
   
   Mover()
   {
     position = new PVector(); 
     velocity = new PVector(); 
   }
   
   Mover(float scale)
   {
     position = new PVector(); 
     velocity = new PVector();
     this.scale = scale;
   }
   
   Mover(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   Mover(float x, float y, float scale)
   {
      position = new PVector(x, y);
      this.scale = scale;
   }
   
   public PVector getPosition()
   {
     return this.position; 
   }
   
   public void setTarget(PVector target)
   {
    this.target = target; 
   }
   
   public void setRandomPerlinPosition(int minX,int maxX,int minY,int maxY)
   {
     float xn = noise(xoff);
     xoff += increment;
     float yn = noise(yoff);
     yoff += increment;
     float x = map(xn, 0,1,minX,maxX);
     float y = map(yn, 0,1,minY,maxY);
     position.x = x;
     position.y = y;
   }
   
   public void setRandomGaussianPosition(float minX,float maxX,float minY,float maxY)
   {
     float xn = randomGaussian();
     float yn = randomGaussian();
     float x = map(xn, -1,1,minX,maxX);
     float y = map(yn, -1,1,minY,maxY);
     position.x = x;
     position.y = y;
   }
   
   public void setRandomGaussianColor(int minVal,int maxVal)
   {
     r =  map( randomGaussian(), -1,1, minVal,maxVal);
     g =  map( randomGaussian(), -1,1, minVal,maxVal);
     b =  map( randomGaussian(), -1,1, minVal,maxVal);
   }
   
   public void setRandomGaussianScale(int minVal,int maxVal)
   {
     scale = map( randomGaussian(), -1,1, minVal,maxVal);
   }
   
   void move()
   {
     position.x += velocity.x; 
     position.y += velocity.y; 
   }
   
   public void moveToTarget(float speed)
   {
     if(!reached)
     {
      velocity = PVector.sub(target,position);
      velocity.normalize();
      velocity.mult(speed);
      move();
      if( dist(position.x,position.y,target.x,target.y) < 5 )
      {
       reached = true; 
      }
     }
     
   }
   
   public void render()
   {
      noStroke();
      fill(r,g,b,a);
      circle(position.x, position.y, scale); 
   }
   
   
   public void setPosition(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   public void setColor(float r, float g, float b, float a)
   {
      this.r = r;
      this.g = g;
      this.b = b;
      this.a = a;
   }
}
