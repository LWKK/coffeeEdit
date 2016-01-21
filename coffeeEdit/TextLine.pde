// A class the represents one line of text. Contains the string that is all of the letters in the line.

class TextLine {
  Engine e;
  int lettersAcross, letterCounter, y;
  String letters = "";
  boolean enterClicked = false;


  // Constructor for creating a new blank one
  TextLine(Engine e_, int y_) {
    e = e_;
    lettersAcross = ((width/e.textSize) * 2) - 10;
    letterCounter = 0;
    y = y_;
  }


  // Contructor for creating a new one with a present String
  TextLine(Engine e_, int y_, String letters_) {
    e = e_;
    lettersAcross = ((width/e.textSize) * 2) - 10;
    y = y_;
    letters = letters_;
    letterCounter = letters.length();
  }


  // This function handles all the key input 
  void handleKeys() {
    // If this is the line where the cursor is
    if ( e.lines.get(e.currentLine) == this) {

      // If back space is pressed and there are characters to be deleted
      if (key == BACKSPACE && letters.length() > 0) {
        if (letters.length() > 1) {
          // Move the cursor back. Has to be in this if statement to prevent out of bounds
          e.c.x = int(textWidth(letters)) + 12;
        }
        if (e.c.index == letterCounter) {
        // Subtract the last letter from the string
        letters = letters.substring(0, letters.length()-1);
        letterCounter --;
        e.c.index --;
        }
        
        else{
          if (letterCounter > 1 && e.c.index > 1){
            letterCounter --;
            e.c.index --;
            letters = letters.substring(0, e.c.index-1)  + letters.substring(e.c.index, letters.length()); 
          }
        }
      }

      // if the maximum amount of letters has not been reached and the keypressed is not a special key
      else if (letterCounter < lettersAcross && !(key == CODED)) {

        // If the cursor is at the end of the line, add the key to the string of letters
        if (e.c.index == letterCounter) {
          letters += key;
          letterCounter ++;
          e.c.index ++;
          if(letters.length() > 0 && letters != "" && letters != null && key != ENTER){
          e.c.x = int(textWidth(letters)) + 12;
          }
          else e.c.x = 10;
        } 
        // If the cursor is not at the end of the line, insert the character where the cursor is
        else {
          if (letterCounter > 0)letters = letters.substring(0, e.c.index) + key + letters.substring(e.c.index, letters.length()); 

          // If there are no letters and somehow the cursor is not in the right spot, just add the key
          else letters += key;
          letterCounter ++;
          e.c.index ++;
          e.c.x = int(textWidth(letters)) + 12;
        }
      }

      // If the tab is pressed, indent
      if (key == TAB) {
        letters += "    ";
      }
    }
  }


  // Function to display the string of letters at its respective y location
  void display() {
    textFont(e.font);
    textAlign(LEFT, BASELINE);
    textSize(e.textSize);
    fill(0);
    text(letters, 10, y);
  }


  // Function that handles the current line. Prevents an error when trying to add an object to a list while iterating through that list
  void handleCurrentLine() {
    if (keyPressed && key == ENTER) enterClicked = true;

    // If this current line is full and the user pressed a key,Create a new TextLine just below this line
    if (letterCounter == lettersAcross && keyPressed) {
      e.lines.add(new TextLine(e, y+e.textSize+3));
      e.currentLine ++;
      e.lineCounter++;
      e.c.x = 10;
      e.c.y += e.textSize+3;
      e.c.index = 0;
    }

    // If the user presses back space and this current line is empty and it is not the last line, delete it and move the cursor to the line above it
    if (keyPressed && key == BACKSPACE && letters.length() ==0 && e.lineCounter > 1) {
      e.currentLine --;
      e.lineCounter --;
      e.c.y -= e.textSize+3;
      e.c.index = e.lines.get(e.lineCounter-1).letterCounter;
      e.c.x = int(e.lines.get(e.lineCounter-1).letterCounter * (e.textSize *e.fontRatio));
      e.lines.remove(this);
    }

    // If the uses presses enter, create a new TextLine below this one.
    if (enterClicked && !keyPressed) {
      e.lines.add(new TextLine(e, y+e.textSize+3));
      e.currentLine ++;
      e.lineCounter++;
      e.c.x = 10;
      e.c.y += e.textSize+3;
      enterClicked = false;
      e.c.index = 0;
    }
  }
}