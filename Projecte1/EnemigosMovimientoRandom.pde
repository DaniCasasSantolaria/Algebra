float[] enemyX;
float[] enemyY;
float[] enemyAngle;
float[] enemySpeed;
float[] enemyRadius;

int numEnemies;
boolean enemiesInitialized = false;

void InitializeRandomMovementEnemies(){
  numEnemies = amount_npcs / 2;
  enemyX = new float[numEnemies];
  enemyY = new float[numEnemies];
  enemyAngle = new float[numEnemies];
  enemySpeed = new float[numEnemies];
  enemyRadius = new float[numEnemies];
  
  // Configurar valores iniciales para cada enemigo
  for (int i = 0; i < numEnemies; i++) {
    enemyRadius[i] = radius_npcs;
    enemyX[i] = enemyRadius[i] + 10;
    enemyY[i] = random(height);
    enemyAngle[i] = random(TWO_PI);
    enemySpeed[i] = 1.5;
  }
  enemiesInitialized = true;
}

void RandomMovementEnemies() {
  // Actualizar y mostrar cada enemigo
  for (int i = 0; i < numEnemies; i++) {
      // Cambio aleatorio de dirección
      CheckRandomEnemiesCollisions(i);
      enemyAngle[i] += random(-0.1, 0.1);
      
      // Calcula el vector de velocidad
      float velocityX = cos(enemyAngle[i]) * enemySpeed[i];
      float velocityY = sin(enemyAngle[i]) * enemySpeed[i];
      
      // Agrega el vector velocidad a la posición
      enemyX[i] += velocityX;
      enemyY[i] += velocityY;
      
      // Verifica límites de la pantalla
      if (enemyX[i] < enemyRadius[i] || enemyX[i] > width - enemyRadius[i]) {
        enemyAngle[i] = PI - enemyAngle[i]; // Cambia dirección en el eje x
      }
      if (enemyY[i] < enemyRadius[i] || enemyY[i] > height - enemyRadius[i]) {
        enemyAngle[i] = -enemyAngle[i]; // Cambia dirección en el eje y
      }
      // Mostrar enemigo
      fill(0,255,200);
      ellipse(enemyX[i], enemyY[i], enemyRadius[i]*2, enemyRadius[i]*2);
  }
}
void CheckRandomEnemiesCollisions(int i){
  float distancia = dist(enemyX[i], enemyY[i], xPJ, yPJ);
  float radioSuma = (radius_pj) + (radius_npcs / 6);
  if (distancia < radioSuma) {
    // Hay colisión
    // Mover la bola fuera del círculo para evitar la sobreposición
    enemyX[i] = -100000;
    enemyY[i] = -100000;
    punctuation += 10;
    followNpc_collided--;
  }
}
