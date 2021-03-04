class ChooseDifficulty{//選擇難易
  PImage backgroundDifficulty,clicked1star, touched1star,clicked2star, touched2star,clicked3star, touched3star;
  
   void display(){
    image(backgroundDifficulty,0,0);
    //choose1star
    if(mouseY>268 && mouseY<537 && mouseX>131 && mouseX<400){
    image(touched1star,131,268);
        if (mousePressed) {
        image(clicked1star,131,268); 
        gameState=CHOOSE_PLAYER_ONLY1P;
        gameDifficulty=1;//1P遊戲難度回傳值(一星)
        player2 = new Cat();
        mousePressed = false;     
      }
    }
    //choose2star
    if(mouseY>268 && mouseY<537 && mouseX>463 && mouseX<732){
    image(touched2star,463,268);
        if (mousePressed) {
        image(clicked2star,463,268); 
        gameState=CHOOSE_PLAYER_ONLY1P;
        gameDifficulty=2;//1P遊戲難度回傳值(二星)
        player2 = new Mouse();
        mousePressed = false;
      }
    }
    //choose3star
    if(mouseY>268 && mouseY<537 && mouseX>800 && mouseX<1069){
    image(touched3star,800,268);
        if (mousePressed) {
        image(clicked3star,800,268); 
        gameState=CHOOSE_PLAYER_ONLY1P;
        gameDifficulty=3;//1P遊戲難度回傳值(三星)
        player2 = new Dog();
        mousePressed = false;
      }
    }
  }
  
  ChooseDifficulty(){
  backgroundDifficulty=loadImage("img/backgroundDifficulty.png");
  clicked1star=loadImage("img/clicked1star.png");
  touched1star=loadImage("img/touched1star.png");
  clicked2star=loadImage("img/clicked2star.png");
  touched2star=loadImage("img/touched2star.png");
  clicked3star=loadImage("img/clicked3star.png");
  touched3star=loadImage("img/touched3star.png");
  }
  void mousePressed(){
     clicked =1; 
    }
  void mouseReleased(){
      clicked = 0;
    }
   }