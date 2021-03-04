class Player{
  int blood; 
  int mana;
  PImage[] thing = new PImage[5];
  PImage bigheadImg;
  int[] thingset = new int[10];
  PImage blueImg,redImg,twoImg,bigImg,behitImg, notbehitImg;
  PImage weaponImg, headImg;
  int rand1,rand2 =5,rand3,rand4=5;
  int nowant;
  boolean twohit;
  boolean bigmama =false;
  int hittime = 0;
  Player(){
    blood = 400;
    mana = 150;
    rand2 = 5;
    blueImg = loadImage("img/thing/blue.png");
    redImg = loadImage("img/thing/red.png");
    twoImg = loadImage("img/thing/two.png");
    bigImg = loadImage("img/thing/big.png");
    nowant =floor(random(1,5));
    for(int j = 0;j<10;j++){
      thingset[j] = 0;
    }
    for(int i = 1;i < 6;i++){
      if(i == nowant)
        continue;
      /*do {
        rand1 =floor(random(1,5));
      }while(rand1==rand2 || rand1 == rand4);
      rand4 =rand2;
      rand2 = rand1;*/
      if(i == 5){
        do{
         rand3 = ceil(random(0,9));
      }while(thingset[rand3]!=0 ||rand3 ==6);
      rand1 =floor(random(1,5));
      switch(rand1){
        case 1:
          thing[nowant] = blueImg;
          thingset[rand3] = 1;
          break;
        case 2:
          thing[nowant] = redImg;
          thingset[rand3] = 2;
          break;
        case 3:
          thing[nowant] = twoImg;
          thingset[rand3] = 3;
          break;
        case 4: 
          thing[nowant] = bigImg;
          thingset[rand3] = 4;
          break;
      }
        break;
      }
      do{
         rand3 = ceil(random(0,9));
      }while(thingset[rand3]!=0 ||rand3 ==6);
      switch(i){
        case 1:
          thing[i] = blueImg;
          thingset[rand3] = 1;
          break;
        case 2:
          thing[i] = redImg;
          thingset[rand3] = 2;
          break;
        case 3:
          thing[i] = twoImg;
          thingset[rand3] = 3;
          break;
        case 4: 
          thing[i] = bigImg;
          thingset[rand3] = 4;
          break;
      }
    }
  }
  void display(){
  
  }
  void behitdisplay(int target){
    if(target == 6){
      if(hittime < 25)
        image(behitImg,80,500);   
      else
        image(behitImg,55,475,200,200);
    }
    else{
      if(hittime < 25)
       image(notbehitImg,80,500); 
      else
       image(notbehitImg,55,475,200,200);
        
    }
    hittime++;
    hittime %= 50;
  }
  void update(){}
  void weapondisplay(int angle,float str,int i){
    weapon[i].update(angle,str);
    weapon[i].display();
  }
  void thingdisplay(){
    //1-3
    for(int i = 0;i < 3;i++){
      if(thingset[i+1]!=0){
        image(thing[thingset[i+1]],740+110*i,480);
      }
    }
    for(int i = 0;i < 2;i++){
      if(thingset[i+4]!=0){
        image(thing[thingset[i+4]],770+i*120,570);
      }
    
    }
    for(int i = 0;i <3;i++){
       if(thingset[i+7]!=0){
        image(thing[thingset[i+7]],810+i*125,670);
      }
      //7 image(blueImg,810,670);
     //8 image(blueImg,935,670);
    //9 image(blueImg,1060,670);
    }
  }
}