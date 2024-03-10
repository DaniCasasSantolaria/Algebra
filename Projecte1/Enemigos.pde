void GenerateEnemies_type1(){
  fill(0,255,255);
  for(int i = 0; i < amount_npcs; i++){
   ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
  enemiesGenerated = true;  //El booleano es para que se inicialicen una sola vez. Para hacer que los enemigos se muevan el enemiesGenerated deberá ser true.
}

void MovementEnemies(){  // Después de crear los enemigos llamamos a esta función para el movimiento de estos
  for(int i = 0; i < amount_npcs; i++){
    npc_x[i] = (1 - beta) * npc_x[i] + beta * xPNJ2;
    npc_y[i] = (1 - beta) * npc_y[i] + beta * yPNJ2;
    fill(0,255,255);
    ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
}

void GenerateEnemies_type2 (){

  
}
