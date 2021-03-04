class ChoosePlayer1P{//2P狀態下1P選角


 void display(){
   image(backgroundChoosePlayer1P,0,0);

   if(chooseState1P<0){
   chooseState1P=101;
   }
   //選老鼠
   if(chooseState1P % 3 == 2){
    image(mouse,400,300);
    image(dogWhite,120,90);
    image(catWhite,800,90);
    image(wordMouse,0,602);
    player1 = new Mouse();
    rollOf1P=1;
    
    }
    //選狗
    else if(chooseState1P % 3 == 1){
    image(mouseWhite,720,90);
    image(dog,470,320);
    image(catWhite,75,90);
    image(wordDog,0,602);
    player1 = new Dog();
    rollOf1P=2;
    }
    //選貓
   else {
    image(mouseWhite,20,90);
    image(dogWhite,820,90);
    image(cat,460,320);
    image(wordCat,0,602);
    player1 = new Cat();
     rollOf1P=3;
    }
 
 }
ChoosePlayer1P(){}

}