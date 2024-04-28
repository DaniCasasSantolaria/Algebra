boolean hasPressed = false, timeReference = false;
float pressedTimer, referenceTime;
void playerMovement(){
 if(scene == 1 && keyPressed){
   if(key == 'w' || key == 'W'){
     //Mira hacia arriba caminando
     player.direction = playerUpRun;
     pet.direction = petUp;
     if(player.y >=  5) player.y -=3;
   }
   else if(key == 's' || key == 'S'){
     //Mira hacia abajo caminando
     player.direction = playerDownRun;
     pet.direction = petDown;
     if(player.y <= height - 5) player.y +=3;
   }
   else if(key == 'd' || key == 'D'){
     //Mira hacia derecha caminando
     player.direction = playerRightRun;
     pet.direction = petRight;
     if(player.x <= width - 5) player.x +=3;
   }
   else if(key == 'a'  || key == 'A'){
     //Intento de hacer que la animación funcione y no se quede todo el rato en la animación de caminar
     //Mira hacia izquierda caminando
     /*if(!hasPressed){
       pressedTimer = millis();
       hasPressed = true;
     }
     if(millis() - pressedTimer < 500){
       player.direction = playerLeft;
     }
     else if(millis() - pressedTimer > 500 && millis() - pressedTimer < 1000){
       player.direction = playerLeftRun;
       if(!timeReference){
         referenceTime = millis();
         timeReference = true;
       }
       if(millis() - referenceTime > 500){
        hasPressed = false;
        pressedTimer = 0;
        referenceTime = 0;
        timeReference = false;
       }
     }*/
     player.direction = playerLeftRun;
     pet.direction = petLeft;
     if(player.x >= 5) player.x -= 3;
   }
  }
}

void keyPressed(){
 if(scene == 0){
   if(key == '0' && hasClickedPlay){  //Si se presiona la tecla '0', se vuelve al menú
     hasClickedPlay = false;
   }
 }
 else if(scene == 1){
   if(completePokemon && key == 'j'){
     completePokemon = true;
     scene = 0;
     houseScene = 5;
   }
 }
 else if(scene == 2 && completeBreakout){
  if(key == ENTER){
    scene = 0;
  }
 }
 else if(scene == 3 && !completePuzzle){
  int idx=0;
  boolean flag=false;
  /******UP******/      /******DOWN******/ 
  //x12       312       //312          x12
  //345  =>   x45       //x45    =>    345
  //678       678       //678          678
  
  /******LEFT******/    /******RIGHT******/ 
  //312       312       //312          312
  //4x5  =>   45x       //45x    =>    4x5
  //678       678       //678          678
  
  if(key==CODED){
    //count steps taken
    if(play) step++;
    if(keyCode== UP &&(!lock)){
      //some cases ehre none of the subpuzzles cannot be move UP
      if(white==6 || white==7 || white==8){step--; flag=true;}
      idx=(flag)?white:white+3;
    }
    else if(keyCode== DOWN &&(!lock)){
      //some cases where none of the subpuzzles cannot be move DOWN 
      if(white==0 || white== 1 || white==2){step--; flag=true;}
      idx=(flag)?white:white-3; 
    }
    else if(keyCode == LEFT && (!lock)){
      if(white==2 || white==5 || white==8){step--; flag=true;}
      idx=(flag)?white:white+1; 
    }
    else if (keyCode == RIGHT && (!lock)){
      if(white==0 || white== 3 || white==6){step--; flag=true;}
      idx=(flag)?white:white-1;
    }
    //swap the white subpuzzle with the chosen subpÃ¹zzle
    Collections.swap(rand,white,idx);
  }
 }
}

void keyReleased(){
  if(scene == 1){
   if(key == 'w' || key == 'W'){
     //Mira hacia arriba quieto
     player.direction = playerUp;
   }
   else if(key == 's' || key == 'S'){
     //Mira hacia abajo quieto
     player.direction = playerDown;
   }
   else if(key == 'd' || key == 'D'){
     //Mira hacia derecha quieto
     player.direction = playerRight;
   }
   else if(key == 'a' || key == 'A'){
     //Mira hacia izquierda quieto
     player.direction = playerLeft;
   }
  }
}
