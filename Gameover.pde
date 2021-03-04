class Gameover{
PImage player1catwincatlose,player1mousewinmouselose,player1dogwindoglose,player2catwincatlose,player2mousewinmouselose,player2dogwindoglose;
PImage _1Pcatwin,_1Pcatlose,_1Pdogwin,_1Pdoglose,_1Pmousewin,_1Pmouselose;
PImage player1catwindoglose,player1catwinmouselose,player1mousewincatlose,player1mousewindoglose,player1dogwincatlose,player1dogwinmouselose;
PImage player2catwindoglose,player2catwinmouselose,player2mousewincatlose,player2mousewindoglose,player2dogwincatlose,player2dogwinmouselose;
PImage mouseHovered;
   Gameover(){
    // chooseBackground=loadImage("img/chooseBackground.png");
  _1Pcatwin=loadImage("img/_1Pcatwin.png");
  _1Pcatlose=loadImage("img/_1Pcatlose.png");
  _1Pdogwin=loadImage("img/_1Pdogwin.png");
  _1Pdoglose=loadImage("img/_1Pdoglose.png");
  _1Pmousewin=loadImage("img/_1Pmousewin.png");
  _1Pmouselose=loadImage("img/_1Pmouselose.png");  
  player1catwincatlose=loadImage("img/player1catwincatlose.png");
  player1mousewinmouselose=loadImage("img/player1mousewinmouselose.png");
  player1dogwindoglose=loadImage("img/player1dogwindoglose.png");
  player2catwincatlose=loadImage("img/player2catwincatlose.png");
  player2mousewinmouselose=loadImage("img/player2mousewinmouselose.png");
  player2dogwindoglose=loadImage("img/player2dogwindoglose.png");
  player1catwindoglose=loadImage("img/player1catwindoglose.png");
  player1catwinmouselose=loadImage("img/player1catwinmouselose.png");
  player1mousewincatlose=loadImage("img/player1mousewincatlose.png");
  player1mousewindoglose=loadImage("img/player1mousewindoglose.png");
  player1dogwincatlose=loadImage("img/player1dogwincatlose.png");
  player1dogwinmouselose=loadImage("img/player1dogwinmouselose.png");
  player2catwindoglose=loadImage("img/player2catwindoglose.png");
  player2catwinmouselose=loadImage("img/player2catwinmouselose.png");
  player2mousewincatlose=loadImage("img/player2mousewincatlose.png");
  player2mousewindoglose=loadImage("img/player2mousewindoglose.png");
  player2dogwincatlose=loadImage("img/player2dogwincatlose.png");
  player2dogwinmouselose=loadImage("img/player2dogwinmouselose.png");
  mouseHovered=loadImage("img/mouseHovered.png");
}
  void display(){
    if(gameDifficulty != 0){
      if(rollOf1P == 3 && (player1.blood >= player2.blood))  image(_1Pcatwin,0,0);
      else if(rollOf1P == 3 && (player1.blood < player2.blood))  image(_1Pcatlose,0,0);
      else if(rollOf1P == 2 && (player1.blood >= player2.blood))   image(_1Pdogwin,0,0);
      else if(rollOf1P == 2 && (player1.blood < player2.blood))  image(_1Pdoglose,0,0);
      else if(rollOf1P == 1 && (player1.blood >= player2.blood))   image(_1Pmousewin,0,0);
      else if(rollOf1P == 1 && (player1.blood < player2.blood))  image(_1Pmouselose,0,0); 
    }//rollOf1P == 3 && (player1.blood > player2.blood)
    else{
     if(player1.blood >= player2.blood){
      if(rollOf1P == 3){
        if(rollOf2P == 3)         image(player1catwincatlose,0,0);
        else if(rollOf2P == 1)  image(player1catwinmouselose,0,0);
        else if(rollOf2P == 2)    image(player1catwindoglose,0,0);
      }
      else if(rollOf1P == 1){
        if(rollOf2P == 3)         image(player1mousewincatlose,0,0);
        else if(rollOf2P == 1)  image(player1mousewinmouselose,0,0);
        else if(rollOf2P == 2)    image(player1mousewindoglose,0,0);
      }
      else if(rollOf1P == 2){
        if(rollOf2P == 3)         image(player1dogwincatlose,0,0);
        else if(rollOf2P == 1)  image(player1dogwinmouselose,0,0);
        else if(rollOf2P == 2)    image(player1dogwindoglose,0,0);
      }
      
     }
     else if(player1.blood < player2.blood){
       if(rollOf2P == 3){
        if(rollOf1P == 3)         image(player2catwincatlose,0,0);
        else if(rollOf1P == 1)  image(player2catwinmouselose,0,0);
        else if(rollOf1P == 2)    image(player2catwindoglose,0,0);
      }
      else if(rollOf2P == 1){
        if(rollOf1P == 3)        image(player2mousewincatlose,0,0);
        else if(rollOf1P == 1)  image(player2mousewinmouselose,0,0);
        else if(rollOf1P == 2)    image(player2mousewindoglose,0,0);
      }
      else if(rollOf2P == 2){
        if(rollOf1P == 3)        image(player2dogwincatlose,0,0);
        else if(rollOf1P == 1)  image(player2dogwinmouselose,0,0);
        else if(rollOf1P == 2)    image(player2dogwindoglose,0,0);
      }
     }  
   }
     if(422 + 350 > mouseX
      && 422 < mouseX
      && 647 + 109 > mouseY
      && 647 < mouseY) {
      image(mouseHovered, 422, 647);
      if(mousePressed){
        gameState = 1;
        reset();
        mousePressed = false;
      }
      }
   
   
  }


}