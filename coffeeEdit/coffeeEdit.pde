//import controlP5.*;
import javax.swing.JFileChooser;

Engine e;

void setup(){
 //size(displayWidth,displayHeight);
 size(400,400);
 e = new Engine(this);
 //orientation(PORTRAIT);
}




void draw(){
  background(255);
  e.run();
  
}

void keyPressed(){
  e.handleAllKeys();
}