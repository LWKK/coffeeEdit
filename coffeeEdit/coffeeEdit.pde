Engine e;

void setup(){
 //size(displayWidth,displayHeight);
 size(400,400);
 e = new Engine();
 //orientation(PORTRAIT);
}




void draw(){
  background(255);
  e.run();
  
}

void keyPressed(){
  e.handleAllKeys();
}