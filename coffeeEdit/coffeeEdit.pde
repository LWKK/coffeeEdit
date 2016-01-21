/*
 Coffee Edit
 A Java Source Code Editor
 
 





*/


// Importing all libraries needed
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import java.io.*;
import java.nio.file.Files;

//Object for the engine that runs the program
Engine e;


void setup(){
  // setting screen size and calling engine constructor
 size(600,400);
 e = new Engine(this);

}


void draw(){
  // calling the engine's function to run the appliacton
  e.run();
}


// handle keys with engine's function
void keyPressed(){
  e.handleAllKeys();
}


//handle file selection with engine's function
void fileSelected(File selection){
 e.handleFileSelected(selection); 
}