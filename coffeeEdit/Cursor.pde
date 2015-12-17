class Cursor{
 int x,y,startBlink,startDelay,lineClicked; 
 boolean displayed;
 Engine e;
  
  Cursor(Engine e_,int x_, int y_){
   x = x_;
   y = y_;
   e = e_;
   startBlink = millis();
  }
  
  
  
 void display(){
   blink();
   setPos();
  if(displayed){
   line(x,y,x,y+e.textSize); 
  }
   
 }
 
 
 void blink(){
   if(millis() > startDelay + 1000 && !displayed){
    displayed = true;
    startBlink = millis();
   }
   
   else if(millis() > startBlink + 1000 && displayed){
    displayed = false;
    startDelay = millis();
   }
   
 }
 
 void setPos(){
   if(mousePressed){
    x = mouseX;
   // y = mouseY;
    
   if(mouseY > e.textSize*e.lineCounter){
    y = e.lines.get(e.lineCounter-1).y-e.textSize; 
   }
    
   }
   
 }
  
}