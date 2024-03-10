int PJ_lifes, PNJ2_lifes;

void LifeBar(){
  rectMode(CENTER);
  if(PJ_lifes == 3){
    fill(0, 0, 0);
    rect(91, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(40, 20, 50, 20);
    rect(91, 20, 50, 20);
    rect(142, 20, 50, 20);
  }
  if(PJ_lifes == 2){
    fill(0, 0, 0);
    rect(91, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(40, 20, 50, 20);
    rect(91, 20, 50, 20);
    fill(#D91A09); //Rojo
    rect(142, 20, 50, 20);
  }
  if(PJ_lifes == 1){
    fill(0, 0, 0);
    rect(91, 20, 152, 20);
    fill(#09D93C); //Verde
    rect(40, 20, 50, 20);
    fill(#D91A09); //Rojo
    rect(91, 20, 50, 20);
    rect(142, 20, 50, 20);
  }
}
