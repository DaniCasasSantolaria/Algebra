boolean hasClickedPlay = false;
void mouseClicked(){
  if(mouseX > 1420 && mouseX < 1800 && mouseY > 160 && mouseY < 310 && scene == 0 && !hasClickedPlay){
    hasClickedPlay = true;
  }
  if(mouseX > 952 && mouseX < 1372 && mouseY > 20 && mouseY < 280 && scene == 0 && hasClickedPlay){
    scene = 1; //Los Sims
  }
  if(mouseX > 795 && mouseX < 1295 && mouseY > 710 && mouseY < 1020 && scene == 0 && hasClickedPlay){
    scene = 2; //Breakout
  }
  if(mouseX > 323 && mouseX < 770 && mouseY > 330 && mouseY < 610 && scene == 0 && hasClickedPlay){
    scene = 3; //Puzzle
  }
}
