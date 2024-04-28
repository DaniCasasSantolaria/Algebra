int scene = 1;  // 0: Menú principal,
PImage text_play, salon, breakout;
boolean completeBreakout = false, completePuzzle = false, completePokemon = false;
void setup(){
  // Creacion ventana
  size(1920,1060);//Processing 3D (P3D)
  //fullScreen();
  //Menú
  text_play = loadImage("Texto_Play.png");
  salon = loadImage("escena_casa.png");
  breakout = loadImage("Fondo breakout1.jpg");
  sims = loadImage("Logo_Sims.jpg");
  sims.resize(440,260);
  atari = loadImage("Logo-Atari.png");
  atari.resize(500,310);
  puzzle = loadImage("Logo-puzzle.png");
  puzzle.resize(447,280);
  escena_pantallas = loadImage("escena_pantallas.png");
  //Pokemon
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
  NPC = new PImage[NUM_HOUSES];
  for(int i = 0; i < NUM_HOUSES; i++){
   NPC[i] = loadImage("NPC" + (i + 1) + ".png");
  }
  house1 = loadImage("Casa1.png");
  house2 = loadImage("Casa2.png");
  house3 = loadImage("Casa3.png"); 
  house4 = loadImage("Casa4.png");
  busLeft = loadImage("Bus_izquierda.png");
  busRight = loadImage("Bus_derecha.png");
  busLeft.resize(230,230);
  busRight.resize(230,230);
  vanLeft = loadImage("Furgoneta_izquierda.png");
  vanRight = loadImage("Furgoneta_derecha.png");
  vanLeft.resize(230,230);
  vanRight.resize(220,230);
  taxiLeft = loadImage("Taxi_izquierda.png");
  taxiRight = loadImage("Taxi_derecha.png");
  taxiLeft.resize(150,150);
  taxiRight.resize(150,150);
  carLeft = loadImage("Coche_izquierda.png");
  carRight = loadImage("Coche_derecha.png");
  carLeft.resize(150,150);
  carRight.resize(150,150);
  car2Left = loadImage("Coche2_izquierda.png");
  car2Right = loadImage("Coche2_derecha.png");
  car2Left.resize(150,150);
  car2Right.resize(150,150);
  woodGround = loadImage("SueloMadera.jpg");
  woodGround.resize(480, 550);
  groundHouse2 = loadImage("Suelo_casa2.png");
  groundHouse2.resize(597, 368);
  groundHouse3 = loadImage("Suelo_casa3.jpg");
  groundHouse4 = loadImage("Suelo_casa4.jpg");
  groundHouse4.resize(317, 211);
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
  houses[1].hWidth = 350;
  houses[1].hHeight = 220;
  //Casa3
  houses[2].image = house3;
  houses[2].x = 230;
  houses[2].y = height - 290;
  houses[2].hWidth = 255;
  houses[2].hHeight = 210;
  //Casa4
  houses[3].image = house4;
  houses[3].x = width - 300;
  houses[3].y = height - 250;
  houses[3].hWidth = 250;
  houses[3].hHeight = 70;
  player = new Player();
  //Breakout
  setupBricks();
  //Puzzle
  //cargar imagenes
  for (int i = 0; i<9; i++)
   img[i] = loadImage((i+1)+".png");
   img[9] = loadImage("restart.png");
   img[9].resize(100,100);
   img[10] = loadImage("start.png");
   img[10].resize(160,160);
   img[11] = loadImage("exit.png");
   img[11].resize(100,100);
 // para mezclar usando 
  for (int i = 0; i < 9; i++) rand.add(i);
  
  
 Collections.swap (rand,0,3);
}
float timerBreakout;
void draw(){
 switch (scene){
   case 0:
     if(hasClickedPlay) selectGame();
     else{
       pushMatrix();
       imageMode(CORNER);
       translate(width/2,height/2);
       background(#28AFE1);
       textMenu();
       popMatrix();
     }
     break;
   case 1:
     if(houseScene == 0){
       house1();
     }
     else if(houseScene == 1){
       house2();
     }
     else if(houseScene == 2){
       house3();
     }
     else if(houseScene == 3){
       house4();
     }
     else{
       pushMatrix();
       background(#306f26);
       createMap();
       if((player.y > houses[0].y + 30 && player.y < houses[0].y + 350) || (player.y > houses[2].y + 90)){
         drawHouses();
         drawCharacter();
       }
       else{
         drawCharacter();
         drawHouses();
       }
       housesColliders();
       carsColliders();
       popMatrix();
     }
     break;
   case 2:
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
   case 3:
     drawPuzzleGame();
     break;
   case 4:
     break;
 }
}
