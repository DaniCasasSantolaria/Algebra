boolean hasPressed = false, timeReference = false;
float pressedTimer, referenceTime;
void playerMovement(){
 if(scene == 2 && keyPressed){
   if(key == 'w' || key == 'W'){
     //Mira hacia arriba caminando
     player.direction = playerUpRun;
     if(player.y >=  5) player.y -=3;
   }
   else if(key == 's' || key == 'S'){
     //Mira hacia abajo caminando
     player.direction = playerDownRun;
     if(player.y <= height - 5) player.y +=3;
   }
   else if(key == 'd' || key == 'D'){
     //Mira hacia derecha caminando
     player.direction = playerRightRun;
     if(player.x <= width - 5) player.x +=3;
   }
   else if(key == 'a'  || key == 'A'){
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
     if(player.x >= 5) player.x -= 3;
   }
  }
}

void keyReleased(){
  if(scene == 2){
   if(key == 'w'){
     //Mira hacia arriba quieto
     player.direction = playerUp;
   }
   else if(key == 's'){
     //Mira hacia abajo quieto
     player.direction = playerDown;
   }
   else if(key == 'd'){
     //Mira hacia derecha quieto
     player.direction = playerRight;
   }
   else if(key == 'a'){
     //Mira hacia izquierda quieto
     player.direction = playerLeft;
   }
  }
}
