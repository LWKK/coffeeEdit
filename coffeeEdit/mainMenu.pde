class MainMenu{
 PImage cup;
 PImage mainText;
 CoffeeSteam cs1, cs2;
 Engine e;
 boolean aboutPressed = false;
 
 
 MainMenu(Engine e_){
   e = e_;
   cup = loadImage("coffeeCup.png");
   cup.resize(200,0);
   mainText = loadImage("homeText.png");
   mainText.resize(300,0);
   cs1 = new CoffeeSteam(300,100,width/3 + 105);
   cs2 = new CoffeeSteam(300,100,width/3 + 92);
   e.cp5.addButton("About")
         .setValue(0)
         .setPosition(100,100)
         .setSize(200,19);
         ;
 }
  
  
  void display(){
    buttons();
    cs1.display();
    cs2.display();
    image(cup,width/3,(height/3) * 2);
    textSize(59);
    fill(0);
    text("COFFEE EDIT",90,80);
    //image(mainText,20,20);
  }
  
  
  void buttons(){
    if(aboutPressed){
        e.state = 2;
    }
    
  }
  
  void About(int theValue){
    aboutPressed = true;
    println("PRESSED");
    
  }
  
  void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
}
  
  
}