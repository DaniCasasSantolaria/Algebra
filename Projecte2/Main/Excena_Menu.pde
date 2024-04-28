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
image (sims, 952,20);
image (atari, 795,710);
image (puzzle, 323,330);

}

void textMenu(){
  pushMatrix();
  translate(-width/2,-height/2);
  image(salon, 0, 0);
  image(text_play, 1400, 0);
  popMatrix();
}
