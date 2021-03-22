class Powerup {

  //Member variables
  int x, y, speed, rad;
  String[] PowerupInfo = {"Ammo", "Health", "Lasers"};
  PImage photo;


  //constructor
  Powerup (int x, int y) {
    this.x = x;
    this.y = y;
    rad = 20;
    speed = (int(random(2, 5)));
    photo = loadImage("Powerup.png");
  }

  void move() {
    y+= speed;
  }

  boolean reachedBottom() {
    if (y > height+50) {
      return true;
    } else {
      return false;
    }
  }

  //member methods
  void display () {
    noStroke();
    imageMode(CENTER);
    image(photo, x, y, 40, 40);
  }
}
