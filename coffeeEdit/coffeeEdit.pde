/*
 Coffee Edit
 A Java Source Code Editor
 
 Open a file (.txt only) or create a new one (also .txt)
 New files will be saved to this sketch's folder



Known Bugs:

Cursor is buggy on where it displays. Mostly due to difference between Capital and lowercase letters and where to spacing in between them is.
Cursor still works to type and delete mid string
Cursor is also buggy because textWidth() is not working properly
If you type really fast while pressing enter alot the program may lag, causing an error in moving the cursor after the key is pressed, resulting in an error that causes a crash


Enjoy!

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