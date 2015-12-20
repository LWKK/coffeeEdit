class Cursor {
  int x, y, startBlink, startDelay, lineClicked; 
  boolean displayed;
  Engine e;
  int[] cursorSpacing;

  Cursor(Engine e_, int x_, int y_) {
    x = x_;
    y = y_;
    e = e_;
    startBlink = millis();
    cursorSpacing = new int[e.lettersAcross+1];
    for (int i = 0; i < cursorSpacing.length; i ++) {
      cursorSpacing[i] = i*(e.textSize/2)+ e.textSize/4;
    }
  }



  void display() {
    blink();
    setPos();
    if (displayed) {
      line(x, y, x, y+e.textSize);
    }
  }


  void blink() {
    if (millis() > startDelay + 1000 && !displayed) {
      displayed = true;
      startBlink = millis();
    } else if (millis() > startBlink + 1000 && displayed) {
      displayed = false;
      startDelay = millis();
    }
  }

  void setPos() {
    if (mousePressed) {
      x = mouseX;
       y = mouseY;

      if (mouseY > e.textSize*e.lineCounter) {
        //y = e.lines.get(e.lineCounter-1).y - e.textSize;
      }
      
      
     x = closestSpacing(mouseX);
      
    }
  }
  
  
  int closestSpacing(int find){
    int closest = cursorSpacing[0];
    int distance = abs(closest-find);
    for(int i = 0; i < cursorSpacing.length; i ++){
      int tempDist = abs(cursorSpacing[i] - find);
      if(distance > tempDist){
        closest = cursorSpacing[i];
        distance = tempDist;
      }
    }
    return closest;
  }
}