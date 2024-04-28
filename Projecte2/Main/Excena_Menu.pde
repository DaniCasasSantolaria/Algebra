PImage escena_pantallas;
PImage sims;
PImage atari;
PImage puzzle;

//booleanos que nos dicen si has ganado o perdido en cada juego, para así añadir los LUTs
boolean simsGame;
boolean breakoutGame;
boolean puzzleGame;


//
void selectGame(){
noStroke();
image(escena_pantallas, 0,0);


imageMode(CORNER);
if(completePokemon){
  PImage imagenFiltrada = applyGreenFilter(sims, 80, 10, 100);
  image(imagenFiltrada, 952, 20);
}
else{
  image (sims, 952, 20);
}
if(completeBreakout){
  PImage imagenFiltrada = applyGreenFilter(atari, 0, 80, 0);
  image(imagenFiltrada, 795, 710);
}
else{
  image (atari, 795, 710);
}
image (puzzle, 323,330);

}

void textMenu(){
  pushMatrix();
  translate(-width/2,-height/2);
  image(salon, 0, 0);
  image(text_play, 1400, 0);
  popMatrix();
}
