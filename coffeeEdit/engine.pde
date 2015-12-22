class Engine{
 PFont font;
 PFont menuFont;
 int textSize = 50,lineCounter = 1;
 ArrayList<TextLine> lines = new ArrayList<TextLine>();
 int currentLine = 0, lettersAcross = (width/textSize) * 2 - 3, state = 1;
 Cursor c;
 MainMenu mm;
 ControlP5 cp5;
 PApplet sketch;
 
 
 /*
 States:
 1 - Main Menu
 2- About Screen
 3 - word editor
 
 
 
 
 */
 
  Engine(PApplet theSketch){
  sketch = theSketch;
  lines.add(new TextLine(this,textSize + 10));
  c = new Cursor(this,0,textSize+10);
  cp5 = new ControlP5(sketch);
  mm = new MainMenu(this);
  font = createFont("consola.ttf",textSize);
  menuFont = createFont("KGSkinnyLatte.ttf",textSize);
  textFont(menuFont);
  }



void run(){
  if(state == 3){ 
  textFont(font);
  dispText();
  c.display();
  }
  if(state == 1){
  mm.display();
  }
  if(state == 2){
    background(0,255,0);
  }
}



void dispText(){
  for (TextLine line : lines) {
  line.display();
}

  lines.get(currentLine).newLine();
  

}


void handleAllKeys(){
  for (TextLine line : lines) {
  line.handleKeys();
}
}
}