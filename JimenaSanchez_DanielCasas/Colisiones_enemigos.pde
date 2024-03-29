float followNpc_collided;
boolean alreadyCollided = false; // Variable para controlar si ya ha habido una colisión

void QuadTreeEnemies(){  // dividir el mapa en cuadrantes 
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
}

boolean collisionDetected = false;
void CheckEnemiesCollisions(){ 
  //Updating the PJ quadrant
  //Si es mouen s'ha de posar al draw perque es repeteixi tota l'estona
     QuadTreeEnemies();
  //We are optimimizing thanks to the QuadTree
  for(int i = 0; i < amount_npcs; i++){
   //we check the quadrants before the calculations
    if(pj_quadrant == npc_quadrant[i]){ //Si estan en el mismo quadrante hace los calculos
      //The calculations
      float distancia = dist(xPJ, yPJ, npc_x[i], npc_y[i]);
      float radioSuma = (radius_pj) + (radius_npcs / 6);
      if (distancia < radioSuma) {
        // Hay colisión
        npc_x[i] = 100000;    //Envio a los enemigos fuera del mapa y cuando ya haya colisionado con todos, los hacemos desaparecer igualando amount_npcs = 0;
        npc_y[i] = 100000;
        followNpc_collided -= 1;
        punctuation += 10;
      }
    }
    //AQUEST CODI ES PARA LA RESTA DE VIDAS DEL PNJ2 PERO RESTA VIDES CONSTANTMENT
  //  //Check PNJ2 collisions with enemies
  //  float distance = dist(xPNJ2, yPNJ2, npc_x[i], npc_y[i]);
  //  // Si el PNJ2 colisiona con el PNJ controlado con el mouse
  //  if (distance < radius_PNJ2 + (radius_npcs / 2)) {
  //    // Restar una vida al PNJ2 si no ha colisionado antes
  //    if (!alreadyCollided) {
  //      alreadyCollided = true;
  //      PNJ2_lifes--;
  //      println("B");
  //    }
  //  }
  //  else {
  //    // Reiniciar el estado de la colisión si ya no hay colisión
  //    alreadyCollided = false;
  //    println("A");
  //  }
  }
}

void CheckCollisionsBetweenEnemies(){
    for (int j = 1, i = j; j < amount_npcs; j++, i = j) {
      float distancia = dist(npc_x[j], npc_y[j], npc_x[i], npc_y[i]);
      float radioSuma = (radius_npcs) + (radius_npcs / 6);
      if (distancia < radioSuma) {
        // Hay colisión
        // Mover la bola fuera del círculo para evitar la sobreposición
        float angulo = atan2(npc_y[j] - npc_y[i], npc_x[j] - npc_x[i]);
        float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
        npc_x[j] = npc_x[i] + cos(angulo) * nuevaDistancia;
        npc_y[j] = npc_y[i] + sin(angulo) * nuevaDistancia;
        println("A");
      }
    }
}
