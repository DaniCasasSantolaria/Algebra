boolean clickedPlay = false;
void CreateMenu(){
 background(50);
 textSize(100);
 text("ENEMIES", 325, 150);
 rectMode(CENTER);
 fill(0);
 rect(500, 300, 400, 100);
 fill(255);
 textSize(100);
 text("PLAY", 400, 335);
 fill(0);
 rect(500, 500, 400, 100);
 fill(255);
 textSize(100);
 text("EXIT", 410, 535);
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
  text("How many enemies do you want 1 - 9?", 100, 100);
  textSize(20);
  text("Do you want ", 100, 300);
  if(key == '1' || key == '2' || key == '3' || key == '4' || key == '5' || key == '6' || key == '7' || key == '8' || key == '9')text((char)key, 210, 300);
  text(" enemies? Press enter to confirm", 220, 300);
  if(key == ENTER){
    scene = 1;
  }
}

void mouseClicked(){
  if (scene == 0 && mouseX > 299 && mouseX < 701 && mouseY > 249 && mouseY < 351){
    clickedPlay = true;
  }
  else if(scene == 0 && mouseX > 299 && mouseX < 701 && mouseY > 449 && mouseY < 551){
    exit();
  }
  if(scene == 0 && clickedPlay == true && mouseX > 54 && mouseX < 226 && mouseY > 874 && mouseY < 926){
    clickedPlay = false;
  }
}

void keyTyped(){
  if(scene == 0 && clickedPlay){
    println(key);  
    amount_npcs = (int)key;
  }
}
