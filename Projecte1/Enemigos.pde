void GenerateEnemies_type1(){
  fill(0,255,255);
  for(int counter = 0; counter < amount_npcs; counter++){
   npc_x[counter] = (int)random(-50, -200);
   npc_y[counter] = (int)random(height);  //Ponemos int porque la pantalla no tiene decimales, tiene pixeles
  }
  for(int i = 0; i < amount_npcs / 2; i++){
   ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
  enemiesGenerated = true;  //El booleano es para que se inicialicen una sola vez. Para hacer que los enemigos se muevan el enemiesGenerated deberá ser true.
}

void MovementEnemies(){  // Después de crear los enemigos llamamos a esta función para el movimiento de estos
  float velocidad = 2; 
  // Actualizar la posición
  for(int i = 0; i < amount_npcs / 2; i++){
    float direction = atan2(yPNJ2 - npc_y[i], xPNJ2 - npc_x[i]);  //La función atan2 sirve para calcular el angulo entre el PNJ2 y los npcs
    //Calculamos el desplazamiento en el eje X y en el eje Y
    float moveX = cos(direction) * velocidad;
    float moveY = sin(direction) * velocidad;
    npc_x[i] += moveX;
    npc_y[i] += moveY;
    fill(0,255,255);
    ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
}

void GenerateEnemies_type2 (){

  
}
