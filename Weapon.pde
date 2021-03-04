class Weapon{
  float ytest=950.0;
  int a=100,b=0;
  float xtest=150.0;
  float lr;//=-0.015;
  float x,y;
  float speed=100.0;
  float xspeed=(950.0-xtest)/speed;
  float yspeed=(950.0+ytest)/speed;
  float g = 2*yspeed/speed+lr;
  int t=0;
  float angle = 0;
  /*目前給的數值是從中後丟到中後
  xtest每150會往前一格，也就是力道控制室控制xtest
  ytest是控制投擲角度0是45度到1000大概80度
  lr是控制左右，0.025是丟到九宮個下面3格 ，-0.025是丟到上面3格
  */
  //丟到下面的角度:ytest=50.0
  
  PImage weaponImg;
  Weapon(PImage filename,float x,float y){
    weaponImg = filename;
    this.x = x;
    this.y = y;
    
  }
  void bigupdate(int i){
    if(i==0)
      a =100;
    else
      a =200;
  }
   void display(){
     imageMode(CENTER);   
     pushMatrix();
     translate(x, y);
     rotate(radians(angle));
     image (weaponImg,0,0,a,a);
     popMatrix();
     angle+=35;
     imageMode(CORNER);
   }
  void update(int angle,float str){
    if(t == 1){
      if(angle < -30){ytest = 950;
      xtest = (30-str)*10;
       //  lr = -0.025;
      }
      else if(
        angle <-10){ytest = 600;
        xtest = (30-str)*10;
   //     lr = 0.0;  
     }
      else {
        ytest = 200;
        xtest = (30-str)*10;
       // lr = 0.025;
      }
      xspeed=(950.0-xtest)/speed;
      yspeed=(950.0+ytest)/speed;
      lr = (angle+20)/1200.0;
      g = 2*yspeed/speed+lr;
  }
    if(t <speed){
    t+=1;
    yspeed -= g;
    this.x += xspeed;
    this.y -= yspeed;
    }
    else if(t==speed){
      xspeed=0;
      yspeed=0;
      g=0;

      
      //x = -10000;
    }   
}

 void setzero(){
      this.x=136.0;
      this.y=610.0;
      t=0;
 }
  
}