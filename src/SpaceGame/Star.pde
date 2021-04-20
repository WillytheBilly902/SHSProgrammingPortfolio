class Star {

  //Member variables
  int x, y;
  color c;

  //constructor
  Star (int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
   boolean reachedBottom() {
    if (y > height+50) {
      return true; 
    } else {
      return false;
    }
  }
  
  void move() {
    y+= random(2, 4);
  }

  //member methods
  void display () {
    fill(c);
    noStroke();
    int dia = int(random(1, 3));
    ellipse(x, y, dia, dia);
  }
}
