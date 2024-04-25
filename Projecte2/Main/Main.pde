int scene = 2;  // 0: Menú principal,
PImage text_play, salon, breakout;
void setup(){
  // Creacion ventana
  size(1920,1060);//Processing 3D (P3D)
  //fullScreen(P3D);
  text_play = loadImage("Texto_Play.png");
  salon = loadImage("escena_casa.png");
  breakout = loadImage("Fondo breakout1.jpg");
  playerRight = loadImage("HaciaDerechaQuieto.png");
  playerLeft = loadImage("HaciaIzquierdaQuieto.png");
  playerUp = loadImage("HaciaArribaQuieto.png");
  playerDown = loadImage("HaciaAbajoQuieto.png");
  playerRightRun = loadImage("HaciaDerechaCaminando.png");
  playerLeftRun = loadImage("HaciaIzquierdaCaminando.png");
  playerUpRun = loadImage("HaciaArribaCaminando.png");
  playerDownRun = loadImage("HaciaAbajoCaminando.png");
  playerDown.resize(50,60);
  playerRight.resize(50,60);
  playerLeft.resize(50,60);
  playerUp.resize(50,60);
  playerDown.resize(50,60);
  playerRightRun.resize(50,60);
  playerLeftRun.resize(50,60);
  playerUpRun.resize(50,60);
  playerDownRun.resize(50,60);
  house1 = loadImage("Casa1.png");
  house2 = loadImage("Casa2.png");
  house3 = loadImage("Casa3.png"); 
  house4 = loadImage("Casa4.png");
  //Los sims
  for (int i = 0; i < NUM_CARS; i++) {
    cars[i] = new Car();
  }
  for(int i = 0; i < NUM_HOUSES; i++){
    houses[i] = new House(); 
  }
  //Casa 1
  houses[0].image = house1;
  houses[0].x = 230;
  houses[0].y = 110;
  houses[0].hWidth = 225;
  houses[0].hHeight = 150;
  //Casa2
  houses[1].image = house2;
  houses[1].x = width - 400;
  houses[1].y = 110;
  houses[1].hWidth = 300;
  houses[1].hHeight = 150;
  //Casa3
  houses[2].image = house3;
  houses[2].x = 230;
  houses[2].y = height - 290;
  houses[2].hWidth = 250;
  houses[2].hHeight = 300;
  //Casa4
  houses[3].image = house4;
  houses[3].x = width - 300;
  houses[3].y = height - 275 ;
  houses[3].hWidth = 350;
  houses[3].hHeight = 200;
  player = new Player();
  //Breakout
  setupBricks();
}
float timerBreakout;
void draw(){
 switch (scene){
   case 0:
     pushMatrix();
     imageMode(CORNER);
     translate(width/2,height/2);
     background(#28AFE1);
     textMenu();
     popMatrix();
     break;
   case 1:
     break;
   case 2:
     pushMatrix();
     background(#306f26);
     createMap();
     if(player.y > houses[0].y + 30 && player.y < houses[0].y + 150){
       drawHouses();
       drawCharacter();
     }
     else{
       drawCharacter();
       drawHouses();
     }
     housesColliders();
     popMatrix();
     break;
   case 3:
     pushMatrix();
     background(0);
     timerBreakout = millis() / 1000;
     image(breakout, 0, 0);
     drawBricks();
     if(!hasLost&&!hasWon) drawBall();
     drawPaddle();
     updateScore(false);
     drawLivesText();
     if(lives==0) drawLose();
     popMatrix();
     break;
   case 4:
     break;
 }
}
