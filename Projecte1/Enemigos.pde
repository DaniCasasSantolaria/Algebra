void GenerateEnemies_type1(){
  fill(0,255,255);
  for(int counter = 0; counter < amount_npcs / 2; counter++){
   npc_x[counter] = (int)random(-100, -200);
   npc_y[counter] = (int)random(height);  //Ponemos int porque la pantalla no tiene decimales, tiene pixeles
  }
  for(int i = 0; i < amount_npcs / 2; i++){
   ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
  GenerateEnemies_type2();
  enemiesGenerated = true;  //El booleano es para que se inicialicen una sola vez. Para hacer que los enemigos se muevan el enemiesGenerated deberá ser true.
}

float velocity = 1;
boolean stopping = false;
void MovementEnemies(){  // Después de crear los enemigos llamamos a esta función para el movimiento de estos
  // Actualizar la posición
  for(int i = 0; i < amount_npcs / 2; i++){
    float direction = atan2(yPNJ2 - npc_y[i], xPNJ2 - npc_x[i]);  //La función atan2 sirve para calcular el angulo entre el PNJ2 y los npcs
    //Calculamos el desplazamiento en el eje X y en el eje Y
    float moveX = cos(direction) * velocity;
    float moveY = sin(direction) * velocity;
    npc_x[i] += moveX;
    npc_y[i] += moveY;
    fill(0,255,255);
    ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
  if(velocity <= 3 && stopping == false) velocity += 0.007;
  else if(velocity > 3){
    stopping = true;
  }
  if(stopping == true && velocity > 1) velocity -= 0.01;
  else if (stopping == true && velocity <= 1) stopping = false;
  MovementEnemies_type2();
}
float[] velocidadX, velocidadY;
int[] direccionX, direccionY;
void GenerateEnemies_type2 (){
  velocidadX = new float[amount_npcs];
  velocidadY = new float[amount_npcs];
  direccionX = new int[amount_npcs];
  direccionY = new int[amount_npcs];
  fill(0,255,255);
  for(int counter = amount_npcs / 2; counter < amount_npcs; counter++){
    npc_x[counter] = (int)random(radius_npcs, width - radius_npcs);
    npc_y[counter] = (int)random(radius_npcs, height - radius_npcs);  //Ponemos int porque la pantalla no tiene decimales, tiene pixeles
  }
  for(int i = amount_npcs / 2; i < amount_npcs; i++){
    ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
  for(int i = amount_npcs / 2; i < amount_npcs; i++){
    velocidadX[i] = 2;
    velocidadY[i] = 2;
    direccionX[i] = 1;
    direccionY[i] = -1;
  }
}
void MovementEnemies_type2(){
  velocidadX = new float[amount_npcs];
  velocidadY = new float[amount_npcs];
  direccionX = new int[amount_npcs];
  direccionY = new int[amount_npcs];
  for(int i = amount_npcs / 2; i < amount_npcs; i++){
    ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
  for(int i = amount_npcs / 2; i < amount_npcs; i++){
    npc_x[i] += velocidadX[i] * direccionX[i];
    if((npc_x[i] > width - radius_npcs) || npc_x[i] < radius_npcs) direccionX[i] = -direccionX[i];
    npc_y[i] += velocidadY[i] * direccionY[i];
    if((npc_y[i] > height - radius_npcs) || npc_y[i] < radius_npcs) direccionY[i] = -direccionY[i];
  }
}
