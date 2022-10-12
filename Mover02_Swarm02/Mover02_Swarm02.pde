int nMover = 1000;
Mover[] m = new Mover[nMover];

void setup()
{
  size(800,600,P3D);
  fullScreen();
  for(int i = 0; i < m.length; i = i + 1)
  {
    m[i] = new Mover();
  }
}

void draw()
{
  background(255);
  for(int i = 0; i < m.length; i = i + 1)
  {
    m[i].update();
    m[i].check();
    m[i].show();
  }
  stroke(255,0,0);
  noFill();
  circle(mouseX,mouseY,1200);
}
