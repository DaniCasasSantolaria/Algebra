
void CheckEnemiesCollisions(){ 
  float[] vector; //vector from de PJ to any NPC
  float magnitude; //vector size = distance between circles
  //boolean collided = false; // No collision by defect
  vector = new float[2];
  //Updating the PJ quadrant
  for(int counter = 0; counter < amount_npcs; counter++){ //Si es mouen s'ha de posar al draw perque es repeteixi tota l'estona
   if(xPJ < width/2.0){
     if(yPJ < height/2.0) pj_quadrant = 1;
     else pj_quadrant = 4;
   }
   else{
     if(yPJ < height/2.0) pj_quadrant = 2;
     else pj_quadrant = 3;
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
        xPJ = prevxPJ; 
        yPJ = prevyPJ;
      }
      else{
        prevxPJ = xPJ - 1;
        prevyPJ = yPJ - 1;
      }
    }
  }
}
