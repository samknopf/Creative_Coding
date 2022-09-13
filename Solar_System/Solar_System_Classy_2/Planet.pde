class Planet
{
  float dist = 100;  //a property
  float angle = 0.0;
  float speed = 1.0;
  float size = 50.0;
  color col = color(255,255,255);
  int nMoon = 0;
  Planet[] moons = new Planet[100];
  int generation = 0;
  
  Planet(int _generation) //a method 
  {
    this.generation = _generation;
    if(generation > 0)
    {
    this.createMoons();
    }
  }
  
  void createMoons()
  {
   this.nMoon = floor(random(1,4));
   for(int i = 0; i < this.nMoon; i = i + 1)
   {
     this.moons[i] = new Planet (this.generation - 1);
     this.moons[i].randomize();
   }
  }
  
  void randomize()
  {
    this.dist = random(10,200);
    this.speed = random(-0.5,0.5);
    this.col = color(random(255),100,100);
    this.size = random(5,30);
  }
  
  void show()
  {
   pushMatrix();
    rotate(radians(this.angle));
    translate(this.dist,0);
    noStroke();
    fill(this.col);
    circle(0,0,this.size);
    for(int i = 0; i < this.nMoon; i = i + 1)
  {
   this.moons[i].show(); 
  }
   popMatrix();
   this.angle = this.angle + this.speed;
  }
  
}
