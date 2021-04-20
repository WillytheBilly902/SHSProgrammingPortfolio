class Button {
  // Member Variable
  int x, y, w, h;
  color c1, c2;
  String val;
  boolean hover;

  // Constructor
  Button(int tempX, int tempY, int tempW, int tempH, int tempC1, int tempC2, String tempVal) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    c1 = tempC1;
    c2 = tempC2;
    val = tempVal;
    hover = false;
  }

  // Display Method
  void display () {
    if (hover) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x, y, w, h);
    fill(255);
    fill(0);
    textSize(12);
    textAlign(CENTER);
    text(val, x+21, y+24);
  }

  // Hover Method
  void hover () {
    hover = (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h);
  }
}
