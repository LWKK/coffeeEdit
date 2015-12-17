class TextLine {
  Engine e;
  int lettersAcross, letterCounter, y;
  String letters = "";

  TextLine(Engine e_, int y_) {
    e = e_;
    lettersAcross = (width/e.textSize) * 2 - 3;
    letterCounter = 0;
    println(width);
    println(lettersAcross);
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
      }
    }
  }

  void display() {
    textSize(e.textSize);
    fill(0);
    text(letters, 10, y);
  }



  void newLine() {
    if (letterCounter == lettersAcross && keyPressed) {
      e.lines.add(new TextLine(e, y+e.textSize+3));
      e.currentLine ++;
      e.lineCounter++;
    }
  }
}