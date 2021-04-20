class Rock {

  //Member variables
  int x, y, health, speed, rad;
  color c;
  PImage photo;

  //constructor
  Rock (int x, int y, color c) {
    this.x = x;
    this.y = y;
    health = 25;
    speed = (int(random(1, 5)));
    rad=35;
    this.c = c;
    photo =loadImage("Astroid.png");
  }
  
  boolean reachedBottom() {
    if (y > height+50) {
      return true; 
    } else {
      return false;
    }
  }
  
  void move() {
    y+= speed;
  }

  //member methods
  void display () {
    noStroke();
    fill(c);
    imageMode(CENTER);
    image(photo, x, y, 70, 70);
  }
  
  //method will detect rock vs laser
   boolean blasterIntersect(Blaster blasters) {
    float distance = dist (x, y, blasters.x, blasters.y);
    if(distance < rad + blasters.rad) {
      return true;
    } else {
      return false;
    }
  } 
}
