class Button{
int x,y,w,h,textSize;
color hoverC,regC,dispC;
boolean hovering,clicked;
String text;

Button(int x_,int y_,int w_, int h_,color hover, color reg,String text_,int textS){
  x = x_;
  y = y_;
  regC = reg;
  dispC = reg;
  hoverC = hover;
  text = text_;
  w = w_;
  h = h_;
  textSize = textS;
}


void display(){
  checkHover();
  checkClicked();
  noStroke();
  fill(dispC);
  rect(x,y,w,h);
  fill(255);
  textSize(textSize);
  textAlign(CENTER,CENTER);
  text(text,x+w/2,y+h/2);
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