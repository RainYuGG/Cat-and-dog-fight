class Dog extends Player {
  PImage dogImg;
  PImage[] pitchImg;
  boolean behittttt;
  int change=0;
  int movie;
  int state = 0;
  final int idle = 0,pitch = 1, behit = 2;
  
  Dog() {
  //  dogImg = loadImage("img/dog/right/dogImg.png");
  bigheadImg = loadImage("img/dog/right/bighead.png");
    bigImg = loadImage("img/dog/right/big.png");
    headImg = loadImage("img/dog/right/head.png");
    behitImg = loadImage("img/dog/right/behit.png");
    notbehitImg = loadImage("img/dog/right/notbehit.png");
    weaponImg = loadImage("img/dog/right/weapon.png");
    pitchImg = new PImage[5];
    for (int i = 0; i < 5; i++) {
      pitchImg[i] = loadImage("img/dog/right/pitch" + i + ".png");
    }
    dogImg = pitchImg[0];
    //translate(x+36, y+39);
 //   weapon = new Weapon(weaponImg,136,639);
  }
  void display(){
    image(dogImg,80,500);
  }
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
        dogImg = pitchImg[movie];
         break;
       case behit:
         break;
     }
  }
 /* void weapondisplay(int angle,int str){
    super.weapondisplay(angle,str);
  }*/
  
}