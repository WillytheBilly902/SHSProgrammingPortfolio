class Blaster {

  //Member variables
  int x, y, speed, rad;
  color c;
  PImage photo;

  //constructor
  Blaster (int x, int y, color c) {
    this.x = x;
    this.y = y;
    speed = 6;
    rad=2;
    this.c = c;
    photo = loadImage("New Piskel.png");
  }

  void fire () {
    y-=speed;
  }

  boolean reachedTop() {
    if (y < -10) {
      return true;
    } else {
      return false;
    }
  }

  //member methods
  void display () {
    noStroke();
    fill(c);
    imageMode(CENTER);
    image(photo, x, y);
    //rectMode(CENTER);
    //rect(x, y, 2, 15);
  }
}
