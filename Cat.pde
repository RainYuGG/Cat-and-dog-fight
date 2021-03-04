class Cat extends Player {
  PImage catImg;
  PImage[] pitchImg;
  boolean behittttt;
  int change=0;
  int movie;
  int state = 0;
  int hittime = 0;
  
  final int idle = 0,pitch = 1, behit = 2;
  Cat() {
   // stayImg = loadImage("img/cat/right/stay.png");
    bigheadImg = loadImage("img/cat/right/bighead.png");
    bigImg = loadImage("img/cat/right/big.png");
    headImg = loadImage("img/cat/right/head.png");
    behitImg = loadImage("img/cat/right/behit.png");
    notbehitImg = loadImage("img/cat/right/notbehit.png");
    weaponImg = loadImage("img/cat/right/weapon.png");
    pitchImg = new PImage[6];
    for (int i = 0; i < 5; i++) {
      pitchImg[i] = loadImage("img/cat/right/pitch" + i + ".png");
    }
    catImg = pitchImg[0];
    //translate(x+36, y+39);
  }
  void display(){
    image(catImg,80,500);
  }
/*  void behitdisplay(int target){
    if(target == 6){
      if(hittime < 25)
        image(behitImg,55,475,200,200);
      else
        image(behitImg,80,500);
    }
    else{
      if(hittime < 25)
        image(notbehitImg,55,475,200,200);
      else
        image(notbehitImg,80,500);
    }
    hittime++;
    hittime %= 50;
  }*/
  void update(){
    switch(pitch){
      case idle:
         break;
      case pitch:
      // 60frames 12格影像
         change++;
         if(change %5 == 0)
         {
           movie++;
           movie %= 4;
         }
         else if(change == 24){
           change = 0;
         }
        catImg = pitchImg[movie];
         break;
       case behit:
         break;
     }
  }
  
}