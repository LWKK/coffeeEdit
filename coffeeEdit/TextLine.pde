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
  
  TextLine(Engine e_, int y_, String letters_){
   e = e_;
   lettersAcross = ((width/e.textSize) * 2) - 10;
    y = y_;
    letters = letters_;
    letterCounter = letters.length();
  }




  void handleKeys() {
   // println("Cursor  " + e.c.index);
    if( e.lines.get(e.currentLine) == this) {
      if (key == BACKSPACE && letters.length() > 0) {
        if(letters.length() > 1){
        e.c.x -= textWidth(letters.charAt(letters.length()-1))-2;
        println(char(letters.charAt(letters.length()-1)));
        }
        letters = letters.substring(0, letters.length()-1);
        letterCounter --;
        e.c.index --;
        
      } else if (letterCounter < lettersAcross && !(key == CODED)){
        if(e.c.index == letterCounter){
          letters += key;
          letterCounter ++;
          e.c.index ++;
          e.c.x += (textWidth(key) + 2);
          
        }
        else{
         letters = letters.substring(0,e.c.index) + key + letters.substring(e.c.index,letters.length()); 
         letterCounter ++;
          e.c.index ++;
          e.c.x += (textWidth(key)+2);
        }
        
      }
      if(key == TAB){
         letters += "    "; 
        }
      
    }
  }

  void display() {
    textFont(e.font);
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
      e.c.x = 10;
      e.c.y += y+e.textSize+3;
      e.c.index = 0;
    }
    if(keyPressed && key == BACKSPACE && letters.length() ==0 && e.lineCounter > 1){
        e.currentLine --;
        e.lineCounter --;
        e.c.y -= y+e.textSize+3;
        e.c.index = e.lines.get(e.lineCounter-1).letterCounter;
        e.c.x = int(e.lines.get(e.lineCounter-1).letterCounter * (e.textSize *e.fontRatio));
        e.lines.remove(this);
        
      }
      
      if(enterClicked && !keyPressed){
        e.lines.add(new TextLine(e, y+e.textSize+3));
        e.currentLine ++;
        e.lineCounter++;
        e.c.x = 10;
        e.c.y += y+e.textSize+3;
        enterClicked = false;
        e.c.index = 0;
      }
  }
}