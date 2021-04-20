void setup () {
  size(400, 400);
}

void draw () {
  background(128);
  fill(255);
  stroke(5);
  //Vertical (Zero at Bottom)
  line(265, 20, 265, height);
  for (int i=height; i>0; i-=20) {
    line(261, i, 269, i);
    textSize(8);
    text(i, 250, height-i);
  }
  fill(42, 187, 242, 95);
  noStroke();
  rect(232, mouseY, 66, height-mouseY);
  fill(255);
  textSize(10);
  text("Gal:" + convertToGal(height-mouseY), 345, mouseY);

  //Title
  fill(42, 242, 240);
  textSize(20);
  textAlign(CENTER);
  text("Liters to Gallons", 95, 25);
  textAlign(CENTER);
  textSize(10);
  text("William Hackett | Oct. 2020", 95, 45);

  //Information
  textSize(10);
  textAlign(CENTER);
  text("To Convert Liters to \nGallons move the mouse up and down\n along the vertical line.", 95, 75);

  //Beaker
  noFill();
  stroke(5);
  ellipse(265, 15, 65, 25);
  line(232, 15, 232, 400);
  line(297, 15, 297, 400);
}

//Convert to Celsius
float convertToCel (float val) {
  val = (val-32.0)*(5.0/9.0);
  return val;
}

//Convert to Fahrenheit
float convertToFar (float val) {
  val = val*(9.0/5.0) + 32;
  return val;
}

//Liters to Gallons
float convertToGal (float val) {
  val = val/3.875;
  return val;
}
