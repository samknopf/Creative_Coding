class Mover
{
  PVector pos = new PVector(0,0);
  PVector speed = new PVector(0,0);
  PVector acc = new PVector(0,0);
  PVector acc1 = new PVector(0,0);
  float top_acc = random(0.01,0.5);
  float top_speed = random(1,5);
  
  Mover()
  {
    this.pos.x = random(width);
    this.pos.y = random(height);
  }
  
  void show()
  {
    stroke(0);
    circle(this.pos.x, this.pos.y,10);
    
    
  }
  
  void update()
  {
    PVector mouse = new PVector(mouseX,mouseY);
    this.acc = PVector.sub(mouse,this.pos);
    float dist = this.acc.mag();
    this.acc.normalize();
    this.acc.mult(this.top_acc);
    
    this.acc1 = PVector.random2D();
    if(dist < 600)
    {
      PVector acc_actual = this.acc1.lerp(this.acc,1.0-(dist/600.0));
      //acc_actual.mult(-1.0);
      this.speed = this.speed.add(acc_actual);
    }
    else
    {
      this.speed = this.speed.add(this.acc1);
    }
    
    this.pos = this.pos.add(this.speed);
  }
  
  void check()
  {
    this.speed.limit(this.top_speed);
    if(this.pos.x > width) this.pos.x = 0;
    if(this.pos.x < 0) this.pos.x = width;  
    if(this.pos.y > height) this.pos.y = 0;
    if(this.pos.y < 0) this.pos.y = height;
  }
}
