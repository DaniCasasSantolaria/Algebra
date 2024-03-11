boolean clickedPlay = false;
boolean clickedControls = false;
boolean mouseControl = false;
boolean keyboardContol = false;
void CreateMenu(){
 background(50);
 textSize(100);
 text("ENEMIES", 325, 150);
 rectMode(CENTER);
 fill(0);
 rect(500, 300, 500, 100);
 fill(255);
 textSize(100);
 text("PLAY", 400, 335);
 fill(0);
 rect(500, 500, 500, 100);
 fill(255);
 textSize(100);
 text("CONTROLS", 270, 535);
 fill(0);
 rect(500, 700, 500, 100);
 fill(255);
 textSize(100);
 text("EXIT", 410, 735);
}

void MenuPlay(){
  char prevKey = '2';
  background(50);
  fill(0);
  rect(140, 900, 170, 50);
  fill(255);
  textSize(30);
  text("BACK", 105, 910);
  fill(255);
  textSize(50);
  text("How many enemies do you want 1 - 9?", 100, 100);
  textSize(20);
  text("Do you want ", 100, 300);
  if(key == '1') prevKey = '1';
  else if(key == '2') prevKey = '2';
  else if(key == '3') prevKey = '3';
  else if(key == '4') prevKey = '4';
  else if(key == '5') prevKey = '5';
  else if(key == '6') prevKey = '6';
  else if(key == '7') prevKey = '7';
  else if(key == '8') prevKey = '8';
  else if(key == '9') prevKey = '9';
  amount_npcs = (int)prevKey - 48;
  text(prevKey, 210, 300);
  //amount_npcs = (int)key;
  text(" enemies? Press enter to confirm", 220, 300);
  if(key == ENTER && amount_npcs > 0){
    scene = 1;
  }
}

void MenuControls(){
  //Falta por hacer
}

void MenuOptions(){
   background(50);
   textSize(100);
   rectMode(CENTER);
   fill(0);
   rect(500, 300, 500, 100);
   fill(255);
   textSize(100);
   text("CONTINUE", 280, 335);
   fill(0);
   rect(500, 500, 400, 100);
   fill(255);
   textSize(100);
   text("EXIT", 410, 535);
}

void mouseClicked(){
  if (scene == 0 && mouseX > 249 && mouseX < 751 && mouseY > 249 && mouseY < 351) clickedPlay = true;
  else if(scene == 0 && mouseX > 249 && mouseX < 751 && mouseY > 449 && mouseY < 551) clickedControls = true;
  else if(scene == 0 && mouseX > 299 && mouseX < 701 && mouseY > 649 && mouseY < 751) exit();
  if(scene == 0 && clickedPlay == true && mouseX > 54 && mouseX < 226 && mouseY > 874 && mouseY < 926) clickedPlay = false;
  if(scene == 1 && menuOptions == true && mouseX > 299 && mouseX < 701 && mouseY > 449 && mouseY < 551) exit();
  else if((scene == 1 && menuOptions == true && mouseX > 249 && mouseX < 751 && mouseY > 249 && mouseY < 351) || key == TAB){
    scene = 1;
    menuOptions = false;
  }
}
