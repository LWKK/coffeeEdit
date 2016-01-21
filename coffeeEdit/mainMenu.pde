// Class for the main menu and all it's components

class MainMenu {
  PImage cup;
  CoffeeSteam cs1, cs2;
  Engine e;
  Button openFile, about, newFile;


  // Constructor. Instantiating all other classes needed for the menu including buttons and steam. 
  MainMenu(Engine e_) {
    e = e_;
    openFile = new Button(50, 200, 100, 40, color(30, 122, 78), color(130, 55, 20), "OPEN FILE", 22);
    about = new Button(50, 250, 100, 40, color(30, 122, 78), color(130, 55, 20), "ABOUT", 22);
    newFile = new Button(50, 300, 100, 40, color(30, 122, 78), color(130, 55, 20), "NEW FILE", 22);
    cup = loadImage("coffeeCup.png");
    cup.resize(200, 0);
    cs1 = new CoffeeSteam(((height/3) * 2)+40, 100, width/3 + 100);
    cs2 = new CoffeeSteam(((height/3) * 2)+40, 100, width/3 + 92);
  }


  // Function to dispay the main menu and all it's components
  void display() {
    buttons();
    cs1.display();
    cs2.display();
    image(cup, width/3, (height/3) * 2);
    textSize(59);
    fill(0);
    textAlign(CENTER, CENTER);
    text("COFFEE EDIT", width/2, height/8);
    openFile.display();
    about.display();
    newFile.display();
  }


  // Handles all of the buttons if they are clicked and changes the engine state accordingly
  void buttons() {
    if (about.clicked) {
      e.state = 2;
    }
    if (openFile.clicked) {
      e.state = 3;
      e.fileChooserOpen = true;
    }
    if (newFile.clicked) {
      e.state = 5;
    }
  }
}