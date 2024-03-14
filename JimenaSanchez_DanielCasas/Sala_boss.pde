float[] x_tower, y_tower;
int amount_towers = 4; 
int life_towers = 10;
float radius_tower = 100; 
float[] x_obstacles, y_obstacles;
int amount_obstacles = 8;
float obstacles_radius = 40;
boolean hasCollidedTower = false;

void CreateBossMap(){
  background(0);
  fill(#5E41F0);
  for (int i = 0; i < amount_obstacles; i++)
  {
    rectMode(CENTER);
    ellipse(x_obstacles[i], y_obstacles[i], obstacles_radius,obstacles_radius);
  }
  
  fill(#775023);
   for (int i = 0; i < amount_towers; i++)
  {
    ellipse(x_tower[i],y_tower[i],radius_tower, radius_tower);
  }
}

void CheckBossMapCollisions(){
  for (int j = 0; j < amount_obstacles; j++) {
    float distancia = dist(x_boss, y_boss, x_obstacles[j], y_obstacles[j]);
    float radioSuma = (radius_boss / 3.5) + (obstacles_radius);
    if (distancia < radioSuma) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(y_boss - y_obstacles[j], x_boss - x_obstacles[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      x_boss = x_obstacles[j] + cos(angulo) * nuevaDistancia;
      y_boss = y_obstacles[j] + sin(angulo) * nuevaDistancia;
    }
  }
  for (int j = 0; j < amount_towers; j++) {
    float distancia = dist(x_boss, y_boss, x_tower[j], y_tower[j]);
    float radioSuma = (radius_boss / 6) + (radius_tower / 1.25);
    if (distancia < radioSuma) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(y_boss - y_tower[j], x_boss - x_tower[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      x_boss = x_tower[j] + cos(angulo) * nuevaDistancia;
      y_boss = y_tower[j] + sin(angulo) * nuevaDistancia;
    }
  }
}

void CheckPlayerObstaclesCollisions(){
  for (int j = 0; j < amount_obstacles; j++) {
    float distancia = dist(xPJ, yPJ, x_obstacles[j], y_obstacles[j]);
    float radioSuma = (radius_pj / 3.5) + (obstacles_radius / 1.3);
    if (distancia < radioSuma) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(yPJ - y_obstacles[j], xPJ - x_obstacles[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      xPJ = x_obstacles[j] + cos(angulo) * nuevaDistancia;
      yPJ = y_obstacles[j] + sin(angulo) * nuevaDistancia;
    }
  }
}

int numTower = 0;
void CheckPlayerTowersCollisions(){
  if(numTower == 0){
    fill(#DD9440);
    ellipse(x_tower[0],y_tower[0],radius_tower, radius_tower);
    for(int i = 0; i < amount_towers; i++){
      fill(#775023);
      if(i != numTower) ellipse(x_tower[i],y_tower[i],radius_tower, radius_tower);
    }
  }
  else if(numTower == 1){
    fill(#DD9440);
    ellipse(x_tower[1],y_tower[1],radius_tower, radius_tower);
    for(int i = 0; i < amount_towers; i++){
      fill(#775023);
      if(i != numTower) ellipse(x_tower[i],y_tower[i],radius_tower, radius_tower);
    }
  }
  else if(numTower == 2){
    fill(#DD9440);
    ellipse(x_tower[2],y_tower[2],radius_tower, radius_tower);
    for(int i = 0; i < amount_towers; i++){
      fill(#775023);
      if(i != numTower) ellipse(x_tower[i],y_tower[i],radius_tower, radius_tower);
    }
  }
  else if(numTower == 3){
    fill(#DD9440);
    ellipse(x_tower[3],y_tower[3],radius_tower, radius_tower);
    for(int i = 0; i < amount_towers; i++){
      fill(#775023);
      if(i != numTower) ellipse(x_tower[i],y_tower[i],radius_tower, radius_tower);
    }
  }
  float distancia1 = dist(xPJ, yPJ, x_tower[numTower], y_tower[numTower]);
  float radioSuma1 = (radius_tower / 2.4) + (radius_pj);
    if(numTower == 0 && distancia1 < radioSuma1){
      numTower = 1;
      if(!hasCollidedTower) LessLifes();
    }
    else if(numTower == 1 && distancia1 + 2 < radioSuma1){
      numTower = 2;
      if(!hasCollidedTower) LessLifes();
    }
    else if(numTower == 2 && distancia1 + 2 < radioSuma1){
      numTower = 3;
      if(!hasCollidedTower) LessLifes();
    }
    else if(numTower == 3 && distancia1 + 2 < radioSuma1){
      numTower = 0;
      if(!hasCollidedTower) LessLifes();
    }
    else{
      hasCollidedTower = false;
    }
    for (int j = 0; j < amount_towers; j++) {
      float distancia = dist(xPJ, yPJ, x_tower[j], y_tower[j]);
      float radioSuma = (radius_tower / 2.4) + (radius_pj);
      if (distancia < radioSuma) {
        // Hay colisión
        // Mover la bola fuera del círculo para evitar la sobreposición
        float angulo = atan2(yPJ - y_tower[j], xPJ - x_tower[j]);
        float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
        xPJ = x_tower[j] + cos(angulo) * nuevaDistancia;
        yPJ = y_tower[j] + sin(angulo) * nuevaDistancia;
      }
    }
}

boolean collisionBossPJ = false;
void CheckBossPJCollisions(){
  float distancia = dist(xPJ, yPJ, x_boss, y_boss);
  float radioSuma = (radius_pj / 3.5) + (radius_boss / 1.3);
  if (distancia < radioSuma) {
    // Hay colisión
    // Mover la bola fuera del círculo para evitar la sobreposición
    float angulo = atan2(yPJ - y_boss, xPJ - x_boss);
    float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
    xPJ = x_boss + cos(angulo) * nuevaDistancia;
    yPJ = y_boss + sin(angulo) * nuevaDistancia;
    if(collisionBossPJ == false){
      if(PJ_lifes == 3) PJ_lifes = 2;
      else if(PJ_lifes == 2) PJ_lifes = 1; 
      else if(PJ_lifes == 1) PJ_lifes = 0; 
      collisionBossPJ = true;
    }
  }
  else collisionBossPJ = false;
}



void LessLifes(){
  if(life_towers == 10) life_towers = 9;
  else if(life_towers == 9) life_towers = 8;
  else if(life_towers == 8) life_towers = 7;
  else if(life_towers == 7) life_towers = 6;
  else if(life_towers == 6) life_towers = 5;
  else if(life_towers == 5) life_towers = 4;
  else if(life_towers == 4) life_towers = 3;
  else if(life_towers == 3) life_towers = 2;
  else if(life_towers == 2) life_towers = 1;
  else if(life_towers == 1) life_towers = 0;
  hasCollidedTower = true;
}
