class Engine{
 PFont font;
 int textSize = 50,lineCounter = 1;
 ArrayList<TextLine> lines = new ArrayList<TextLine>();
 int currentLine = 0, lettersAcross = (width/textSize) * 2 - 3, state = 1;
 Cursor c;
 
 MainMenu mm;
 
  Engine(){
  lines.add(new TextLine(this,textSize + 10));
  c = new Cursor(this,0,textSize+10);
  
  mm = new MainMenu();
  font = createFont("consola.ttf",textSize);
  textFont(font);
  }



void run(){
  if(state == 2){  
  dispText();
  c.display();
  }
  if(state == 1){
  
  mm.display();
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