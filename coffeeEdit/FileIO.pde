// Class that handles all work with the files including saving and opening


class FileIO {
  Button saveButton;
  Engine e;
  File file;
  boolean saveClicked = false;


  // Constructor
  FileIO(Engine e_, File file_) {
    e = e_;
    file = file_;
    saveButton = new Button(5, 5, 30, 30, color(30, 122, 78), color(0, 102, 102), "SAVE", 12);
  }


  // Function that runs the class. handles saving if the save button is pressed
  void run() {
    noStroke();
    fill(160, 168, 171);
    rect(0, 0, width, 35);
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(25);
    text(e.file.getName(), width/2, 15);
    saveButton.display(); 
    if (saveButton.clicked) {
      saveClicked = true;
    }
    // Calls save function if button is pressed. Boolean prevents saving multiple times in one click
    if (!saveButton.clicked && saveClicked) {
      saveWriter(e.lines.toArray(new TextLine[0]), e.file); 
      saveClicked = false;
    }
  }


  // Function that saves the actual lines. Taken a TextLine class array and a file to write to as parameters. 
  void saveWriter(TextLine[] lines_, File file_) {
    file = file_;
    // Iterate through the array of objects and write each line to the file
    for (TextLine line : lines_) {
      String[] temp = new String[1];
      temp[0] = line.letters + "\n";
      saveStrings(file.getName(), temp);
    }
  }


// A function that will take a file the user has opened and transform all lines into TextLine objects
  void fileToLines(File file_) {
    // Loading each line into an array of strings
    String[] lines = loadStrings(file.getName());
    // Iterate through the array and create new TextLine objects for each line. Calling secondary constructor for TextLine
    for (int i = 0; i <lines.length; i ++) {
      // If it is the first line, move its y value down more so it starts in the correct place
      if (i == 0) {
        e.lines.add(new TextLine(e, e.textSize + 45, lines[i]));
        e.currentLine++;
        e.lineCounter ++;
      } else {
        // If other line, y value is based on textSize
        e.lines.add(new TextLine(e, i*+e.textSize+3, lines[i]));
        e.currentLine ++;
        e.lineCounter++;
      }
    }
    // Setting the cursor position based on the last line
    e.c.x = int(e.lines.get(e.currentLine-1).letterCounter*(e.textSize *e.fontRatio));
    e.c.index =e.lines.get(e.currentLine-1).letterCounter;
    e.c.y = e.lineCounter *(e.textSize+3) + 45;
  }
}