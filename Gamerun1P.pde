class Gamerun1P {
  PImage setImg;
  PImage bgImg, nineImg, manaImg, gdImg, manasetImg;
  PImage[] bloodImg;
  PImage arrowImg, turnUImg, strImg, strsetImg;
  PFont font;
  float str = 0.0;
  int strspeed = 1;
  int turn = 0;
  int angle = -20, anglespeed = 2;
  int angle1 = 0;
  final int GAME_INIT_TIMER = 10800;
  int gameTimer = GAME_INIT_TIMER;
  int target = 0;
  int time1 = 0, time2 = 0, time = 0;
  int twohittime = 0;
  Gamerun1P() {
    setImg = loadImage("img/blood/set.png");
  //  bgImg =loadImage("img/bg/bg.png");
    nineImg =loadImage("img/bg/nine.png");
    gdImg =loadImage("img/bg/ground.png");
    manaImg =loadImage("img/mana/mana.png");
    manasetImg =loadImage("img/mana/set.png");
    arrowImg=loadImage("img/arrow.png");
    turnUImg=loadImage("img/turnU.png");
    strImg=loadImage("img/str.png");
    strsetImg=loadImage("img/strset.png");
    bloodImg = new PImage [3];

    for (int i= 0; i<3; i++)
      bloodImg[i] =loadImage("img/blood/"+ i +".png");
    font = createFont("font/font.ttf", 56);
    textFont(font);
    gameTimer = GAME_INIT_TIMER;
  }
  void bgdisplay() {
    image(bgImg, 0, 0);
   if(debugMode)
    image(nineImg, 0, 0);
    image(gdImg, 0, 0);
    //player 1
    image(manaImg, 123, 80, player1.mana, 15);
    image(setImg, 120, 80, 300, 15);
    image(bloodImg[bloodImgset(player1.blood)], 120, 50, player1.blood, 30);//bloodImgset
    image(setImg, 120, 50, 400, 30);//423*89
    if(player1.bigmama)
      image(player1.bigheadImg, 3, 0);
    else if(player1.bigmama ==false)
      image(player1.headImg, 3, 0);
    player1.thingdisplay();
    pushMatrix();
    translate(1200, 0);
    scale(-1, 1);
    player2.thingdisplay();
    popMatrix();

    //player1 show1
    if (turn1 == true) {
      image(turnUImg, 120, 400, 50, 87);
      pushMatrix();
      translate(200, 600);
      rotateZ(radians(angle));
      image(arrowImg, 0, 0, 100, 50);
      popMatrix();

      //鍵頭 投擲
      switch(turn) {
      case 0:
        angle += anglespeed;
        if (angle < -50 || angle > 10) {
          anglespeed *= -1;
        } else if (space == true) {
          //      weapon = new Weapon(player1.weaponImg,136,639);
          turn = 1;
        }    
        break;
      case 1:
        if (space == true) {
          str+=strspeed;
          if (str > 50 || str < 0)
            strspeed *= -1; 
          image(strsetImg, 40, 500, 24, 51*14/5);
          image(strImg, 40, 640-abs((str-0.65)*14/5), 24, (str)*14/5);
        } else {
          turn++;           
          if (angle<=10 && angle > -10) {
            angle1 = 10;
            if (str<=20 && str > 10) {
              str = 6;
              target = 7;
            } else if (str<=30 && str > 20) {
              str = 20;
              target = 8;
            } else if (str<=40 && str >= 30) {
              str = 32;
              target = 9;
            } else if (str<=10)
              str = -20;
            else 
            str = 50;
          } else if (angle<=-10 && angle > -35) {
            angle1 = -20;
            if (str<=20 && str > 10) {
              str = 3;
              target = 4;
            } else if (str<=30 && str > 20) {
              str = 15;
              target = 5;
            } else if (str<=40 && str >= 30) {
              str = 27;
              target = 6;
            } else if (str<=10)
              str = -20;
            else 
            str = 40;
          } else if (angle<=-35 && angle >= -50) {
            angle1 = -40;
            if (str<=20 && str > 10) {
              str = 0;
              target = 1;
            } else if (str<=30 && str > 20) {
              str = 10;
              target = 2;
            } else if (str<=40 && str >= 30) {
              str = 22;
              target = 3;
            } else if (str<=10)
              str = -10;
            else 
            str = 40;
          }
        }  
        break;
        case 142:
         player1.bigmama =false;
         weapon[1].weaponImg = player1.weaponImg;
         weapon[1].bigupdate(0);
                          switch(twohittime){
                            case 0:
                              twohittime++;
                              angle1 = -20;
                              str = 27;
                              target = 6; 
                            break;            
                            default:
                            twohittime++;
                            if (twohittime < 26)
                              player1.update();
                            if (twohittime >18 && twohittime < 121)
                              player1.weapondisplay(angle1, str, 1);
                            if(twohittime == 121){
                            }
                            if (twohittime >= 121) {
                              weapon[1].setzero();
                              pushMatrix();
                              translate(1200, 0);
                              scale(-1, 1);
                              player2.thingdisplay();
                              player2.behitdisplay(target);
                              popMatrix();
                              str = 0;
                              if(target == 6)
                                player2.blood -= 2;
                              // if(angle <-10
                            }
                            if(twohittime == 141){
                               player1.mana +=30;
                             }       
                    //two
                             if (twohittime < 52 &&twohittime >= 26)
                              player1.update();
                            if (twohittime >52 && twohittime < 147)
                              player0.weapondisplay(angle1, str, 0);
                            if(twohittime == 147){
                            }
                            if (twohittime >= 147) {
                              weapon[0].setzero();
                              pushMatrix();
                              translate(1200, 0);
                              scale(-1, 1);
                              player2.thingdisplay();
                              player2.behitdisplay(target);
                              popMatrix();
                              str = 0;
                              if(target == 6)
                                player2.blood -= 2;
                              // if(angle <-10          
                            }
                            if(twohittime == 167){
                               player1.mana +=30;
                               target = 0;
                               twohittime = 0;
                               player2.hittime = 0;
                               intialset();
                               weapon[1].bigupdate(0);
                               player1.twohit = false;
                               turn1 = false;
                               turn = 0;
                             }
                        break;
                      
                      }
          break;
      default:
      if(player1.bigmama){
         if(turn>=2 && turn <62)
           player1.mana -=5;
        }
        if (turn < 26)
          player1.update();
        if (turn >18 && turn < 121)
          player1.weapondisplay(angle1, str, 1);
        turn++;
        if (turn == 121) {
        }
        if (turn >= 121) {
          weapon[1].setzero();
          pushMatrix();
          translate(1200, 0);
          scale(-1, 1);
          player2.thingdisplay();
          player2.behitdisplay(target);
          popMatrix();
          str = 0;
          if(target == 6){
            if(weapon[1].a==200)
              player2.blood -= 6;
            else
              player2.blood -= 2;
            if(player1.bigmama)
              player2.blood -=4;
          }
        }
        if (turn == 141) {
          weapon[1].bigupdate(0);
          targetcheck(player1, target,1);
          player1.mana +=30;
          intialset();
          player2.hittime = 0;
          player1.bigmama =false;
          weapon[1].weaponImg = player1.weaponImg;
          if(player1.twohit)
             turn = 142;
           else
             turn1 = false;
        }
        break;
      }
    }
    //player 2 show2   
    //if(space == true){ 
    pushMatrix();
    translate(1200, 0);
    scale(-1, 1);
    image(manaImg, 123, 80, player2.mana, 15);
    image(setImg, 120, 80, 300, 15);
    image(bloodImg[bloodImgset(player2.blood)], 120, 50, player2.blood, 30);//bloodImgset
    image(setImg, 120, 50, 400, 30);//423*89
    if(player2.bigmama)
      image(player2.bigheadImg, 3, 0);
    else if(player2.bigmama ==false)
      image(player2.headImg, 3, 0);
    if (turn1 == false) {
      image(turnUImg, 120, 400, 50, 87);
      pushMatrix();
      translate(200, 600);
      rotateZ(radians(angle));
      image(arrowImg, 0, 0, 100, 50);
      popMatrix();
      //鍵頭 投擲
      switch(turn) {
      case 0:
        angle += anglespeed;
        if (time+1 == time1) {
          println(time1);
          space2 = true;
          turn = 1;
          time = 0;
          //time = 0;
        }
        if (angle < -50 || angle > 10) {
          anglespeed *= -1;
        } else if (space2 == true) {
          //      weapon = new Weapon(player1.weaponImg,136,639);
          turn = 1;
          time = 0;
        }   
        time++;
        break;
      case 1:
        if (space2 == true) {
          str+=strspeed;
          if (str > 50 || str < 0)
            strspeed *= -1; 
          image(strsetImg, 40, 500, 24, 51*14/5);
          image(strImg, 40, 640-abs((str-0.65)*14/5), 24, (str)*14/5);
          time++;
          if (time == time2) {
            space2 = false;
            time = 0;
          }
        } 
        else {
          turn++;           
          if (angle<=10 && angle > -10) {
            angle1 = 10;
            if (str<=20 && str > 10) {
              str = 6;
              target = 7;
            } else if (str<=30 && str > 20) {
              str = 20;
              target = 8;
            } else if (str<=40 && str >= 30) {
              str = 32;
              target = 9;
            } else if (str<=10)
              str = -20;
            else 
            str = 50;
          } else if (angle<=-10 && angle > -35) {
            angle1 = -20;
            if (str<=20 && str > 10) {
              str = 3;
              target = 4;
            } else if (str<=30 && str > 20) {
              str = 15;
              target = 5;
            } else if (str<=40 && str >= 30) {
              str = 27;
              target = 6;
            } else if (str<=10)
              str = -20;
            else 
            str = 40;
          } else if (angle<=-35 && angle >= -50) {
            angle1 = -40;
            if (str<=20 && str > 10) {
              str = 0;
              target = 1;
            } else if (str<=30 && str > 20) {
              str = 10;
              target = 2;
            } else if (str<=40 && str >= 30) {
              str = 22;
              target = 3;
            } else if (str<=10)
              str = -10;
            else 
            str = 40;
          }
        }  
        break;
        case 142:
         player2.bigmama =false;
         weapon[2].weaponImg = player2.weaponImg;
         weapon[2].bigupdate(0);
                          switch(twohittime){
                            case 0:
                              twohittime++;
                              angle1 = -20;
                              str = 27;
                              target = 6; 
                            break;            
                            default:
                            twohittime++;
                            if (twohittime < 26)
                              player2.update();
                            if (twohittime >18 && twohittime < 121)
                              player2.weapondisplay(angle1, str, 2);
                            if(twohittime == 121){
                            }
                            if (twohittime >= 121) {
                              weapon[2].setzero();
                              pushMatrix();
                              translate(1200, 0);
                              scale(-1, 1);
                              player1.thingdisplay();
                              player1.behitdisplay(target);
                              popMatrix();
                              str = 0;
                              if(target == 6)
                                player1.blood -= 2;
                              // if(angle <-10
                            }
                            if(twohittime == 141){
                               player2.mana +=30;
                             }       
                    //two
                             if (twohittime < 52 &&twohittime >= 26)
                              player2.update();
                            if (twohittime >52 && twohittime < 147)
                              player0.weapondisplay(angle1, str, 0);
                            if(twohittime == 147){
                            }
                            if (twohittime >= 147) {
                              weapon[0].setzero();
                              pushMatrix();
                              translate(1200, 0);
                              scale(-1, 1);
                              player1.thingdisplay();
                              player1.behitdisplay(target);
                              popMatrix();
                              str = 0;
                              if(target == 6)
                                player1.blood -= 2;
                              // if(angle <-10          
                            }
                            if(twohittime == 167){
                               player2.mana +=30;
                               target = 0;
                               twohittime = 0;
                               player1.hittime = 0;
                               turn1 = true;
                               intialset();
                               weapon[2].bigupdate(0);
                               player2.twohit = false;
                               turn = 0;
                             }
                        break;
                      
                      }
          break;
      default:
        if(player2.bigmama){
         if(turn>=2 && turn <62)
           player2.mana -=5;
        }
        if (turn < 26)
          player2.update();
        if (turn >18 && turn < 121)
          player2.weapondisplay(angle1, str, 2);
        turn++;
        if (turn == 121) {
        }
        if (turn >= 121) {
          weapon[2].setzero();
          pushMatrix();
          translate(1200, 0);
          scale(-1, 1);
          player1.thingdisplay();
          player1.behitdisplay(target);
          popMatrix();
          str = 0;
          if(target == 6){
            if(weapon[2].a==200)
              player1.blood -= 6;
            else
              player1.blood -= 2;
            if(player2.bigmama)
              player1.blood -=4;
            }
        }
        if (turn == 141) {
          weapon[2].bigupdate(0);
          targetcheck(player2, target,2);
          player2.mana +=30;
          intialset();
          player1.hittime = 0;
          player2.bigmama =false;
          weapon[2].weaponImg = player2.weaponImg;
          if(player2.twohit)
             turn = 142;
           else
             turn1 = true;
        }
        break;
      }
    }
    if((turn1==true && turn < 122)||turn1 ==false||(turn1 ==true &&turn ==142 && ((twohittime > 141 && twohittime < 147)||twohittime <121 || twohittime > 167))){
    player2.display();
    }  
    popMatrix();
    //thing
    //    }
    if((turn1==false && turn < 122)||turn1 ==true||(turn1 ==false &&turn ==142 && ((twohittime > 141 && twohittime < 147)||twohittime <121 || twohittime > 167))){
    player1.display();
    }
    //time
    textSize(45);
    textAlign(CENTER, BOTTOM);
    String timeString = convertFrameToTimeString(gameTimer);
    fill(0, 120);
    text(timeString, width/2 +3, 93);
    fill(getTimeTextColor(gameTimer));
    text(timeString, width/2, 90);
    gameTimer --;
    // if(gameTimer <= 0) gameState = GAME_OVER;
   if(player1.mana >= 300){
      player1.mana =300;
      player1.bigmama =true;
      weapon[1].weaponImg = player1.bigImg;
      weapon[1].bigupdate(1);
  }
    if(player2.mana >= 300){
      player2.mana =300;
      player2.bigmama =true;
      weapon[2].weaponImg = player2.bigImg;
      weapon[2].bigupdate(1);
  }
    if(player1.blood >= 400)
      player1.blood = 400;
    if(player2.blood >= 400)
      player2.blood = 400;
    if(gameTimer <= 0 || player1.blood <= 0|| player2.blood <= 0){
      gameState = GAME_OVER;
    }
  }
  //functio

  color getTimeTextColor(int frames) {
    if (frames >= 7200) {
      return #00ffff;
    } else if (frames >= 3600) {
      return #ffffff;
    } else if (frames >= 1800) {
      return #ffcc00;
    } else if (frames >= 600) {
      return #ff6600;
    }

    return #ff0000;
  }  
  String convertFrameToTimeString(int frames) {
    String result = "";
    float totalSeconds = float(frames) / 60;
    result += nf(floor(totalSeconds/60), 2);
    result += ":";
    result += nf(floor(totalSeconds%60), 2);
    return result;
  }
  int bloodImgset(int bb) {
    if (bb >= 397) {
      return 0;
    } else if (bb > 150) {
      return 1;
    }
    return 2;
  }
  void targetcheck(Player player, int target,int i) {
    if (player.thingset[target]!=0) {
      switch(player.thingset[target]) {
      case 1:
      if(player.mana < 300){
        player.mana +=60;}
        player.thingset[target] = 0;
        break;
      case 2:
      if(player.blood < 400){
        player.blood +=40;}
        player.thingset[target] = 0;
        break;
      case 3:
        player.twohit = true;
        player0 = player;
        weapon[0]= new Weapon(player.weaponImg, 136, 610);
        player.thingset[target] = 0;
        break;
      case 4:
        weapon[i].bigupdate(1);
        player.thingset[target] = 0;
        break;
      }
    }
  }
  void intialset() {
    angle = -20;
    anglespeed = 2;
    str = 0.0;
    strspeed = 1;
    target = 0;
    turn = 0;
    if(gameDifficulty== 1){
    time1 = floor(random(1, 60));
    time2 = floor(random(1, 50));}
    else if(gameDifficulty== 2){
     do{     
    time1 = floor(random(1, 60));
      }while(time1%16 > 6 && time1%16 < 13);
    time2 = floor(random(18, 40));}
    else if(gameDifficulty== 3){
     do{     
    time1 = floor(random(1, 40));
      }while(time1%30 > 7 );//&& time1%16 < 13
    time2 = floor(random(30, 40));}
    time = 0;
  }
}