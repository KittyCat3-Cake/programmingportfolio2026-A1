// Nidhi Nambudripad | Sept 14 2026 | Calculator
// Color Palette #096981, #0EF3FC, #32C0FF, #71D1F5, #30B0BA
float l, r, result;
char op;
boolean left;
boolean newEntry;
String displayVal;

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];

void setup() {
  size (260, 500);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  newEntry = true;
  displayVal = "0.0";
  numButtons[0] = new Button(20, 260, 40, 40, '0');
  numButtons[1] = new Button(20, 200, 40, 40, '1');
  numButtons[2] = new Button(80, 200, 40, 40, '2');
  numButtons[3] = new Button(140, 200, 40, 40, '3');
  numButtons[4] = new Button(20, 140, 40, 40, '4');
  numButtons[5] = new Button(80, 140, 40, 40, '5');
  numButtons[6] = new Button(140, 140, 40, 40, '6');
  numButtons[7] = new Button(20, 80, 40, 40, '7');
  numButtons[8] = new Button(80, 80, 40, 40, '8');
  numButtons[9] = new Button(140, 80, 40, 40, '9');
  opButtons[0] = new Button (200, 80, 40, 40, '÷');
  opButtons[1] = new Button(200, 140, 40, 40, '×');
  opButtons[2] = new Button(200, 200, 40, 40, '-');
  opButtons[3] = new Button(200, 260, 40, 40, '+');
  opButtons[4] = new Button(20, 320, 40, 40, '.');
  opButtons[5] = new Button(20, 380, 100, 40, '=');
  opButtons[6] = new Button(80, 320, 40, 40, ',');
  opButtons[7] = new Button(140, 260, 40, 40, '±');
  opButtons[8] = new Button(140, 320, 40, 40, '%');
  opButtons[9] = new Button(200, 320, 40, 40, '!');
  opButtons[10] = new Button(140, 380, 100, 40, 'C');
  opButtons[11] = new Button(80, 260, 40, 40, '^');
}

void draw() {
  background(#F6B1FA);
  updateDisplay();
  for (int i = 0; i < numButtons.length; i ++ ) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  // Background shape
  fill(#30B0BA);
  rect(20, 20, 220, 40, 8);
  // Overlay Text
  fill(0);
  textAlign(CENTER);
  text(displayVal, 130, 50);
  // text();
}

void mouseReleased() {
  // Update display with button clicked by user
  // Number buttons
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }

  // Operator buttons
  // loop through opButtons
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      char clicked = opButtons[i].val;

      if (clicked == '=') {
        performCalc();
      } else if (clicked == '+' || clicked == '-' ||
        clicked == '×' || clicked == '÷') {
        op = clicked;
        left = false;
        newEntry = true;
        displayVal = str(op);
      } else if (clicked == '±') {
        if (left == true) {
          l *= -1;
          displayVal = str(l);
        } else {
          r *= -1;
          displayVal = str(r);
        }
      } else if (clicked == 'C') {
        // reset all variables
        l = 0.0;
        r = 0.0;
        result = 0.0;
        op = ' ';
        left = true;
        newEntry = true;
        displayVal = "0.0";
      } else if (clicked == 's') {
        if (left == true) {
          l = sqrt(l);
          displayVal = str(l);
        } else {
          r = sqrt(r);
          displayVal = str(r);
        }
      } else if (clicked == 'q') {
        // square of the value in display
        if (left == true) {
          l = sq(l);
          displayVal = str(l);
        } else {
          r = sq(r);
          displayVal = str(r);
        }
      } else if (clicked == '.') {
        if (!displayVal.contains (".")) {
          if (left == true) {
            displayVal += ".";
            l = float(displayVal);
          } else {
            displayVal += ".";
            r = float(displayVal);
          }
        }
      }
    }

    printState();
  }
}

void printState() {
  println(
    "l: " + l +
    " | r: " + r +
    " | result: " + result +
    " | left: " + left +
    " | op: " + op +
    " | display: " + displayVal
    );
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l/r;
  } else if (op == 'x') {
    result = l * r;
  } else {
    return;
  }

  displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
  newEntry = true;
}

// displayVal = str(opButtons[i].val);
void mousePressed() {
  // Update display with proper button mouse click
}

void keyPressed() {
  if (key == '1') {
    println("You hit 1 " + keyCode );
    handleEvent('1', true);
  } else if (key == '2' || keyCode == 99) {
    println("You hit 2 " + keyCode );
    handleEvent('2', true);
  } else if (key == '3' || keyCode == 99) {
    println("You hit 3 " + keyCode );
    handleEvent('3', true);
  } else if (key == '4' || keyCode == 99) {
    println("You hit 4 " + keyCode );
    handleEvent('4', true);
  } else if (key == '5' || keyCode == 99) {
    println("You hit 5 " + keyCode );
    handleEvent('5', true);
  } else if (key == '6' || keyCode == 99) {
    println("You hit 6 " + keyCode );
    handleEvent('6', true);
  } else if (key == '7' || keyCode == 99) {
    println("You hit 7 " + keyCode );
    handleEvent('7', true);
  } else if (key == '8' || keyCode == 99) {
    println("You hit 8 " + keyCode );
    handleEvent('8', true);
  } else if (key == '9' || keyCode == 99) {
    println("You hit 9 " + keyCode );
    handleEvent('9', true);
  } else if (key == '0' || keyCode == 99) {
    println("You hit 0 " + keyCode );
    handleEvent('0', true);
  } else if (key == '÷' || keyCode == 99) {
    println("You hit ÷ " + keyCode );
    handleEvent('÷', true);
  } else if (key == '×' || keyCode == 99) {
    println("You hit × " + keyCode );
    handleEvent('×', true);
  } else if (key == '-' || keyCode == 99) {
    println("You hit - " + keyCode );
    handleEvent('-', true);
  } else if (key == '+' || keyCode == 99) {
    println("You hit + " + keyCode );
    handleEvent('+', true);
  } else if (key == '.' || keyCode == 99) {
    println("You hit . " + keyCode );
    handleEvent('.', true);
  } else if (key == '=' || keyCode == 99) {
    println("You hit = " + keyCode );
    handleEvent('=', true);
  } else if (key == ',' || keyCode == 99) {
    println("You hit , " + keyCode );
    handleEvent(',', true);
  } else if (key == '±' || keyCode == 99) {
    println("You hit ± " + keyCode );
    handleEvent('±', true);
  } else if (key == '%' || keyCode == 99) {
    println("You hit % " + keyCode );
    handleEvent('%', true);
  } else if (key == '!' || keyCode == 99) {
    println("You hit ! " + keyCode );
    handleEvent('!', true);
  } else if (key == 'C' || keyCode == 99) {
    println("You hit C " + keyCode );
    handleEvent('C', true);
  } else if (key == '^' || keyCode == 99) {
    println("You hit ^ " + keyCode );
    handleEvent('^', true);
  }
}

void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left == true) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // other stuff
  }
}
