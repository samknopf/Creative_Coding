Planet sun;


  void setup()
{
  size(800,600,P3D);
  fullScreen();
  sun = new Planet(8);
  sun.createMoons();
  sun.dist = 0;
  sun.speed = 0;
  sun.size = 40;
  sun.col = color(255,255,255);
  
}

  void draw()
{
  noStroke();
  fill(color(0,0,0,10));
  rect(0,0,width,height);
  translate(width/2,height/2);
  scale(0.5);
  sun.show();
}
