class Engine{
 int textSize = 50;
 ArrayList<TextLine> lines = new ArrayList<TextLine>();
 int currentLine = 0;
 
 
  Engine(){
  lines.add(new TextLine(this,textSize + 10));
  }



void run(){
  dispText();
  
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