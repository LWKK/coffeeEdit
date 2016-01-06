class Engine {
  PFont font;
  PFont menuFont;
  int textSize = 50, lineCounter = 1;
  ArrayList<TextLine> lines = new ArrayList<TextLine>();
  int currentLine = 0, lettersAcross = (width/textSize) * 2 - 3, state = 1, prevState = 1;
  boolean fileChosen = false,newFileNamed = false;
  Cursor c;
  MainMenu mm;
 // ControlP5 cp5;
  PApplet sketch;
  File file;
  PrintWriter newFile;


  /*
 States:
   1 - Main Menu
   2- About Screen
   3 - Load File
   4 - main typing screen
   5 - New File
   */

  Engine(PApplet theSketch) {
    sketch = theSketch;
    lines.add(new TextLine(this, textSize + 10));
    c = new Cursor(this, 0, textSize+10);
    //cp5 = new ControlP5(sketch);
    mm = new MainMenu(this);
    font = createFont("consola.ttf", textSize);
    menuFont = createFont("KGSkinnyLatte.ttf", textSize);
    textFont(menuFont);
  }



  void run() {
    if (state == 4) { 
      textFont(font);
      dispText();
      c.display();
    }
    if (state == 1) {
      mm.display();
    }
    if (state == 2) {
      background(0, 255, 0);
    }
    if(state == 3 && !fileChosen){
      fileChooser();
    }
    if(state == 5){
      createNewFile();
    }
  }



  void dispText() {
    for (TextLine line : lines) {
      line.display();
    }

    lines.get(currentLine).newLine();
  }


  void handleAllKeys() {
    for (TextLine line : lines) {
      line.handleKeys();
    }
  }
  
  
  void fileChooser(){
    noLoop();
    JFileChooser chooser = new JFileChooser();
chooser.setFileFilter(chooser.getAcceptAllFileFilter());
int returnVal = chooser.showOpenDialog(null);
if (returnVal == JFileChooser.APPROVE_OPTION) 
{
  fileChosen = true;
  file = chooser.getSelectedFile();
  println("You chose to open this file: " + chooser.getSelectedFile().getName());
}
loop();
 
  }
  
  
  
  void createNewFile(){
    String name = "";
    if(!newFileNamed){
      noLoop();
      name = JOptionPane.showInputDialog(frame, "What Would You Like To Name Your File?","New File",JOptionPane.PLAIN_MESSAGE);
      newFileNamed = true;
      loop();
    }
    
    newFile = createWriter(name);
    
  }
}