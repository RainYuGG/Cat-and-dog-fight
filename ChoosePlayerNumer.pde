class ChoosePlayerNumber{//選擇遊戲人數
  PImage background1P2P,clicked1P, touched1P,clicked2P, touched2P;
  void display(){
  image(background1P2P,0,0);
    //選1P
    if(mouseY>268 && mouseY<537 && mouseX>243 && mouseX<512){
    image(touched1P,243,268);
        if (mousePressed) {
        image(clicked1P,243,268);   
        gameState=CHOOSE_DIFFICULTY;
        mousePressed = false;
      }        
    }
    //選2P
    if(mouseY>268 && mouseY<537 && mouseX>684 && mouseX<953){
    image(touched2P,684,268);
        if (mousePressed) {
        image(clicked2P,684,268); 
        gameState=CHOOSE_PLAYER1P;
        mousePressed = false;
      }
    }
  }
  ChoosePlayerNumber(){
  background1P2P=loadImage("img/background1P2P.png");
  clicked1P=loadImage("img/clicked1P.png");
  touched1P=loadImage("img/touched1P.png");
  clicked2P=loadImage("img/clicked2P.png");
  touched2P=loadImage("img/touched2P.png");
  } 
 }