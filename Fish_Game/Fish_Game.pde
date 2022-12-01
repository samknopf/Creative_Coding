import processing.sound.*;
SoundFile beep;

float angle = 0;

int gameState = 0; //0 = startscreen, 1 = play, 2 = dead

int count = 0;
Zombie s;
Ground[] g;
int nGround = 0;
Boulder[] b;
int nBoulder = 4;

void setup()
{
  size(1200,800,P3D);
  //fullScreen();
  beep = new SoundFile(this,"beep.wav");
  reset();
}

void draw()
{
  if(gameState == 0) startScreen();
  if(gameState == 1) game(); 
  if(gameState == 2) endScreen();
}

void reset()
{
  s = new Zombie(100,50,200,100);
  String[] files = {"forward_fish/forward_fish00.png", "forward_fish/forward_fish01.png", "forward_fish/forward_fish02.png", "forward_fish/forward_fish03.png", "forward_fish/forward_fish04.png","forward_fish/forward_fish05.png", "forward_fish/forward_fish06.png", "forward_fish/forward_fish07.png", "forward_fish/forward_fish08.png","forward_fish/forward_fish09.png"};
  s.addAnimation(new Animation(files));
  String[] files1 = {"backward_fish/backward_fish00.png", "backward_fish/backward_fish01.png", "backward_fish/backward_fish02.png", "backward_fish/backward_fish03.png", "backward_fish/backward_fish04.png", "backward_fish/backward_fish05.png", "backward_fish/backward_fish06.png", "backward_fish/backward_fish07.png", "backward_fish/backward_fish08.png", "backward_fish/backward_fish09.png"};
  s.addAnimation(new Animation(files1));
  String[] files2 = {"front_fish/front_fish00.png", "front_fish/front_fish01.png", "front_fish/front_fish02.png", "front_fish/front_fish03.png", "front_fish/front_fish04.png", "front_fish/front_fish05.png", "front_fish/front_fish06.png", "front_fish/front_fish07.png", "front_fish/front_fish08.png", "front_fish/front_fish09.png"};
  s.addAnimation(new Animation(files2));
  s.addAnimation(new Animation(files2));
  
  nGround = ceil(width/1000.0)+1;
  
  String[] files4 = {"ground01.png"};
  String[] files5 = {"ground02.png"};
  String[] files6 = {"ground03.png"};

  g = new Ground[nGround];
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i] = new Ground(0,0,1000,250);
    g[i].location.x = (-width/2.0)+(i*1000.0);
    g[i].addAnimation(new Animation(files4));
    g[i].addAnimation(new Animation(files5));
    g[i].addAnimation(new Animation(files6));

  }
  String[] files10 = {"decor01/decor0100.png", "decor01/decor0101.png", "decor01/decor0102.png", "decor01/decor0103.png", "decor01/decor0104.png", "decor01/decor0105.png", "decor01/decor0106.png", "decor01/decor0107.png", "decor01/decor0108.png", "decor01/decor0109.png"};  
  String[] files11 = {"decor02/decor0200.png", "decor02/decor0201.png", "decor02/decor0202.png", "decor02/decor0203.png", "decor02/decor0204.png", "decor02/decor0205.png", "decor02/decor0206.png", "decor02/decor0207.png", "decor02/decor0208.png", "decor02/decor0209.png"};

  b = new Boulder[nBoulder];
  for(int i = 0; i < nBoulder; i = i + 1)
  {
    b[i] = new Boulder(0,0,100,100);
    b[i].addAnimation(new Animation(files10));
    b[i].addAnimation(new Animation(files11));
    b[i].adjust();
  }  
}

//end screen
void endScreen()
{
  noStroke();
  fill(0);
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("You are in heaven. Press a key to resurrection.",width/2,height/2);
}

//startscreen
void startScreen()
{
  noStroke();
  fill(color(255,0,100));
  rect(0,0,width,height);
  fill(255);
  textAlign(CENTER,CENTER);
  text("Press any key to start",width/2,height/2);
}



//game state
void game()
{
  background(0,100,250);
  translate(width/2,height/2);
  for(int i = 0; i < nGround; i = i + 1)
  {
    g[i].update();
    g[i].check();
    g[i].display();
  }

  s.update();
  s.check();
  s.display();
  for(int i = 0; i < nGround; i = i + 1)
  {
    b[i].update();
    b[i].check();
    b[i].display();
  }  
}

void keyPressed()
{
  if(gameState == 0) gameState = 1;
  if(gameState == 1) s.jump();
  if(gameState == 2) 
  {
    reset();
    gameState = 1;
  } 
}

boolean collision(Sprite s1, Sprite s2)
{
  PVector loc1 = new PVector(s1.location.x,s1.location.y);
  PVector loc2 = new PVector(s2.location.x,s2.location.y);
  PVector d = loc1.sub(loc2);
  float dist = d.mag();
  float limit = (min(s1.boxx,s1.boxy)/2)+(min(s2.boxx,s2.boxy)/2);
  if(dist < limit) return(true);
  return(false);
}
