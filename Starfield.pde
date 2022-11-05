PImage img;
PImage img2;
Particle[] p = new Particle[160];
double d = 1;
void setup()
{
  size(600,600);
  for(int x = 0; x < 160; x++){
  if(x < 50){
    p[x] = new Particle();
  }
  else if(x < 150){
    p[x] = new Rain();
  }
  else
   p[x] = new OddballParticle();
  }
  img = loadImage("anthill.jpg");
  img2 = loadImage("cheese.png");
}
void draw()
{
  image(img,-90,0,800,600);
  for(int x = 0; x < p.length; x++){
    p[x].move();
    p[x].show();
  }
  if(d == -1){
  fill(50,50,50,120);
  rect(0,0,600,600);
  }
}
class Particle
{
  int myWidth, myHeight, myColor;
  double myX, myY, myAngle, mySpeed;
  Particle(){
    myWidth = 12;
    myHeight = 12;
    mySpeed = (int)(Math.random()*4+1);
    myColor = (int)(Math.random()*30+20);
    myAngle = PI*Math.random()*2;
    myX = 300;
    myY = 300;
  }
  void move(){
    if(d == 1){
      if(myX > 750 || myX < -150){
        myX = 300;
        myY = 300;
        mySpeed = (int)(Math.random()*4+1);
        myAngle = PI*Math.random()*2;
      }
      if(myY > 750 || myY < -150){
        myX = 300;
        myY = 300;
        mySpeed = (int)(Math.random()*4+1);
        myAngle = PI*Math.random()*2;
      }
    }
    if(d == -1){
      if(myX > 298 && myX < 302){
        if(myY > 298 && myY < 302){
          myAngle = PI*Math.random()*2;
          myX = Math.cos(myAngle)*400+300;
          myY = Math.sin(myAngle)*400+300;
          mySpeed = (int)(Math.random()*4+1);
        }
      }
    }
    myX = myX + d*Math.cos(myAngle)*mySpeed;
    myY = myY + d*Math.sin(myAngle)*mySpeed;
  }
  void show(){
    fill(myColor, myColor, myColor);
    ellipse((int)myX, (int)myY, myWidth, myHeight);
    strokeWeight(8);
    stroke(myColor,myColor,myColor);
    if(d == -1)
    line((float)myX, (float)myY, (float)myX + (float)(Math.cos(myAngle)*12), (float)myY + (float)(Math.sin(myAngle)*12));
    if(d == 1)
    line((float)myX, (float)myY, (float)myX - (float)(Math.cos(myAngle)*12), (float)myY - (float)(Math.sin(myAngle)*12));
    noStroke();
  }
}

class Rain extends Particle
{
  Rain(){
    mySpeed = (int)(Math.random()*4+4);
    myColor = (int)(Math.random()*50+50);
    myAngle = PI*Math.random()*2;
    myX = Math.cos(myAngle)*400+300;
    myY = Math.sin(myAngle)*400+300;
  }
  void move(){
      if(myX > 200 && myX < 400){
        if(myY > 200 && myY < 400){
          myAngle = PI*Math.random()*2;
          myX = Math.cos(myAngle)*400+300;
          myY = Math.sin(myAngle)*400+300;
          mySpeed = (int)(Math.random()*4+4);
        }
      }
    myX = myX - Math.cos(myAngle)*mySpeed;
    myY = myY - Math.sin(myAngle)*mySpeed;
  }
  void show(){
    strokeWeight(4);
    stroke(myColor,myColor+20,myColor+100);
    if(d == 1){
      noStroke();
    }
    line((float)myX, (float)myY, (float)myX + (float)(Math.cos(myAngle)*15), (float)myY + (float)(Math.sin(myAngle)*15));
    noStroke();
  }
}

class OddballParticle extends Particle
{
  OddballParticle(){
    myWidth = 12;
    myHeight = 12;
    mySpeed = (int)(Math.random()*4+1);
    myColor = (int)(Math.random()*30+20);
    myAngle = PI*Math.random()*2;
    myX = 300;
    myY = 300;
  }
  void move(){
      if(myX > 298 && myX < 302){
        if(myY > 298 && myY < 302){
          myAngle = PI*Math.random()*2;
          myX = Math.cos(myAngle)*400+300;
          myY = Math.sin(myAngle)*400+300;
          mySpeed = (int)(Math.random()*4+1);
        }
      }
    myX = myX - Math.cos(myAngle)*mySpeed;
    myY = myY - Math.sin(myAngle)*mySpeed;
  }
  void show(){
    fill(myColor, myColor, myColor);
    ellipse((int)myX, (int)myY, myWidth, myHeight);
    strokeWeight(8);
    stroke(myColor,myColor,myColor);
    line((float)myX, (float)myY, (float)myX + (float)(Math.cos(myAngle)*12), (float)myY + (float)(Math.sin(myAngle)*12));
    image(img2,(float)myX-20,(float)myY-20,60,60);
    noStroke();
  }
  }

void mousePressed(){
  d = -1;
}

void mouseReleased(){
  d = 1;
}
