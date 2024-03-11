void QuadTreeEnemies(float[] vector, float magnitude){  // dividir el mapa en cuadrantes 
  //We label NPCs for the QuadTree 
  //Top left = 1
  //Top right = 2
  //Bottom right = 3
    //Bottom left = 4
  for(int counter = 0; counter < amount_npcs; counter++){ //Si es mouen s'ha de posar al draw perque es repeteixi tota l'estona
   if(npc_x[counter] < width/2.0){
     if(npc_y[counter] < height/2.0) npc_quadrant[counter] = 1;
     else npc_quadrant[counter] = 4;
   }
   else{
     if(npc_y[counter] < height/2.0) npc_quadrant[counter] = 2;
     else npc_quadrant[counter] = 3;
   }
  }
  //We are optimimizing thanks to the QuadTree
  for(int i = 0; i < amount_npcs; i++){
   //we check the quadrants before the calculations
    if(pj_quadrant == npc_quadrant[i]){ //Si estan en el mismo quadrante hace los calculos
      //The calculations
      vector[0] = npc_x[i] - xPJ;//Vx = NPCx - PJx
      vector[1] = npc_y[i] - yPJ;//Vy = NPCy - PJy
      magnitude = sqrt(vector[0] * vector[0] + vector[1] * vector[1]); // = distance
      //When are we having collisions?
      if(magnitude < radius_npcs + radius_pj){
        println("I just collided with ", i);
        // Calcula la dirección entre los personajes
        float direccionX = npc_x[i] - xPJ;
        float direccionY = npc_y[i] - yPJ;
        float distancia = sqrt(direccionX * direccionX + direccionY * direccionY);
        
        // Normaliza la dirección
        vector[0] /= distancia;
        vector[1] /= distancia;
        
        // Ajusta la posición de los personajes para evitar la colisión
        float nuevaDistancia = (radius_npcs * 1.5 + radius_pj) / 2;
        xPJ = npc_x[i] - vector[0] * nuevaDistancia;
        yPJ = npc_y[i] - vector[1] * nuevaDistancia;
      }
    }
  }
}

void CheckEnemiesCollisions(){ 
  float[] vector; //vector from de PJ to any NPC
  float magnitude = 0; //vector size = distance between circles
  //boolean collided = false; // No collision by defect
  vector = new float[2];
  //Updating the PJ quadrant
  for(int counter = 0; counter < amount_npcs; counter++){ //Si es mouen s'ha de posar al draw perque es repeteixi tota l'estona
     QuadTreeEnemies(vector, magnitude);
  }
}
