final int GAME_START = 0, CHOOSE_PLAYER_NUMBER =1, CHOOSE_PLAYER1P = 2, GAME_RUN = 3, GAME_OVER = 4, GAME_WIN = 5, CHOOSE_DIFFICULTY=6, CHOOSE_PLAYER2P =7, CHOOSE_PLAYER_ONLY1P=8,GAME_RUN1P = 9;
int gameState = 0;
int gameDifficulty=0;//1P遊戲難度回傳值
int rollOf1P=0;   //1P角色選擇回傳值(1=鼠、2=狗、3=貓)
int rollOf2P=0;   //2P角色選擇回傳值
PImage cat, mouse, dog, catWhite, dogWhite, mouseWhite, wordCat, wordMouse, wordDog;
PImage backgroundChoosePlayer1P, backgroundChoosePlayer2P, choosePlayerBackground,introduction;
int clicked=0;
int chooseState1P=2;
int chooseState2P=2;
boolean debugMode=true;
boolean leftPressed=false;
boolean rightPressed=false;
boolean downPressed=false;
boolean space = false;
boolean space2 = false;
boolean leftMouse = false;
int timer = 0;
PImage[] bg =new PImage[3];
Player player1;
Player player2;
Player player0;
Weapon[] weapon = new Weapon [3];
//Gamestart gamestart;
//Choose choose;
boolean turn1 = true;
Gamerun gamerun;
Gameover gameover;
Gamerun1P gamerun1P;
Gamestart gamestart;
ChoosePlayerNumber choosePlayerNumber;//選擇遊戲人數
ChoosePlayerONLY1P choosePlayerONLY1P; //1P模式中1P選角
ChoosePlayer1P choosePlayer1P;//2P模式中1P選角
ChoosePlayer2P choosePlayer2P;//2P模式中2P選角
ChooseDifficulty chooseDifficulty;
int bgint = 0;
//Gamerun gamerun;
//Gameover gameover;

void setup() {
  size(1200, 800, P3D); 
  frameRate(60);
  introduction=loadImage("img/intro/duction.png");
  choosePlayerBackground=loadImage("img/choosePlayerBackground.png");
  backgroundChoosePlayer1P=loadImage("img/backgroundChoosePlayer1P.png");
  backgroundChoosePlayer2P=loadImage("img/backgroundChoosePlayer2P.png");
  wordDog=loadImage("img/wordDog.png");
  wordCat=loadImage("img/wordCat.png");
  wordMouse=loadImage("img/wordMouse.png");
  mouseWhite=loadImage("img/mouseWhite.png");
  dogWhite=loadImage("img/dogWhite.png");
  catWhite=loadImage("img/catWhite.png");
  dog=loadImage("img/dog.png");
  mouse=loadImage("img/mouse.png");
  cat=loadImage("img/cat.png");
  gamerun = new Gamerun();
  gamerun1P =new Gamerun1P();
  gamestart = new Gamestart();
  choosePlayerNumber = new ChoosePlayerNumber();
  choosePlayer1P = new ChoosePlayer1P();
  choosePlayer2P = new ChoosePlayer2P();
  chooseDifficulty = new ChooseDifficulty();
  choosePlayerONLY1P =new ChoosePlayerONLY1P();
  bgint = floor(random(0,3));
  for (int i= 0; i<3; i++){
      bg[i] =loadImage("img/bg/bg"+ i +".png");}
  // player1 = new Cat();
  //player2 = new Mouse();
  /*
  weapon[1]= new Weapon(player1.weaponImg,136,610);
   weapon[2]= new Weapon(player2.weaponImg,136,640);
   */
  space = false;
  leftMouse = false;
  gameState = GAME_START;


  //gamestart = new gamestart;
  //gamerun = new gamerun;
  gameover = new Gameover();
}
void draw() {

  switch (gameState) {

  case GAME_START: 
    gamestart.display();
    if (mouseX>=422&&mouseX<=772&&mouseY>=647&&mouseY<=756&&mousePressed) {
      gameState=CHOOSE_PLAYER_NUMBER;
    }
    break;
  case CHOOSE_PLAYER_NUMBER://選1P2P
    choosePlayerNumber.display();   
    break;

  case CHOOSE_DIFFICULTY://選難度
    chooseDifficulty.display();
    break;
  case CHOOSE_PLAYER_ONLY1P://1P選角色
    choosePlayerONLY1P.display();
    break; 
  case CHOOSE_PLAYER1P://1P選角色

    choosePlayer1P.display();

    break;
  case CHOOSE_PLAYER2P://2P選角色
    choosePlayer2P.display();
    break;  
  case GAME_RUN1P:
    timer ++;
    if(timer < 180)
    image(introduction,0,0);
    else
    gamerun1P.bgdisplay();
  break;
  case GAME_RUN:
    timer ++;
    //gamerun.display();
    if(timer < 180)
    image(introduction,0,0);
    else
    gamerun.bgdisplay();
    break;

  case GAME_OVER:
    gameover.display();
    break;

  case GAME_WIN:
    //gameover.win();
    break;
  }
}
void reset(){
  turn1= true;
  player1.blood = 400;
  player1.mana = 150;
  player2.blood = 400;
  player2.mana = 150;
  gamerun.gameTimer= 10800;
  gamerun1P.gameTimer=10800;
  gameDifficulty = 0;
  gamerun.str = 0.0;
  gamerun.strspeed = 1;
  gamerun.turn = 0;
  gamerun.angle = -20;
  gamerun.angle1 = 0;
  gamerun.target = 0;
  gamerun.twohittime =0;
  gamerun1P.str = 0.0;
  gamerun1P.strspeed = 1;
  gamerun1P.turn = 0;
  gamerun1P.angle = -20;
  gamerun1P.angle1 = 0;
  gamerun1P.target = 0;
  gamerun1P.twohittime =0;
  gamerun1P.time = 0;
  timer = 0;
}


void keyPressed() {
  if (key==32) {
    space = true;
  } 
  else if( key == 'd'){
    if(debugMode == false)
      debugMode = true;
    else
      debugMode = false;
    gamerun.gameTimer-=1000;
    gamerun1P.gameTimer-=1000;
  }
  else {
    switch(keyCode)
    {
    case LEFT:
      leftPressed = true;
      if (gameState==CHOOSE_PLAYER_ONLY1P) {
        chooseState1P-=1;
      }
      if (gameState==CHOOSE_PLAYER1P) {
        chooseState1P-=1;
      }
      if (gameState==CHOOSE_PLAYER2P) {
        chooseState2P-=1;
      }
      break; 
    case RIGHT:
      rightPressed = true;
      if (gameState==CHOOSE_PLAYER_ONLY1P) {
        chooseState1P+=1;
      }
      if (gameState==CHOOSE_PLAYER1P) {
        chooseState1P+=1;
      }
      if (gameState==CHOOSE_PLAYER2P) {
        chooseState2P+=1;
      }
      break;  
    case ENTER:
      downPressed =true;
      if (gameState==CHOOSE_PLAYER_ONLY1P) {
        weapon[1]= new Weapon(player1.weaponImg, 136, 610);
        weapon[2]= new Weapon(player2.weaponImg, 136, 610);
        bgint = floor(random(0,3));
        gamerun1P.bgImg = bg[bgint];
        gameState=GAME_RUN1P;
      }
      if (gameState==CHOOSE_PLAYER1P) {
        gameState=CHOOSE_PLAYER2P;
      }
      if (gameState==CHOOSE_PLAYER2P && rollOf2P!=0) {
        weapon[1]= new Weapon(player1.weaponImg, 136, 610);
        weapon[2]= new Weapon(player2.weaponImg, 136, 610);
        bgint = floor(random(0,3));
        gamerun.bgImg = bg[bgint];
        gameState=GAME_RUN;//2P選完角直接跳GAMERUN
      }
      break;
    }
  }
}


void keyReleased() {
  if (key==32) { 
    space = false;
  } else {
    switch(keyCode)
    {
    case LEFT:
      leftPressed = false;
      break; 
    case RIGHT:
      rightPressed = false;
      break;  
    case ENTER:
      downPressed = false;
      break;
    }
  }
  //}
}