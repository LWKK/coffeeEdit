class TextLine {
  Engine e;
  int lettersAcross, letterCounter, y;
  String letters = "";

  TextLine(Engine e_, int y_) {
    e = e_;
    lettersAcross = ((width/e.textSize) * 2) - 10;
    letterCounter = 0;
    y = y_;
  }




  void handleKeys() {
    if( e.lines.get(e.currentLine) == this) {
      if (key == BACKSPACE && letters.length() > 0) {
        letters = letters.substring(0, letters.length()-1);
        letterCounter --;
      } else if (letterCounter < lettersAcross) {
        letters += key;
        letterCounter ++;
        if(key == TAB){
         letters += "    "; 
        }
      }
      
    }
  }

  void display() {
    textAlign(LEFT,BASELINE);
    textSize(e.textSize);
    fill(0);
    text(letters, 10, y);
  }



  void handleCurrentLine() {
    if (letterCounter == lettersAcross && keyPressed) {
      e.lines.add(new TextLine(e, y+e.textSize+3));
      e.currentLine ++;
      e.lineCounter++;
    }
    if(keyPressed && key == BACKSPACE && letters.length() ==0 && e.lineCounter > 1){
        e.currentLine --;
        e.lineCounter --;
        e.lines.remove(this);
      }
      
      if(keyPressed && key == ENTER){
        e.lines.add(new TextLine(e, y+e.textSize+3));
        e.currentLine ++;
        e.lineCounter++;
      }
  }
}