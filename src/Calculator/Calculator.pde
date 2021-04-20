Button[] numButtons = new Button[10];
Button[] opButtons = new Button[15];
String dVal;
String op;
boolean left;
float r;
float l;
float abs;
float result;

void setup () {
  size(500, 500);
  dVal = "0";
  op = "";
  left = true;
  r = 0.0;
  l = 0.0;
  result = 0.0;
  opButtons[0]= new Button(350, 350, 40, 40, #F53939, #C12D2D, "ENTER");
  opButtons[1]= new Button(290, 350, 40, 40, #EA8621, #BF6E1D, "+-");
  opButtons[2]= new Button(230, 350, 40, 40, #FFFFFF, #D3CFCF, "?"); 
  opButtons[3]= new Button(170, 350, 40, 40, #FFFFFF, #D3CFCF, "."); 
  numButtons[0]= new Button(110, 350, 40, 40, #FFFFFF, #D3CFCF, "0"); 
  numButtons[1]= new Button(110, 290, 40, 40, #FFFFFF, #D3CFCF, "1"); 
  numButtons[2]= new Button(170, 290, 40, 40, #FFFFFF, #D3CFCF, "2"); 
  numButtons[3]= new Button(230, 290, 40, 40, #FFFFFF, #D3CFCF, "3");
  opButtons[4] = new Button(290, 290, 40, 40, #EA8621, #BF6E1D, "^");
  opButtons[5] = new Button(350, 290, 40, 40, #9D25E8, #6D19A2, "+");
  opButtons[6] = new Button(350, 230, 40, 40, #9D25E8, #6D19A2, "-");
  opButtons[7] = new Button(290, 230, 40, 40, #EA8621, #BF6E1D, "√");
  numButtons[4]= new Button(230, 230, 40, 40, #FFFFFF, #D3CFCF, "6");
  numButtons[5]= new Button(170, 230, 40, 40, #FFFFFF, #D3CFCF, "5");
  numButtons[6]= new Button(110, 230, 40, 40, #FFFFFF, #D3CFCF, "4");
  numButtons[7]= new Button(110, 170, 40, 40, #FFFFFF, #D3CFCF, "7");
  numButtons[8]= new Button(170, 170, 40, 40, #FFFFFF, #D3CFCF, "8");
  numButtons[9]= new Button(230, 170, 40, 40, #FFFFFF, #D3CFCF, "9");
  opButtons[8] = new Button(290, 170, 40, 40, #EA8621, #BF6E1D, "%");
  opButtons[9] = new Button(350, 170, 40, 40, #9D25E8, #6D19A2, "x");
  opButtons[10] = new Button(350, 120, 40, 40, #9D25E8, #6D19A2, "÷");
  opButtons[11] = new Button(290, 120, 40, 40, #EA8621, #BF6E1D, "ABS");
  opButtons[12] = new Button(230, 120, 40, 40, #EA8621, #BF6E1D, "?");
  opButtons[13] = new Button(170, 120, 40, 40, #EA8621, #BF6E1D, "?");
  opButtons[14] = new Button(110, 120, 40, 40, #EA8621, #BF6E1D, "clear");
}

void draw () {
  strokeWeight(3);
  fill(128);
  rect(90, 30, 320, 370);
  fill(#76EA92);
  rect(90, 50, 320, 60);
  fill(255);
  textAlign(LEFT);
  textSize(13);
  text("Hackey Sack INC.", 300, 45);
  updateDisplay();
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover();
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover();
  }
}

void updateDisplay () {
  fill(#76EA92);
  rect(90, 50, 320, 60);
  textSize(20);
  fill(0);
  textAlign(RIGHT);
  text(dVal, 380, 100);

  //Render Scaling text
  if (dVal.length()<13) {
    textSize(32);
  } else if (dVal.length()<14) {
    textSize(28);
  } else if (dVal.length()<15) {
    textSize(26);
  } else if (dVal.length()<17) {
    textSize(24);
  } else if (dVal.length()<19) {
    textSize(22);
  } else if (dVal.length()<21) {
    textSize(20);
  } else if (dVal.length()<23) {
    textSize(18);
  } else if (dVal.length()<25) {
    textSize(16);
  } else {
    textSize(14);
  }
}

void mousePressed () {
  println("L:" + l + " R:" + r + " Op:" + op);
  println("Result:" + result + " Left:" + left);

  //Interaction with numbers
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].hover && dVal.length()<20) {
      if (left) {
        if (dVal.equals("0")) {
          dVal = (numButtons[i].val);
          l = float(dVal);
        } else {
          dVal += (numButtons[i].val);
          l = float(dVal);
        }
      } else {
        if (dVal.equals("0")) {
          dVal = (numButtons[i].val);
          r = float(dVal);
        } else {
          dVal += (numButtons[i].val);
          r = float(dVal);
        }
      }
    }
  }

  //Interaction with operators
  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].hover && opButtons[i].val.equals("clear")) {
      dVal = "0";
      result = 0.0;
      left = true;
      r = 0.0;
      l = 0.0;
      op = "";
    } else if (opButtons[i].hover && opButtons[i].val.equals("+")) {
      if (!left) {
        performCalculation();
      } else {
        op = "+";
        left = false;
        dVal = "0";
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("-")) {
      if (!left) {
        performCalculation();
      } else {
        op = "-";
        left = false;
        dVal = "0";
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("÷")) {
      if (!left) {
        performCalculation();
      } else {
        op = "÷";
        left = false;
        dVal = "0";
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("x")) {
      if (!left) {
        performCalculation();
      } else {
        op = "x";
        left = false;
        dVal = "0";
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("%")) {
      if (left) {
        l *= 0.1;
        dVal = str(l);
      } else {
        r *= 0.1;
        dVal = str(r);
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("+-")) {
      if (left) {
        l *= -1;
        dVal = str(l);
      } else {
        r *= -1;
        dVal = str(r);
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals(".") && !dVal.contains(".")) {
      dVal += (opButtons[i].val);
    } else if (opButtons[i].hover && opButtons[i].val.equals("^")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("ABS")) {
      if (left) {
        l = abs(l);
        dVal = str(l);
      } else {
        r = abs(r);
        dVal = str(r);
      }
    } else if (opButtons[i].hover && opButtons[i].val.equals("ENTER")) {
      performCalculation();
    }
  }
}

void keyPressed() {
  println("KEY:" + key + " keyCode:" + keyCode);

  if (key == '0') {
    handleEvent("0", true);
  } else if (key == '1') {
    handleEvent("1", true);
  } else if (key == '2') {
    handleEvent("2", true);
  } else if (key == '3') {
    handleEvent("3", true);
  } else if (key == '4') {
    handleEvent("4", true);
  } else if (key == '5') {
    handleEvent("5", true);
  } else if (key == '6') {
    handleEvent("6", true);
  } else if (key == '7') {
    handleEvent("7", true);
  } else if (key == '8') {
    handleEvent("8", true);
  } else if (key == '9') {
    handleEvent("9", true);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*') {
    handleEvent("x", false);
  } else if (key == '/') {
    handleEvent("÷", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == 's') {
    handleEvent("√", false);
  } else if (key == 'p') {
    handleEvent("%", false);
  } else if (key == 'a') {
    handleEvent("ABS", false);
  } else if (key == 'e') {
    handleEvent("^", false);
  } else if (key == 'c') {
    handleEvent("clear", false);
  } else if (key == 10) { //(key == CODED) {
    if (keyCode == ENTER || keyCode == RETURN) {
      handleEvent("ENTER", false);
    }
  } else if (keyCode == 27) {
    key = 0;
    if (key == 0) {
      handleEvent("clear", false);
    }
  }
}

String handleEvent (String val, boolean num) {
  if (left & num) {
    if (dVal.equals("0") || result == 1) {
      dVal = (val);
      l = float(dVal);
    } else {
      dVal += (val);
      l = float(dVal);
    }
  } else if (!left && num) {
    if (dVal.equals("0") || result == 1) {
      dVal = (val);
      r = float(dVal);
    } else {
      dVal += (val);
      r = float(dVal);
    }
  } else if (val.equals("clear")) {
    dVal = "0";
    result = 0.0;
    left = true;
    r = 0.0;
    l = 0.0;
    op = "";
  } else if (val.equals("+")) {
    if (!left) {
      performCalculation();
    } else {
      op = "+";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("-")) {
    if (!left) {
      performCalculation();
    } else {
      op = "-";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("÷")) {
    if (!left) {
      performCalculation();
    } else {
      op = "÷";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("x")) {
    if (!left) {
      performCalculation();
    } else {
      op = "x";
      left = false;
      dVal = "0";
    }
  } else if (val.equals("%")) {
    if (left) {
      l *= 0.1;
      dVal = str(l);
    } else {
      r *= 0.1;
      dVal = str(r);
    }
  } else if (val.equals("+-")) {
    if (left) {
      l *= -1;
      dVal = str(l);
    } else {
      r *= -1;
      dVal = str(r);
    }
  } else if (val.equals(".") && !dVal.contains(".")) {
    dVal += (val);
  } else if (val.equals("^")) {
    if (left) {
      l = sq(l);
      dVal = str(l);
    } else {
      r = sq(r);
      dVal = str(r);
    }
  } else if (val.equals("√")) {
    if (left) {
      l = sqrt(l);
      dVal = str(l);
    } else {
      r = sqrt(r);
      dVal = str(r);
    }
  } else if (val.equals("ABS")) {
    if (left) {
      l = abs(l);
      dVal = str(l);
    } else {
      r = abs(r);
      dVal = str(r);
    }
  } else if (val.equals("ENTER")) {
    performCalculation();
  }
  return val;
}

void performCalculation () {
  if (op.equals("+")) {
    result = l + r;
  } else if (op.equals("-")) {
    result = l - r;
  } else if (op.equals("x")) {
    result = l * r;
  } else if (op.equals("÷")) {
    result = l / r;
  }
  l = result;
  dVal = str(result);
  left = true;
}
