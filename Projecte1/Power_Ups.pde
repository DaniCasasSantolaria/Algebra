int amountPowerUps = 5;
float[] x_PowerUps = new float [amountPowerUps];
float[] y_PowerUps = new float [amountPowerUps];
// variables de los vértices de los polígonos
int triangle = 3;
int pentagon = 5;
int hexagon = 6;
int heptagon = 7;
int octagon = 8;
float radius_polygon = 20;

boolean initializePolygons = false;
boolean touchP0 = false; 
boolean touchP1 = true;
boolean touchP2 = true;
boolean touchP3 = true;
boolean touchP4 = true;
  
void PowerUpsInitialize(){
  //Power Up 1 --> disminuye la velocidad de los enemigos 
  x_PowerUps[0] = random(width);
  y_PowerUps[0] = random(height);
  //Power Up 2 --> aumenta la velocidad del PJ 
  x_PowerUps[1] = random(width);
  y_PowerUps[1] = random(height);
  //Power Up 3 --> 1 vida extra 
  x_PowerUps[2] = random(width);
  y_PowerUps[2] = random(height);
  //Power Up 4 --> los obstáculos no restan vida 
  x_PowerUps[3] = random(width);
  y_PowerUps[3] = random(height);
  //Power Up 5 --> el PJ triplica su tamaño 
  x_PowerUps[4] = random(width);
  y_PowerUps[4] = random(height);
  initializePolygons = true;
}

float powerUpSize = 40;
void PrintPolygons (){
  if (touchP0 == false) {
    fill(255, 165, 0); // Color naranja para el power-up
    triangle(x_PowerUps[0] - powerUpSize / 2, y_PowerUps[0] + powerUpSize / 2,
             x_PowerUps[0] + powerUpSize / 2, y_PowerUps[0] + powerUpSize / 2,
             x_PowerUps[0], y_PowerUps[0] - powerUpSize / 2);
   
    // Verificar colisión entre el jugador y el power-up
    if (dist(xPJ, yPJ, x_PowerUps[0], y_PowerUps[0]) < 15 + powerUpSize / 2) {
      // Si hay colisión, activar el power-up y reiniciar su posición
      touchP0 = true;
      touchP1 = false; 
      punctuation += 20;
    }
  }
  else if (touchP1 == false) {
    fill(255, 165, 0); // Color naranja para el power-up
    triangle(x_PowerUps[1] - powerUpSize / 2, y_PowerUps[1] + powerUpSize / 2,
             x_PowerUps[1] + powerUpSize / 2, y_PowerUps[1] + powerUpSize / 2,
             x_PowerUps[1], y_PowerUps[1] - powerUpSize / 2);
   
    // Verificar colisión entre el jugador y el power-up
    if (dist(xPJ, yPJ, x_PowerUps[1], y_PowerUps[1]) < 15 + powerUpSize / 2) {
      // Si hay colisión, activar el power-up y reiniciar su posición
      touchP1 = true;
      touchP2 = false;  
      punctuation += 20;
    }
  }
  else if (touchP2 == false){
    fill(255, 165, 0); // Color naranja para el power-up
    triangle(x_PowerUps[2] - powerUpSize / 2, y_PowerUps[2] + powerUpSize / 2,
             x_PowerUps[2] + powerUpSize / 2, y_PowerUps[2] + powerUpSize / 2,
             x_PowerUps[2], y_PowerUps[2] - powerUpSize / 2);
   
    // Verificar colisión entre el jugador y el power-up
    if (dist(xPJ, yPJ, x_PowerUps[2], y_PowerUps[2]) < 15 + powerUpSize / 2) {
      // Si hay colisión, activar el power-up y reiniciar su posición
      touchP2 = true;
      touchP3 = false;  
      punctuation += 20;
    }
  }
  else if (touchP3 == false){
    fill(255, 165, 0); // Color naranja para el power-up
    triangle(x_PowerUps[3] - powerUpSize / 2, y_PowerUps[3] + powerUpSize / 2,
             x_PowerUps[3] + powerUpSize / 2, y_PowerUps[3] + powerUpSize / 2,
             x_PowerUps[3], y_PowerUps[3] - powerUpSize / 2);
   
    // Verificar colisión entre el jugador y el power-up
    if (dist(xPJ, yPJ, x_PowerUps[3], y_PowerUps[3]) < 15 + powerUpSize / 2) {
      // Si hay colisión, activar el power-up y reiniciar su posición
      touchP3 = true;
      touchP4 = false;  
      punctuation += 20;
    }
  }
  else if (touchP4 == false){
    fill(255, 165, 0); // Color naranja para el power-up
    triangle(x_PowerUps[4] - powerUpSize / 2, y_PowerUps[4] + powerUpSize / 2,
             x_PowerUps[4] + powerUpSize / 2, y_PowerUps[4] + powerUpSize / 2,
             x_PowerUps[4], y_PowerUps[4] - powerUpSize / 2);
   
    // Verificar colisión entre el jugador y el power-up
    if (dist(xPJ, yPJ, x_PowerUps[4], y_PowerUps[4]) < 15 + powerUpSize / 2) {
      // Si hay colisión, activar el power-up y reiniciar su posición
      touchP4 = true;
      punctuation += 20;
      allPowerUps = true;
    }
  }
}

  
  
  
  
  
  
