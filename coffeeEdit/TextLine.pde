class TextLine {
  Engine e;
  int lettersAcross, letterCounter, y;
  String letters = "";
  boolean enterClicked = false;
  TextLine(Engine e_, int y_) {
    e = e_;
    lettersAcross = ((width/e.textSize) * 2) - 10;
    letterCounter = 0;
    y = y_;
  }




  void handleKeys() {
    println(e.c.index + " " + letterCounter);
    if( e.lines.get(e.currentLine) == this) {
      if (key == BACKSPACE && letters.length() > 0) {
        letters = letters.substring(0, letters.length()-1);
        letterCounter --;
      } else if (letterCounter < lettersAcross) {
        if(e.c.index == letterCounter){
          letters += key;
          letterCounter ++;
          e.c.x +=(e.textSize *0.49);
          e.c.index++;
        }
        else{
          print(e.c.index+1 + " " + letterCounter + "\n"); 
          String temp = letters;
         //letters = letters.substring(0,e.c.index+1) + key + letters.substring(e.c.index,letters.length()); 
        }
        //letterCounter ++;
        //e.c.x +=(e.textSize *0.49);
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
    
    if(keyPressed && key == ENTER) enterClicked = true;
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
      
      if(enterClicked && !keyPressed){
        e.lines.add(new TextLine(e, y+e.textSize+3));
        e.currentLine ++;
        e.lineCounter++;
        enterClicked = false;
      }
  }
}