class Mouse extends Player {
  PImage mouseImg;
  PImage[] pitchImg;
  boolean behittttt;
  int change=0;
  int movie;
  int state = 0;
  final int idle = 0,pitch = 1, behit = 2;
  
  Mouse() {
  //  mouseImg = loadImage("img/mouse/right/mouseImg.png");
    bigheadImg = loadImage("img/mouse/right/bighead.png");
    bigImg = loadImage("img/mouse/right/big.png");
    headImg = loadImage("img/mouse/right/head.png");
    behitImg = loadImage("img/mouse/right/behit.png");
    notbehitImg = loadImage("img/mouse/right/notbehit.png");
    weaponImg = loadImage("img/mouse/right/weapon.png");
    pitchImg = new PImage[5];
    for (int i = 0; i < 5; i++) {
      pitchImg[i] = loadImage("img/mouse/right/pitch" + i + ".png");
    }
    mouseImg = pitchImg[0];
    //translate(x+36, y+39);
 //   weapon = new Weapon(weaponImg,136,639);
  }
  void display(){
    image(mouseImg,80,500);
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
        mouseImg = pitchImg[movie];
         break;
       case behit:
         break;
     }
  }
 /* void weapondisplay(int angle,int str){
    super.weapondisplay(angle,str);
  }*/
  
}