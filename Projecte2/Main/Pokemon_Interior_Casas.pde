PImage woodGround, groundHouse2, groundHouse3, groundHouse4, sofa1, sofa2, whiteLamp,sofa3,sofa4,rug;
boolean enter1 = false, enter2 = false, enter3 = false, enter4 = false;
int NPC_x, NPC_y;
void house1(){
  if(!enter1){
    enter1 = true;
    player.x = width / 2;
    player.y = height - 200;
    pet.x = width / 2;
    pet.y = height - 160;
  }
  imageMode(CENTER); 
  //Centro
  image(woodGround, width / 2 - 960, height / 2);
  image(woodGround, width / 2 - 480, height / 2);
  image(woodGround, width / 2, height / 2);
  image(woodGround, width / 2 + 480, height / 2);
  image(woodGround, width / 2 + 960, height / 2);
  //Arriba
  image(woodGround, width / 2 - 960, height / 2 - 550);
  image(woodGround, width / 2 - 480, height / 2 - 550);
  image(woodGround, width / 2, height / 2 - 550);
  image(woodGround, width / 2 + 480, height / 2 - 550);
  image(woodGround, width / 2 + 960, height / 2 - 550);
  //Abajo
  image(woodGround, width / 2 - 960, height / 2 + 550);
  image(woodGround, width / 2 - 480, height / 2 + 550);
  image(woodGround, width / 2, height / 2 + 550);
  image(woodGround, width / 2 + 480, height / 2 + 550);
  image(woodGround, width / 2 + 960, height / 2 + 550);
  //decoracion
  image(sofa1, width - 170, 170);
  image(sofa2, width-400, 100);
  image (whiteLamp, width - 550, 100);
  image(NPC[houseScene], NPC_x, NPC_y);
  petMovement();
  drawCharacter();
  if(player.y > height - 50){
    player.x = 230;
    player.y = 220;
    pet.x = 230;
    pet.y = 260;
    houseScene = 5;
    enter1 = false;
  }
}
void house2(){
  if(!enter2){
    enter2 = true;
    player.x = width / 2;
    player.y = height - 200;
    pet.x = width / 2;
    pet.y = height - 160;
  }
  //Escena
  image(groundHouse2, width / 2 - 1194, height / 2);
  image(groundHouse2, width / 2 - 597, height / 2);
  image(groundHouse2, width / 2, height / 2);
  image(groundHouse2, width / 2 + 597, height / 2);
  image(groundHouse2, width / 2 + 1194, height / 2);
  //Arriba
  image(groundHouse2, width / 2 - 1194, height / 2 - 360);
  image(groundHouse2, width / 2 - 597, height / 2 - 360);
  image(groundHouse2, width / 2, height / 2 - 360);
  image(groundHouse2, width / 2 + 597, height / 2 - 360);
  image(groundHouse2, width / 2 + 1194, height / 2 - 360);
  //Abajo
  image(groundHouse2, width / 2 - 1194, height / 2 + 360);
  image(groundHouse2, width / 2 - 597, height / 2 + 360);
  image(groundHouse2, width / 2, height / 2 + 360);
  image(groundHouse2, width / 2 + 597, height / 2 + 360);
  image(groundHouse2, width / 2 + 1194, height / 2 + 360);
  //decoracion
  image(sofa3, 200, 150);
  image(sofa4, 150, 200);
  image (rug, 220,220);
  image(NPC[houseScene], NPC_x, NPC_y);
  petMovement();
  drawCharacter();
  if(player.y > height - 50){
    player.x = width - 400;
    player.y = 250;
    pet.x = width - 400;
    pet.y = 260;
    houseScene = 5;
    enter2 = false;
  }
}

void house3(){
  background(0);
  if(!enter3){
    enter3 = true;
    player.x = width / 2;
    player.y = height - 200;
    pet.x = width / 2;
    pet.y = height - 160;
  }
  //Escena
  image(groundHouse3, width / 2 - 1024, height / 2);
  image(groundHouse3, width / 2 - 512, height / 2);
  image(groundHouse3, width / 2, height / 2);
  image(groundHouse3, width / 2 + 512, height / 2);
  image(groundHouse3, width / 2 + 1024, height / 2);
  //Arriba
  image(groundHouse3, width / 2 - 1024, height / 2 - 288);
  image(groundHouse3, width / 2 - 512, height / 2 - 288);
  image(groundHouse3, width / 2, height / 2 - 288);
  image(groundHouse3, width / 2 + 512, height / 2 - 288);
  image(groundHouse3, width / 2 + 1024, height / 2 - 288);
  image(groundHouse3, width / 2 - 1024, height / 2 - 576);
  image(groundHouse3, width / 2 - 512, height / 2 - 576);
  image(groundHouse3, width / 2, height / 2 - 576);
  image(groundHouse3, width / 2 + 512, height / 2 - 576);
  image(groundHouse3, width / 2 + 1024, height / 2 - 576);
  //Abajo
  image(groundHouse3, width / 2 - 1024, height / 2 + 288);
  image(groundHouse3, width / 2 - 512, height / 2 + 288);
  image(groundHouse3, width / 2, height / 2 + 288);
  image(groundHouse3, width / 2 + 512, height / 2 + 288);
  image(groundHouse3, width / 2 + 1024, height / 2 + 288);
  image(groundHouse3, width / 2 - 1024, height / 2 + 576);
  image(groundHouse3, width / 2 - 512, height / 2 + 576);
  image(groundHouse3, width / 2, height / 2 + 576);
  image(groundHouse3, width / 2 + 512, height / 2 + 576);
  image(groundHouse3, width / 2 + 1024, height / 2 + 576);
  //decoracion
  image(sofa3, 200, 150);
  image(sofa4, 150, 200);
  image (rug, 220,220);
  image(NPC[houseScene], NPC_x, NPC_y);
  petMovement();
  drawCharacter();
  if(player.y > height - 50){
    player.x = 200;
    player.y = height - 145;
    pet.x = 200;
    pet.y = height - 105;
    houseScene = 5;
    enter3 = false;
  }
}

void house4(){
  background(0);
  if(!enter4){
    enter4 = true;
    player.x = width / 2;
    player.y = height - 200;
    pet.x = width / 2;
    pet.y = height - 160;
  }
  //Escena
  image(groundHouse4, width / 2 - 951, height / 2);
  image(groundHouse4, width / 2 - 634, height / 2);
  image(groundHouse4, width / 2 - 317, height / 2);
  image(groundHouse4, width / 2, height / 2);
  image(groundHouse4, width / 2 + 317, height / 2);
  image(groundHouse4, width / 2 + 634, height / 2);
  image(groundHouse4, width / 2 + 951, height / 2);
  //Arriba
  image(groundHouse4, width / 2 - 951, height / 2 - 211);
  image(groundHouse4, width / 2 - 634, height / 2 - 211);
  image(groundHouse4, width / 2 - 317, height / 2 - 211);
  image(groundHouse4, width / 2, height / 2 - 211);
  image(groundHouse4, width / 2 + 317, height / 2 - 211);
  image(groundHouse4, width / 2 + 634, height / 2 - 211);
  image(groundHouse4, width / 2 + 951, height / 2 - 211);
  image(groundHouse4, width / 2 - 951, height / 2 - 422);
  image(groundHouse4, width / 2 - 634, height / 2 - 422);
  image(groundHouse4, width / 2 - 317, height / 2 - 422);
  image(groundHouse4, width / 2, height / 2 - 422);
  image(groundHouse4, width / 2 + 317, height / 2 - 422);
  image(groundHouse4, width / 2 + 634, height / 2 - 422);
  image(groundHouse4, width / 2 + 951, height / 2 - 422);
  //Abajo
  image(groundHouse4, width / 2 - 951, height / 2 + 211);
  image(groundHouse4, width / 2 - 634, height / 2 + 211);
  image(groundHouse4, width / 2 - 317, height / 2 + 211);
  image(groundHouse4, width / 2, height / 2 + 211);
  image(groundHouse4, width / 2 + 317, height / 2 + 211);
  image(groundHouse4, width / 2 + 634, height / 2 + 211);
  image(groundHouse4, width / 2 + 951, height / 2 + 211);
  image(groundHouse4, width / 2 - 951, height / 2 + 422);
  image(groundHouse4, width / 2 - 634, height / 2 + 422);
  image(groundHouse4, width / 2 - 317, height / 2 + 422);
  image(groundHouse4, width / 2, height / 2 + 422);
  image(groundHouse4, width / 2 + 317, height / 2 + 422);
  image(groundHouse4, width / 2 + 634, height / 2 + 422);
  image(groundHouse4, width / 2 + 951, height / 2 + 422);
  //decoracion
  image(sofa1, width - 170, 170);
  image(sofa2, width-400, 100);
  image (whiteLamp, width - 550, 100);
  image(NPC[houseScene], NPC_x, NPC_y);
  petMovement();
  drawCharacter();
  if(player.y > height - 50){
    player.x = width - 300;
    player.y = height - 160;
    pet.x = width - 300;
    pet.y = height - 130;
    houseScene = 5;
    enter4 = false;
  }
}
