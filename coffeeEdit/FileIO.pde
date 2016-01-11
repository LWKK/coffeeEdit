class FileIO{
 
  Engine e;
  File file;
  PrintWriter fileSaver;
  
  FileIO(Engine e_,File file_){
    e = e_;
    file = file_;
   // fileSaver.createWriter(file);
    
    
  }
  
  
  void saveText(TextLine[] lines_){
     for (TextLine line : lines_) {
       String temp =  line.letters + "\n";
       fileSaver.println(temp);
       
     }
     fileSaver.flush();
     fileSaver.close();
    
  }
  
  
  
  
  
  
}