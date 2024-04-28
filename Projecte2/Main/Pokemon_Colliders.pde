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

void NPCColliders(){
  
}
