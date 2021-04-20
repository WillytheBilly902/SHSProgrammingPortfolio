//Global Variables
int x, y;

void setup() {
  size(400, 400);
  frameRate(10);
  // Set start coords
  x = 0;
  y = 0;
}

void draw() {
  fill(255);
  strokeWeight(3);
  //drawName();
  //noLoop();
}


void mouseClicked () {
  saveFrame("Image-######");
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      moveRight(5);
    } else if (keyCode == LEFT) {
      moveLeft(5);
    } else if (keyCode == DOWN) {
      moveDown(5);
    } else if (keyCode == UP) {
      moveUp(5);
    }
  }
}
// Algorithm for your first name
void drawName() {
  moveRight(20);
  moveDown(60);
  moveRDDiag(25);
  moveRUDiag(22);
  moveRDDiag(22);
  moveRUDiag(25);
  moveLDDiag(25);
  moveRight(45);
  moveUp(12);
  moveDown(12);
  point(134, 60);
  moveRight(20);
  moveUp(25);
  moveDown(25);
  moveRight(20);
  moveUp(25);
}

// Method to draw right line
void moveRight(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y);
  }
  x=x+rep;
}

//Method to draw left line
void moveLeft(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y);
  }
  x=x-rep;
}

//Method to draw up line
void moveUp(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y-i);
  }
  y=y-rep;
}

//Method to draw down line
void moveDown(int rep) {
  for (int i=0; i<rep; i++) {
    point(x, y+i);
  }
  y=y+rep;
}

//Method to draw right down diagonal line
void moveRDDiag(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y+i);
  }
  x=x+rep;
  y=y+rep;
}

//Method to draw right up diagonal line
void moveRUDiag(int rep) {
  for (int i=0; i<rep; i++) {
    point(x+i, y-i);
  }
  x=x+rep;
  y=y-rep;
}

//Method to draw left down diagonal line
void moveLDDiag(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y+i);
  }
  x=x-rep;
  y=y+rep;
}

//Method to draw left up diagonal line
void moveLUDiag(int rep) {
  for (int i=0; i<rep; i++) {
    point(x-i, y-i);
  }
  x=x-rep;
  y=y-rep;
}
