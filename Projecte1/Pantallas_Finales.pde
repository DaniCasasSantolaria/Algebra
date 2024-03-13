void GameOver(){
  background(0);
  fill(255,0,0);
  textSize(200);
  text("GAME", 250, 300);
  text("OVER", 260, 500);
  fill(255);
  textSize(20);
  text("Press ENTER to return to main menu", 20, 970);
  if(key == ENTER) scene = 0;
}

void GameCompleted(){
  background(0);
  fill(0,255,0);
  textSize(180);
  text("GAME", 250, 300);
  text("COMPLETED", 30, 500);
  fill(255);
  textSize(20);
  text("Press ENTER to return to main menu", 20, 970);
  if(key == ENTER) scene = 0;
}
