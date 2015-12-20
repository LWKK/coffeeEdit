class MainMenu{
 PImage cup;
 CoffeeSteam cs;
 
 
 MainMenu(){
   cup = loadImage("coffeeCup.png");
   cup.resize(200,0);
   cs = new CoffeeSteam(300,100);
 }
  
  
  void display(){
    cs.display();
    image(cup,width/3,(height/3) * 2);
  }
  
  
}