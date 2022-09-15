float angle = 0;

void setup()
{
  size(800,800,P3D);
}

void draw()
{
  translate(width/2,height/2);
  strokeWeight(12);
  stroke(color(0,0,0));
  circle(0,0,600);
 
  pushMatrix();  
     rotate(radians(angle));
     strokeWeight(8);
     line(0,0,0,-275);
  popMatrix(); 
  
  pushMatrix();  
    rotate(radians(angle/12));
    strokeWeight(10);
    line(0,0,0,-200);
  popMatrix();
  
  pushMatrix();
    rotate(radians(angle*60));
    strokeWeight(5);
    stroke(color(255,0,0));
    line(0,0,0,-260);
  popMatrix();
  
  strokeWeight(5);
  stroke(color(0,0,0));
  circle(0,0,25);

  angle = angle + 0.1;
}
