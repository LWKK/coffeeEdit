class MainMenu{
 PImage cup;
 PImage mainText;
 CoffeeSteam cs1, cs2;
 Engine e;
 Button openFile,about,newFile;
 
 
 MainMenu(Engine e_){
   e = e_;
   openFile = new Button(50,200,100,40,color(30,122,78),color(130,55,20),"OPEN FILE",22);
   about = new Button(50,250,100,40,color(30,122,78),color(130,55,20),"ABOUT",22);
   newFile = new Button(50,300,100,40,color(30,122,78),color(130,55,20),"NEW FILE",22);
   cup = loadImage("coffeeCup.png");
   cup.resize(200,0);
   mainText = loadImage("homeText.png");
   mainText.resize(300,0);
   cs1 = new CoffeeSteam(300,100,width/3 + 105);
   cs2 = new CoffeeSteam(300,100,width/3 + 92);
 }
  
  
  void display(){
    
    buttons();
    cs1.display();
    cs2.display();
    image(cup,width/3,(height/3) * 2);
    textSize(59);
    fill(0);
    textAlign(LEFT);
    text("COFFEE EDIT",90,80);
    openFile.display();
    about.display();
    newFile.display();
  }
  
  
  void buttons(){
    if(about.clicked){
        e.state = 2;
    }
    if(openFile.clicked){
      e.state = 3;
    }
    
    if(newFile.clicked){
     e.state = 5; 
    }
    
  }
  
  
  
}