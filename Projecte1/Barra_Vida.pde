int PJ_lifes, PNJ2_lifes;

void LifeBar(){
  rectMode(CENTER);
  textSize(17);
  fill(255);
  text("PJ lifes:" + PJ_lifes, 200, 18);
  if(PJ_lifes == 3){
    fill(0, 0, 0);
    rect(91, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(40, 20, 50, 20);
    rect(91, 20, 50, 20);
    rect(142, 20, 50, 20);
  }
  else if(PJ_lifes == 2){
    fill(0, 0, 0);
    rect(91, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(40, 20, 50, 20);
    rect(91, 20, 50, 20);
    fill(#D91A09); //Rojo
    rect(142, 20, 50, 20);
  }
  else if(PJ_lifes == 1){
    fill(0, 0, 0);
    rect(91, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(40, 20, 50, 20);
    fill(#D91A09); //Rojo
    rect(91, 20, 50, 20);
    rect(142, 20, 50, 20);
  }
  else{
      //Fin del juego
  }
}

void LifeBarPNJ2(){
    rectMode(CENTER);
  if(PNJ2_lifes == 3){
    fill(0, 0, 0);
    rect(xPNJ2, yPNJ2 - 30, 51, 10);
    fill(#09D93C); //Verde
    rect(xPNJ2 - 31, yPNJ2 - 30, 30, 10);
    rect(xPNJ2, yPNJ2 - 30, 30, 10);
    rect(xPNJ2 + 31, yPNJ2 - 30, 30, 10);
  }
  else if(PNJ2_lifes == 2){
    fill(0, 0, 0);
    rect(xPNJ2, yPNJ2 - 30, 51, 10);
    fill(#09D93C); //Verde
    rect(xPNJ2 - 31, yPNJ2 - 30, 30, 10);
    rect(xPNJ2, yPNJ2 - 30, 30, 10);
    fill(#D91A09); //Rojo
    rect(xPNJ2 + 31, yPNJ2 - 30, 30, 10);
  }
  else if(PNJ2_lifes == 1){
    fill(0, 0, 0);
    rect(xPNJ2, yPNJ2 - 30, 51, 10);
    fill(#09D93C); //Verde
    rect(xPNJ2 - 31, yPNJ2 - 30, 30, 10);
    fill(#D91A09); //Rojo
    rect(xPNJ2, yPNJ2 - 30, 30, 10);
    rect(xPNJ2 + 31, yPNJ2 - 30, 30, 10);
  }
  else{
    PJ_lifes--;
    PNJ2_lifes = 3;
  }
}
