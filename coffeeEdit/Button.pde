class Button{
int x,y,w,h;
color hoverC,regC,dispC;
boolean hovering,clicked;
String text;

Button(int x_,int y_,int w_, int h_,color hover, color reg,String text_){
  x = x_;
  y = y_;
  regC = reg;
  dispC = reg;
  text = text_;
  w = w_;
  h = h_;
}


void display(){
  checkHover();
  checkClicked();
  fill(dispC);
  rect(x,y,w,h);
  //text(text,x,y);
}



void checkHover(){
  if((mouseX >= x && mouseX <= x+w) && (mouseY >= y && mouseY <= y + h)){
    hovering = true;
  }
 
 else{
   hovering = false;
 }
 
 if(hovering) dispC = hoverC;
 if(!hovering) dispC = regC;
  
}

void checkClicked(){
  if(hovering && mousePressed)clicked = true;
  else clicked = false;
}


}