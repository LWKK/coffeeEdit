// http://stackoverflow.com/questions/731365/reading-and-displaying-data-from-a-txt-file  Reading from file

class FileIO{
 
  Button saveButton;
  Engine e;
  File file;
  PrintWriter fileSaver;
  DataOutputStream dataOut;
  boolean saveClicked = false;
  
  
  PrintWriter out;
  
  FileIO(Engine e_,File file_){
    e = e_;
    file = file_;
   // fileSaver.createWriter(file);
   saveButton = new Button(5,5,30,30,color(30,122,78),color(0, 102, 102),"SAVE",12);
   try{
     dataOut = new DataOutputStream(new FileOutputStream(file.getAbsolutePath()));
   } catch (Exception e){
     println("FILE NOT FOUND");
     println(file.getAbsolutePath());
   }
     
  }
  
  
  
  
  
  void run(){
    noStroke();
   fill(160, 168, 171);
   rect(0,0,width,35);
   saveButton.display(); 
   if(saveButton.clicked){
    saveClicked = true;
   }
   
  if(!saveButton.clicked && saveClicked){
    //saveGoodText(e.lines.toArray(new TextLine[0]), e.file); 
    saveWriter(e.lines.toArray(new TextLine[0]), e.file); 
    saveClicked = false;
  }
  
  }
  
  //saveGoodText(e.lines.toArray(new TextLine[0]), e.file); 
  
  void saveText(TextLine[] lines_){
    
     for (TextLine line : lines_) {
       String temp =  line.letters + "\n";
       fileSaver.println(temp);
     }
     fileSaver.flush();
     fileSaver.close();
    
  }
  
  void saveGoodText(TextLine[] lines_, File file_){
    file = file_;
    for (TextLine line : lines_) {
       String temp =  line.letters + "\n";
       try{
         //dataOut.writeUTF(temp);
         dataOut.writeUTF(line.letters);
       }
       
       catch( Exception e){
        println("FAILED TO SAVE FILE"); 
       }
       
     }
    
  }
  
  
  void saveWriter(TextLine[] lines_, File file_){
      file = file_;
    for (TextLine line : lines_) {
       String[] temp = new String[1];
       temp[0] = line.letters + "\n";
       saveStrings(file.getName(),temp);
   
    
    }
  }
  
  
  void fileToLines(File file_){
    String[] lines = loadStrings(file.getName());
    println("PUTTING TO LINES");
    for(int i = 0; i <lines.length; i ++){
      if(i == 0){
        e.lines.add(new TextLine(e, e.textSize + 45,lines[i]));
        e.currentLine++;
        e.lineCounter ++;
        println("Line 1"+lines[i]);
      }
      else{
        e.lines.add(new TextLine(e, i*+e.textSize+3,lines[i]));
        e.currentLine ++;
        e.lineCounter++;
        println("Line x" + lines[i]);
      }
    }
    println(e.lineCounter);
  }
  
  
  
  
  
  
}