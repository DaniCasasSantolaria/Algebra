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
      scene = 3;
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

void LifeBarBoss(){
  rectMode(CENTER);
  textSize(17);
  fill(255,0,0);
  text("Boss lifes: " + life_boss, 500, 45);
  if(life_towers == 7) life_boss = 2;
  if(life_towers == 4) life_boss = 1;
  if(life_towers == 0) life_boss = 0;
  if(life_boss == 3){
    fill(0, 0, 0);
    rect(501, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(450, 20, 50, 20);
    rect(501, 20, 50, 20);
    rect(552, 20, 50, 20);
  }
  else if(life_boss == 2){
    fill(0, 0, 0);
    rect(501, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(450, 20, 50, 20);
    rect(501, 20, 50, 20);
    fill(#D91A09); //Rojo
    rect(552, 20, 50, 20);
  }
  else if(life_boss == 1){
    fill(0, 0, 0);
    rect(501, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(450, 20, 50, 20);
    fill(#D91A09); //Rojo
    rect(501, 20, 50, 20);
    rect(552, 20, 50, 20);
  }
  else{
      scene = 3;
  }
}
