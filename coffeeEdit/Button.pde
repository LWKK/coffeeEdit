// A class for all buttons in the program. Has 2 different colors for hover and non hover. Boolean for if it is clicked and label to be displayed on the button


class Button {
  int x, y, w, h, textSize;
  color hoverC, regC, dispC;
  boolean hovering, clicked;
  String text;


  // Buttons constructor. Almost all values passed through
  Button(int x_, int y_, int w_, int h_, color hover, color reg, String text_, int textS) {
    x = x_;
    y = y_;
    regC = reg;
    dispC = reg;
    hoverC = hover;
    text = text_;
    w = w_;
    h = h_;
    textSize = textS;
  }


  // Display function for the button. Calls the other button functions and then displayed the button based on its x,y, Current color and label
  void display() {
    checkHover();
    checkClicked();
    noStroke();
    fill(dispC);
    rect(x, y, w, h);
    fill(255);
    textSize(textSize);
    textAlign(CENTER, CENTER);
    text(text, x+w/2, y+h/2);
  }


  // Function that checks if the mouse is currently hovering over the button. sets boolean accordingly. Also sets the current color to be displayed based on if it is hovered over. 
  void checkHover() {
    if ((mouseX >= x && mouseX <= x+w) && (mouseY >= y && mouseY <= y + h)) {
      hovering = true;
    } else {
      hovering = false;
    }
    if (hovering) dispC = hoverC;
    if (!hovering) dispC = regC;
  }


  // This function checks if the button is being clicked. Sets boolean accordingly
  void checkClicked() {
    if (hovering && mousePressed)clicked = true;
    else clicked = false;
  }
}