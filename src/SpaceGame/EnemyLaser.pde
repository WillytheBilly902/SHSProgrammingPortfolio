class EnemyLaser {
  int x, y, speed, rad, power;
  PImage Elaser;

  EnemyLaser(int x, int y) {
    rad = 2; 
    this.x = x; 
    this.y = y; 
    power=25;
    speed = 8;
    Elaser=loadImage("EnemyLaser.png");
  }

  void fire() {
    y += speed;
  }

  boolean reachedBottom() {
    if (y > height) { 
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c);
    noStroke();
    imageMode(CENTER);
    image(Elaser, x, y);
  }
}
