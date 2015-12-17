class Engine{
 int textSize = 50;
 ArrayList<TextLine> lines = new ArrayList<TextLine>();
 int currentLine = 0;
 Cursor c;
 
  Engine(){
  lines.add(new TextLine(this,textSize + 10));
  c = new Cursor(this,0,textSize+10);
  }



void run(){
  dispText();
  c.display();
  
}



void dispText(){
  for (TextLine line : lines) {
  line.display();
}

}


void handleAllKeys(){
  for (TextLine line : lines) {
  line.handleKeys();
}
}







}