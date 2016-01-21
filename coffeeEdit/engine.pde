// The main Engine class that runs the whole application and contains all the individual objects.

/*
 States:
 1 - Main Menu
 2- About Screen
 3 - Load File
 4 - Main Typing Screen
 5 - New File
 */

class Engine {
  PFont font;
  PFont menuFont;
  PFont aboutFont;
  int textSize = 15, lineCounter = 1;
  ArrayList<TextLine> lines = new ArrayList<TextLine>();
  int currentLine = 0, lettersAcross = (width/textSize) * 2 - 3, state = 1, prevState = 1;
  boolean fileChosen = false, newFileNamed = false, fileChooserOpen = false;
  Button backButton;
  Cursor c;
  FileIO fileIO;
  MainMenu mm;
  PApplet sketch;
  File file;
  float actualW = 600, w, h, scaleRatio, fontRatio = 0.44;


  // Constructor. Instatiaing all other objects
  Engine(PApplet theSketch) {
    sketch = theSketch;
    lines.add(new TextLine(this, textSize + 45));
    c = new Cursor(this, 10, 45);
    backButton = new Button(5, 5, 40, 30, color(30, 122, 78), color(0, 102, 102), "BACK", 12);
    mm = new MainMenu(this);
    font = createFont("AndaleMono", textSize);
    menuFont = createFont("KGSkinnyLatte.ttf", textSize);
    aboutFont = createFont("KasseFLF.ttf", textSize);
    textFont(menuFont);
  }


  // Function that runs the application based on what the current state is. 
  void run() {
    background(255);

    // Main typing screen
    if (state == 4) { 
      textFont(font);
      dispText();
      c.display();
      fileIO.run();
    }

    // Main Menu 
    if (state == 1) {
      textFont(menuFont);
      mm.display();
    }

    // About screen
    if (state == 2) {
      background(212, 164, 106);
      backButton.display();
      textFont(aboutFont);
      textAlign(CENTER, CENTER);
      textSize(35);
      text("Welcome To Coffee Edit", width/2, height/6);
      textSize(30);
      text("A Java Source Code Editor", width/2, height/3);
      textSize(25);
      text("Made By Lars Kishchuk", width/2, height*.66);
      if (backButton.clicked)state = 1;
    }

    // File Chooser
    if (state == 3 && !fileChosen) {
      if (fileChooserOpen) {
        fileChooser2();
      }
      fileChooserOpen = false;
    }

    // Creating a new file
    if (state == 5) {
      createNewFile();
    }
  }


  // A function that displays that displays all the text
  void dispText() {
    // Iterate through the array list of TextLines and display each one
    for (TextLine line : lines) {
      line.display();
    }
    // Call this function for the current line. Avoids error while iterating if you delete or add a new object to the list
    lines.get(currentLine).handleCurrentLine();
  }


  // Function that handles the keys for the list objects. Called in main file
  void handleAllKeys() {
    for (TextLine line : lines) {
      line.handleKeys();
    }
  }


  // Initial file chooser that uses Java.Swing.  Chose not to use this and went with the default processing one
  void fileChooser() {
    // noLoop() to avoid an error between swing and the running PApplet
    noLoop();
    // Creating a file choosing object
    JFileChooser chooser = new JFileChooser();
    chooser.setFileFilter(chooser.getAcceptAllFileFilter());
    // open the file chooser dialog box
    int returnVal = chooser.showOpenDialog(null);
    // If the user has chosen an appropriate file
    if (returnVal == JFileChooser.APPROVE_OPTION){
      fileChosen = true;
      // Setting the file to this file chosen and creating a new fileIO class with this file
      file = chooser.getSelectedFile();
      fileIO = new FileIO(this, file);
      fileIO.fileToLines(file);
      state = 4;
    }
    // going back to loop after swing is finished
    loop();
  }


// 2nd file Chooser function that works better
  void fileChooser2() {
    // Opens the dialog box
    selectInput("Select a file to process:", "fileSelected");  
    fileChooserOpen = false;
  }


// Function that handles the input after the user has chosen a file. Called in main file
  void handleFileSelected(File selection) {
    // If the user did not select a file
    if (selection == null) {
      println("Window was closed or the user hit cancel.");
    } 
    else {
       // Setting the file to this file chosen and creating a new fileIO class with this file
      file = selection;
      fileIO = new FileIO(this, file);
      fileIO.fileToLines(file);
      state = 4;
    }
  }


// Function that creates a new file based on the users input for a name.
  void createNewFile() {
    // Default name
    String name = "file1.txt";
    if (!newFileNamed) {
      noLoop();
      // Using swing to open a dialof box and take user input
      name = JOptionPane.showInputDialog(frame, "What Would You Like To Name Your File?", "New File", JOptionPane.PLAIN_MESSAGE);
      newFileNamed = true;
      loop();
    }
    // Creting a file with this name in the sketch folder and creating a new FileIO object
    file = new File(sketchPath("") + name);
    fileIO = new FileIO(this, file);
    state = 4;
  }
}