float _angle = 0;

void setup()
{
  size(800,600);
}

void draw()
{
  clearScreen();
  translate(width/2,height/2);
  scale(0.25);

//sun
aCircle(0,0,200,255,255,255);

//planet
pushMatrix();
  rotate(radians(_angle-1));
  translate(250,0);
  aCircle(0,0,100,0,100,255);
  rotate(radians(_angle/-2));
  translate(150,0);
  aCircle(0,0,30,255,200,0);
popMatrix();

pushMatrix();
  rotate(radians(_angle));
  translate(600,0);
  aCircle(0,0,150,200,30,150);
    rotate(radians(_angle));
    translate(150,0);
    aCircle(0,0,50,120,50,150);
      rotate(radians(_angle/-3));
      translate(200,0);
      aCircle(0,0,25,100,200,200);
  popMatrix();
  
//planet
pushMatrix();
  rotate(radians(_angle/-3));
  translate(800,0);
  aCircle(0,0,300,255,255,50);
  //moon
    rotate(radians(_angle/-2));
    translate(200,0);
    aCircle(0,0,50,255,0,255);
  popMatrix();
  
  aPlanet(0,0,300,255,255,50);

rotate(radians(_angle/2));
translate(150,0);
aCircle(0,0,50,255,100,0);

_angle = _angle + 1;
}

void aPlanet(float size,float speed,float distance,int red, int green, int blue)
{
  pushMatrix();
    rotate(radians(_angle/speed));
    translate(250,0);
    aCircle(0,0,size,red,green,blue);
  popMatrix();
}

void aCircle(float x, float y, float d, int red, int green, int blue)
{
  noStroke();
  fill(color(red,green,blue));
  circle(x,y,d);
}

void clearScreen()
{
  noStroke();
  fill(color(0,0,0,10));
  rect(0,0,width,height);
}
