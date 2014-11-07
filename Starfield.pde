Particle [] star = new Particle[250];
void setup()
{
  size(1000, 1000);
  background(0);
  star[0] = new OddballParticle();
  for (int i = 1; i < 2; i++)
  {
    star[i] = new JumboParticle();
  }
  for (int i = 2; i < star.length; i++)
  {
    star[i] = new NormalParticle();
  }
}
void draw()
{
  background(0);
  for (int i = 0; i < star.length; i++)
  {
    star[i].move();
    star[i].show();
  }
}
interface Particle
{
  public void move();
  public void show();
}
class NormalParticle implements Particle
{
  double posX, posY, speedX, speedY, angle, siz;
  NormalParticle()
  {
    siz = 5;
    posX = 400;
    posY = 400;
    speedX = (Math.random()*5);
    speedY = (Math.random()*5);
    angle = (Math.random()*2*PI);
  }
  public void move()
  {
    posX = posX + speedX * Math.cos(angle);
    if(posX > 1000)
    {
      posX = 0;
      posY = (int)(Math.random()*1000);
    }
    else if(posX < 0)
    {
      posX = 1000;
      posY = (int)(Math.random()*1000);
    }
    posY = posY + speedY * Math.sin(angle);
    if(posY > 1000)
    {
      speedY = -speedY;
    }
    if(posY < 0)
    {
      speedY = -speedY;
    }
  }
  public void show()
  {
    strokeWeight((float)siz);
    stroke(255);
    point((int)(posX), (int)(posY));
  }
}
class OddballParticle implements Particle
{
  int [] col = new int[3];
  int siz;
  double posX, posY, speedX, speedY, angle;
  OddballParticle()
  {
    for (int i = 0; i < col.length; i++)
    {
      col[i] = (int)(Math.random()*256);
    }
    posX = 400;
    posY = 400;
    speedX = (Math.random()*5+3);
    speedY = (Math.random()*5);
    angle = (Math.random()*2*PI);
    siz = 10;
  }
  public void move()
  {
    posX = posX + speedX * Math.cos(angle);
    posY = posY + speedY * Math.sin(angle);
    if(posX > 1000)
    {
      posX = 0;
      posY = (int)(Math.random()*1000);
    }
    else if(posX < 0)
    {
      posX = 1000;
      posY = (int)(Math.random()*1000);
    }
    if(posY > 1000)
    {
      speedY = -speedY;
    }
    else if(posY < 0)
    {
      speedY = -speedY;
    }
    for (int i = 0; i < col.length; i++)
    {
      col[i] = (int)(Math.random()*256);
    }
  }
  public void show()
  {
    strokeWeight(1);
    fill(col[0],col[1],col[2]);
    ellipse((int)(posX), (int)(posY), siz, siz);
    if(siz < 40)
    {
      siz++;
    }
  }
 
}
class JumboParticle extends NormalParticle
{
  JumboParticle()
  {
    siz = 90;
  }
}
