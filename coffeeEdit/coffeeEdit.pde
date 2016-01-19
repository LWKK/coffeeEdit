//import controlP5.*;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import java.io.*;
import java.nio.file.Files;

Engine e;

void setup(){
 //size(displayWidth,displayHeight);
 //size(400,400);
 size(600,400);
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

void fileSelected(File selection){
 e.handleFileSelected(selection); 
  
}