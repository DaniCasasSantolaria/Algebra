int scene = 0;  // 0: Menú principal,
PImage text_play, salon, breakout;
void setup(){
  // Creacion ventana
  size(1920,1080,P3D);//Processing 3D (P3D)
  //fullScreen(P3D);
  text_play = loadImage("Texto_Play.png");
  salon = loadImage("escena_casa.png");
  breakout = loadImage("Fondo breakout1.jpg");
  //Los sims
  for (int i = 0; i < NUM_CARS; i++) {
    cars[i] = new Car();
  }
  //Breakout
  setupBricks();
}
float timerBreakout;
void draw(){
 switch (scene){
   case 0:
     translate(width/2,height/2);
     background(#28AFE1);
     textMenu();
     break;
   case 1:
     break;
   case 2:
     background(#306f26);
     createMap();
     break;
   case 3:
     background(0);
     timerBreakout = millis() / 1000;
     image(breakout, 0, 0);
     drawBricks();
     if(!hasLost&&!hasWon) drawBall();
     drawPaddle();
     updateScore(false);
     drawLivesText();
     if(lives==0) drawLose();
     break;
   case 4:
     break;
 }
}
