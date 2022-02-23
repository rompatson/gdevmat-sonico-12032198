void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  size(1080, 720, P3D);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  
  PVector mouse = mousePos();
  
  //mouse.mult(2);
  mouse.normalize().mult(400);
  strokeJoin(BEVEL);
  beginShape();
  
  //red outer one side
  stroke(255, 0, 0);
  strokeWeight(20);
  line(0, 0, mouse.x, mouse.y);
  
  //white inner one side
  stroke(255, 255, 255);
  strokeWeight(5);
  line(0, 0, mouse.x, mouse.y);
  
  //magnitude of one side 
  println(mouse.mag());
  
  mouse.normalize().mult(300);
  //red outer other side
  stroke(255, 0, 0);
  strokeWeight(20);
  line(0, 0, -mouse.x, -mouse.y);
  
  //white inner other side
  stroke(255, 255, 255);
  strokeWeight(5);
  line(0, 0, -mouse.x, -mouse.y);
  
  //black handle
  mouse.normalize().mult(100);
  stroke(0, 0, 0);
  strokeWeight(30);
  line(0, 0, mouse.x, mouse.y);
  endShape(); 
  
  
}
