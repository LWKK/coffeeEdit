class FileIO{
 
  Button saveButton;
  Engine e;
  File file;
  PrintWriter fileSaver;
  DataOutputStream dataOut;
  
  FileIO(Engine e_,File file_){
    e = e_;
    file = file_;
   // fileSaver.createWriter(file);
   saveButton = new Button(5,5,30,30,color(30,122,78),color(0, 102, 102),"SAVE",12);
   try{
     dataOut = new DataOutputStream(new FileOutputStream(file.getAbsolutePath()));
   } catch (Exception e){
     println("FILE NOT FOUND");
   }
     
  }
  
  
  
  
  
  void run(){
    noStroke();
   fill(160, 168, 171);
   rect(0,0,width,35);
   saveButton.display(); 
   if(saveButton.clicked){
    saveGoodText(e.lines.toArray(new TextLine[0]), e.file); 
   }
  }
  
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
         dataOut.writeUTF(temp);
       }
       
       catch( Exception e){
        println("FAILED TO SAVE FILE"); 
       }
       
     }
    
  }
  
  
  
  
  
  
}