class ChoosePlayer2P{//2P狀態下2P選角
  
  PImage wordPlayer1;
 void display(){
  
  image(backgroundChoosePlayer2P,0,0);
  image(wordPlayer1,100,440);
  if(rollOf1P==1){
  image(mouse,103,493,139,109);
  }
  else if(rollOf1P==2){
  image(dog,120,486,104,116);
  }
  else{
  image(cat,106,493,126,108);
  }
  
   if(chooseState2P<0){
   chooseState2P=101;
   }
   //選老鼠
   if(chooseState2P % 3 == 2){
    
    image(mouse,400,300);
    image(dogWhite,120,90);
    image(catWhite,800,90);
    image(wordMouse,0,602);
    player2 = new Mouse();
    rollOf2P=1;
    }
    //選狗
    else if(chooseState2P % 3 == 1){
    
    image(mouseWhite,720,90);
    image(dog,470,320);
    image(catWhite,75,90);
    image(wordDog,0,602);
    player2 = new Dog();
    rollOf2P=2;
    }
    //選貓
   else {   
    image(mouseWhite,20,90);
    image(dogWhite,820,90);
    image(cat,460,320);
    image(wordCat,0,602);
    player2 = new Cat();
    rollOf2P=3;
    }
 }
   

ChoosePlayer2P(){
 wordPlayer1=loadImage("img/wordPlayer1.png");
}

}