class Enemyship {

  //Member Variables
  int x, y, health, speed, rad;
  color c;
  boolean right;
  PImage photo;
  int savedTime;
  int totalTime;

  //Constructor
  Enemyship(int x, int y, color c, int t) {
    this.x = x;
    this.y = y;
    health = 100;
    this.c = c;
    speed = (int(random(1, 3)));
    rad=30;
    if (random(11) > 5) {
      right = true;
    } else {
      right = false;
    }
    photo = loadImage("Enemyship (3).png");
    this.totalTime = t;
  }

  //Member Methods

  void display() {
    fill(c);
    noStroke();
    imageMode(CENTER);
    image(photo, x, y, 60, 60);
  }
  void move () {
    if (right) {
      x = x + speed;
    } else {
      x = x - speed;
    }
    if (x > width) {
      x = 0;
    } else if (x < 0) {
      x = width;
    }
  }
  //method for blaster vs enemyship
  boolean blasterIntersect(Blaster blasters) {
    float distance = dist (x, y, blasters.x, blasters.y);
    if (distance < rad + blasters.rad) {
      return true;
    } else {
      return false;
    }
  }
  
  void start() {
    savedTime = millis();
  }
  
  boolean isFinished() {
    int passedTime = millis() - savedTime;
    if(passedTime > totalTime) {
      return true;
    } else {
      return false;
    }
  }
  
  
  
  
}
