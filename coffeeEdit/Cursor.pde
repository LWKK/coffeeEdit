// Class for the cursor. 

class Cursor {
  int x, y, startBlink, startDelay, lineClicked, index; 
  boolean displayed;
  Engine e;
  float[] cursorSpacing;


  // Contructor. Creates an array of textSpacing where in-between letters should be. (Kinda buggy because of capital letters and widths)
  Cursor(Engine e_, int x_, int y_) {
    x = x_;
    y = y_;
    e = e_;
    startBlink = millis();
    cursorSpacing = new float[e.lettersAcross+1];
    for (int i = 0; i < cursorSpacing.length; i ++) {
      //cursorSpacing[i] = i*(e.textSize/2) + e.textSize/4 + 1;
      cursorSpacing[i] = i * (e.textSize *e.fontRatio)+11; // kinda works add 10 bc when priting it starts 10 in
      //textSize(e.textSize);
    }
  }


  // Function to display the cursor and call other functions 
  void display() {
    //index = findIndex(x);
    blink();
    setPos();
    if (displayed) {
      fill(0);
      stroke(0);
      strokeWeight(1);
      line(x, y, x, y+e.textSize);
    }
  }


  // Function that makes the cursor blink. Based on millis() determines if it should be displayed or not
  void blink() {
    if (millis() > startDelay + 1000 && !displayed) {
      displayed = true;
      startBlink = millis();
    } else if (millis() > startBlink + 1000 && displayed) {
      displayed = false;
      startDelay = millis();
    }
  }


  // Function to set the posistion of the cursor when the mouse is pressed
  void setPos() {
    if (mousePressed) {
      x = mouseX;
      y = mouseY;
      // If mouse is clicked way below where the last line is, move it up to the last line
      if (mouseY > e.textSize*e.lineCounter) {
        y = e.lines.get(e.lineCounter-1).y - e.textSize;
      }
      // Call the closest spacing function to determine where the mouse should go so it is between letters
      x = closestSpacing(mouseX);
      // Find the index of where the mouse is. Basically what is the index in the string of the letter it is next to
      index = findIndex(x);
    }
    // constrain the index to prevent out of bounds in the TextLine class. 
    index = constrain(index, 0, 100);
  }


  // Function that finds the closest value in an array to what you are looking for. In this case it is lookin for the closest gap between letters to go to. 
  int closestSpacing(int find) {
    float closest = cursorSpacing[0];
    float distance = abs(closest-find);
    for (int i = 0; i < cursorSpacing.length; i ++) {
      float tempDist = abs(cursorSpacing[i] - find);
      if (distance > tempDist) {
        closest = cursorSpacing[i];
        distance = tempDist;
      }
    }
    return int(closest);
  }


  // Function that finds the index of the letter in the string it is next to. Used to type mid string
  int findIndex(int cX) {
    if (index < 0) {
      index = 0;
    }
    float index = cX / (e.textSize *e.fontRatio)-1;
    return int(index);
  }
}