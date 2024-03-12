boolean clickedPlay = false;
boolean clickedControls = false;
boolean mouseControl = true;
boolean keyboardControl = false;
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
    background(50);
    fill(0);
    rect(140, 900, 170, 50);
    fill(255);
    textSize(30);
    text("BACK", 105, 910);
    fill(255);
    textSize(50);
    text("How many enemies do you want 1 - 12?", 100, 100);
    textSize(20);
    text("Do you want ", 300, 300);
    text(amount_npcs, 410, 300);
    //amount_npcs = (int)key;
    text(" enemies? Press enter to confirm", 430, 300);
    if(key == ENTER && amount_npcs > 0){
      scene = 1;
    }
    fill(20);
    rect(600, 500, 80, 50);
    fill(255);
    textSize(30);
    text("+1", 585, 510);
    fill(20);
    rect(400, 500, 80, 50);
    fill(255);
    textSize(30);
    text("-1", 385, 510);
}

void MenuControls(){
    background(50);
    fill(20);
    rect(500, 400, 300, 50);
    fill(255);
    textSize(20);
    text("Click for Keyboard controls", 393, 405);
    fill(20);
    rect(500, 600, 300, 50);
    fill(255);
    textSize(20);
    text("Click for Mouse controls", 405, 605);
    fill(0);
    rect(140, 900, 170, 50);
    fill(255);
    textSize(30);
    text("BACK", 105, 910);
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
  if (scene == 0 && mouseX > 249 && mouseX < 751 && mouseY > 249 && mouseY < 351 && clickedPlay == false && clickedControls == false) clickedPlay = true;
  else if(scene == 0 && mouseX > 249 && mouseX < 751 && mouseY > 449 && mouseY < 551 && clickedPlay == false && clickedControls == false) clickedControls = true;
  else if(scene == 0 && mouseX > 299 && mouseX < 701 && mouseY > 649 && mouseY < 751 && clickedPlay == false && clickedControls == false) exit();
  if(scene == 0 && clickedPlay == true && mouseX > 54 && mouseX < 226 && mouseY > 874 && mouseY < 926) clickedPlay = false;
  if(scene == 0 && clickedControls == true && mouseX > 54 && mouseX < 226 && mouseY > 874 && mouseY < 926) clickedControls = false;
  if(scene == 0 && clickedPlay == true && mouseX > 359 && mouseX < 441 && mouseY > 459 && mouseY < 551 && amount_npcs > 1) amount_npcs--;
  if(scene == 0 && clickedPlay == true && mouseX > 559 && mouseX < 641 && mouseY > 459 && mouseY < 551 && amount_npcs < 12) amount_npcs++;
  if(scene == 0 && clickedControls == true && mouseX > 349 && mouseX < 651 && mouseY > 574 && mouseY < 626){
    mouseControl = true;
    keyboardControl = false;
  }
  if(scene == 0 && clickedControls == true && mouseX > 349 && mouseX < 651 && mouseY > 374 && mouseY < 426){
    keyboardControl = true;
    mouseControl = false;
  }
  if(scene == 1 && menuOptions == true && mouseX > 299 && mouseX < 701 && mouseY > 449 && mouseY < 551) exit();
  else if((scene == 1 && menuOptions == true && mouseX > 249 && mouseX < 751 && mouseY > 249 && mouseY < 351) || key == TAB){
    scene = 1;
    menuOptions = false;
  }
}
