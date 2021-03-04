class Gamestart {
PImage bg, click , noTouch , touch;
int bgX,bgY,clickingBarX,clickingBarY;


Gamestart(){
   bgX=0;
   bgY=0;
   clickingBarX=422;
   clickingBarY=647;
   bg=loadImage("img/bg.png");
   click=loadImage("img/click.png");
   noTouch=loadImage("img/noTouch.png");
   touch=loadImage("img/touch.png");


}


void display(){
image(bg,bgX,bgY);
image(noTouch,clickingBarX,clickingBarY);
 if(mouseX>=422&&mouseX<=772&&mouseY>=647&&mouseY<=756){
image(touch,clickingBarX,clickingBarY);
}
if(mouseX>=422&&mouseX<=772&&mouseY>=647&&mouseY<=756&&mousePressed){
image(click,clickingBarX,clickingBarY);

} 

}



}