class Cursor {
  int x, y, startBlink, startDelay, lineClicked,index; 
  boolean displayed;
  Engine e;
  float[] cursorSpacing;

  Cursor(Engine e_, int x_, int y_) {
    x = x_;
    y = y_;
    e = e_;
    startBlink = millis();
    cursorSpacing = new float[e.lettersAcross+1];
    for (int i = 0; i < cursorSpacing.length; i ++) {
      //cursorSpacing[i] = i*(e.textSize/2) + e.textSize/4 + 1;
      cursorSpacing[i] = i * (e.textSize *.49)+10;
    }
  }



  void display() {
    index = findIndex(x);
    blink();
    setPos();
    if (displayed) {
      fill(0);
      stroke(0);
      strokeWeight(1);
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
        y = e.lines.get(e.lineCounter-1).y - e.textSize;
      }
      
      
     x = closestSpacing(mouseX);
      
    }
  }
  
  
  int closestSpacing(int find){
    float closest = cursorSpacing[0];
    float distance = abs(closest-find);
    for(int i = 0; i < cursorSpacing.length; i ++){
      float tempDist = abs(cursorSpacing[i] - find);
      if(distance > tempDist){
        closest = cursorSpacing[i];
        distance = tempDist;
      }
    }
    return int(closest);
  }
  
  
  
  int findIndex(int cX){
    float index = cX / (e.textSize *.49)-2;
    println(int(index));
    return int(index);
  }
  
}