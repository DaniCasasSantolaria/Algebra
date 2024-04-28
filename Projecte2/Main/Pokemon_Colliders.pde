int height_pj = 60;
int width_pj = 50;
int prevSquareX, prevSquareY;
int houseScene = 5; //0 = casa1, 1 = casa2, 2 = casa3, 3 = casa4, altre número = carrer

void housesColliders() {
  PVector min_pc = new PVector(player.x - width_pj / 2.0, player.y + height_pj / 2.0);
  PVector max_pc = new PVector(player.x + width_pj / 2.0, player.y - height_pj / 2.0);
  boolean collided = false;
  
  for (int counter = 0; counter < NUM_HOUSES; counter++) {
    PVector min_houses = new PVector(houses[counter].x - houses[counter].hWidth / 2.0, houses[counter].y + houses[counter].hHeight / 2.0);
    PVector max_houses = new PVector(houses[counter].x + houses[counter].hWidth / 2.0, houses[counter].y - houses[counter].hHeight / 2.0);
    
    // Realiza la prueba de Min Max para detectar colisiones
    if (!(max_pc.x < min_houses.x || max_pc.y > min_houses.y || max_houses.x < min_pc.x || max_houses.y > min_pc.y)) {
      collided = true;
      switch(counter){
        case 0:
          if (key == 'w' && player.y > houses[counter].y && player.y < houses[counter].y + 130 && player.x < houses[counter].x + 20 && player.x > houses[counter].x - 20) {
            houseScene = counter;
          }
        break;
        case 1:
          if (key == 'w' && player.y > houses[counter].y && player.y < houses[counter].y + 145 && player.x < houses[counter].x + 20 && player.x > houses[counter].x - 20) {
            houseScene = counter;
          }
        break;
        case 2:
          if (key == 'w' && player.y > houses[counter].y && player.y < houses[counter].y + 145 && player.x < houses[counter].x - 30 && player.x > houses[counter].x - 70) {
            houseScene = counter;
          }
        break;
        case 3:
          if (key == 'w' && player.y > houses[counter].y && player.y < houses[counter].y + 75 && player.x < houses[counter].x + 35 && player.x > houses[counter].x) {
            houseScene = counter;
          }
        break;
      }
      player.x = prevSquareX;
      player.y = prevSquareY;
      break; // Sale del bucle cuando detecta una colisión
    }
  }
  
  if (!collided) {
    prevSquareX = player.x;
    prevSquareY = player.y;
  }
}

void carsColliders(){
  PVector min_pc = new PVector(player.x - width_pj / 2.0, player.y + height_pj / 2.0);
  PVector max_pc = new PVector(player.x + width_pj / 2.0, player.y - height_pj / 2.0);
  boolean collided = false;
  
  for (int counter = 0; counter < NUM_CARS; counter++) {
    PVector min_cars = new PVector(cars[counter].x - cars[counter].v_width / 2.0, cars[counter].y + cars[counter].v_height / 2.0);
    PVector max_cars = new PVector(cars[counter].x + cars[counter].v_width / 2.0, cars[counter].y - cars[counter].v_height / 2.0);
    
    // Realiza la prueba de Min Max para detectar colisiones
    if (!(max_pc.x < min_cars.x || max_pc.y > min_cars.y || max_cars.x < min_pc.x || max_cars.y > min_pc.y)) {
      collided = true;
      break; // Sale del bucle cuando detecta una colisión
    }
  }
  
  if (collided) {
    player.x = width / 2;
    player.y = 100;
  }
}

boolean talkNPC1 = true, talkNPC2 = true, talkNPC3 = true;

void NPCColliders(){
  PVector min_pc = new PVector(player.x - width_pj / 2.0, player.y + height_pj / 2.0);
  PVector max_pc = new PVector(player.x + width_pj / 2.0, player.y - height_pj / 2.0);
  boolean collided = false;
  
  for (int counter = houseScene; counter == houseScene; counter++) {
    PVector min_NPC = new PVector(NPC_x - width_pj / 2.0, NPC_y + height_pj / 2.0);
    PVector max_NPC = new PVector(NPC_x + width_pj / 2.0, NPC_y - height_pj / 2.0);
    // Realiza la prueba de Min Max para detectar colisiones
    if (!(max_pc.x < min_NPC.x || max_pc.y > min_NPC.y || max_NPC.x < min_pc.x || max_NPC.y > min_pc.y)) {
      collided = true;
      break; // Sale del bucle cuando detecta una colisión
    }
  }
  if (player.x < NPC_x + width_pj * 1.5 && player.x > NPC_x - width_pj * 1.5 && player.y < NPC_y + height_pj * 1.5 && player.y > NPC_y && key == ENTER) {
    fill(0);
    rectMode(CENTER);
    rect(width / 2, height - 200, 800, 200);
    fill(255);
    //textMode(CENTER);
    textSize(20);
    switch(houseScene){
      case 0:
        if(talkNPC3){
          text("Gracias por encontrar mi escopeta!! Vuelve a casa del alcalde y dale las gracias", width / 2 - 390, height - 280);
          text("de mi parte!", width / 2 - 390, height - 260);
        }
        else{
          text("Hola, me llamo Manolo. Soy el cazador del pueblo. Necesito que encuentres mi escopeta.", width / 2 - 390, height - 280);
          text("Estaba cazando el otro dia y me dormí en la furgoneta. Al despertar habia desaparecido.", width / 2 - 390, height - 260);
          text("Para encontrarla debes hablar con el alcalde del pueblo, seguro que tiene información.", width / 2 - 390, height - 240);
          talkNPC1 = true; 
        }
        break;
      case 1:
        if(!talkNPC1){
          text("Hola soy Ralph, el alcalde del pueblo. Que te trae por aqui? Por este pueblo no suele", width / 2 - 390, height - 280);
          text("venir mucha gente así que agradezco tu visita. Pasate por las diferentes casas y", width / 2 - 390, height - 260);
          text("habla con los ciudadanos. Seguro que ellos también estan encantados de tu visita.", width / 2 - 390, height - 240);
        }
        else if(talkNPC1 && talkNPC3){
          text("Enhorabuena! Has conseguido la escopeta del cazador!", width / 2 - 390, height - 280);
          text("FIN", width / 2 - 390, height - 260);
          text("Pulsa 'j' para volver al menú", width / 2 - 390, height - 240);
          completePokemon = true;
        }
        else{
         text("Me han dicho que el pescadero tiene fama de robar objetos de valor. Habla con él", width / 2 - 390, height - 280);
         text("y preguntale por la escopeta de Manolo.", width / 2 - 390, height - 260);
         talkNPC2 = true;
        }
        break;
      case 2:
        if(talkNPC2 && talkNPC1){
          text("Asi que el alcalde me acusa de robarle al cazador...", width / 2 - 390, height - 280);
          text("La verdad es que si... fui yo...", width / 2 - 390, height - 260);
          text("No suelo robar a nadie, pero necesitaba la escopeta para poder realizar la pesca de", width / 2 - 390, height - 240);
          text("este mes. Si no fuera por la escopeta me hubiera quedado sin dinero este mes.", width / 2 - 390, height - 220);
          text("Aquí tienes la escopeta. Devuelvela al cazador.", width / 2 - 390, height - 200);
          talkNPC3 = true;
        }
        else{
          text("Buenas, mi nombre es Jose y soy el pescadero del pueblo. Si alguna vez te interesas", width / 2 - 390, height - 280);
          text("por el arte de la pesca no dudes en apuntarte a las clases!", width / 2 - 390, height - 260);
        }
        break;
      case 3:
        text("Hola me llamo Paco y soy el científico del pueblo. Estoy muy ocupado asi que", width / 2 - 390, height - 280);
        text("te agradeceria que me dejaras seguir con mi investigación.", width / 2 - 390, height - 260);
        break;
    }
  }
  if (!collided) {
    prevSquareX = player.x;
    prevSquareY = player.y;
  }
  else{
    player.x = prevSquareX;
    player.y = prevSquareY;
  }
}
