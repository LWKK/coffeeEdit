class Engine {
  PFont font;
  PFont menuFont;
  PFont aboutFont;
  int textSize = 15, lineCounter = 1;
  ArrayList<TextLine> lines = new ArrayList<TextLine>();
  int currentLine = 0, lettersAcross = (width/textSize) * 2 - 3, state = 1, prevState = 1;
  boolean fileChosen = false,newFileNamed = false,fileChooserOpen = false;
  Button backButton;
  Cursor c;
  FileIO fileIO;
  MainMenu mm;
 // ControlP5 cp5;
  PApplet sketch;
  File file;
  PrintWriter newFile;
  float actualW = 600,w,h,scaleRatio,fontRatio = 0.44;


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
    lines.add(new TextLine(this, textSize + 45));
    c = new Cursor(this, 10,45);
    backButton = new Button(5,5,40,30,color(30,122,78),color(0, 102, 102),"BACK",12);
    //cp5 = new ControlP5(sketch);
    mm = new MainMenu(this);
    font = createFont("AndaleMono", textSize);
    menuFont = createFont("KGSkinnyLatte.ttf", textSize);
    aboutFont = createFont("KasseFLF.ttf",textSize);
    textFont(menuFont);
    //println("TEXT WIDTH" + textWidth('i'));
  }






  void run() {
    if (state == 4) { 
      textFont(font);
      dispText();
      c.display();
      fileIO.run();
    }
    if (state == 1) {
      textFont(menuFont);
      mm.display();
    }
    if (state == 2) {
      background(212, 164, 106);
      backButton.display();
      textFont(aboutFont);
      textAlign(CENTER,CENTER);
      textSize(35);
      text("Welcome To Coffee Edit",width/2,height/6);
      textSize(30);
      text("A Java Source Code Editor",width/2,height/3);
      textSize(25);
      text("Made By Lars Kishchuk", width/2,height*.66);
      if(backButton.clicked)state = 1;
    }
    
    if(state == 3 && !fileChosen){
     
      if(fileChooserOpen){
      fileChooser2();
      }
      
      fileChooserOpen = false;
    }
    if(state == 5){
      createNewFile();
    }
  }



  void dispText() {
    for (TextLine line : lines) {
      line.display();
    }

    lines.get(currentLine).handleCurrentLine();
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
  fileIO = new FileIO(this,file);
  state = 4;
  println("You chose to open this file: " + chooser.getSelectedFile().getName());
}
loop();
 
  }
  
  
  void fileChooser2(){
     selectInput("Select a file to process:", "fileSelected");  
     fileChooserOpen = false;
  }
  
  void handleFileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    file = selection;
    fileIO = new FileIO(this,file);
    fileIO.fileToLines(file);
    state = 4;
  }
}
  
  
  
  void createNewFile(){
    String name = "file1.txt";
    if(!newFileNamed){
      noLoop();
      name = JOptionPane.showInputDialog(frame, "What Would You Like To Name Your File?","New File",JOptionPane.PLAIN_MESSAGE);
      newFileNamed = true;
      loop();
    }
    file = new File(sketchPath("") + name);
   // newFile = createWriter(name);
    fileIO = new FileIO(this,file);
    
    state = 4;
  }
}