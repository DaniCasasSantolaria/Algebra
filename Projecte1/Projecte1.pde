//Un PNJ persigue a un PJ
//Usamos la equacion parametrica de la recta
//r(alpha) = P + alpha * vector
//Vector = Q - P
//Q sera la posicion del PJ(Final)
//P sera la posicion del PNJ(Inicial)
//El PJ, osea Q, esta en la posicion del raton
float alpha = 0.02;
float xPJ = width;
float yPJ = height;
float xPNJ1 = width / 2;
float yPNJ1 = height / 2;
float xPNJ2 = width / 3;
float yPNJ2 = height / 3;
int[] npc_x;
int[] npc_y;
int[] npc_quadrant;
int amount_npcs = 10; // 10 npcs in the scene
int radius_npcs = 20;
int radius_pj = 25;
int radius_PNJ1 = 20;
int radius_PNJ2 = 15;
int pj_quadrant;
boolean enemiesGenerated = false;

void setup(){ //Se ejecuta una vez al principio
  //La ventanta
  size(1000, 1000); 
  npc_x = new int [amount_npcs];
  npc_y = new int [amount_npcs];
  npc_quadrant = new int [amount_npcs];
  //NPCS are randomly located
  for(int counter = 0; counter < amount_npcs; counter++){
   npc_x[counter] = (int)random(width);
   npc_y[counter] = (int)random(height);  //Ponemos int porque la pantalla no tiene decimales, tiene pixeles
  }
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

void GenerateEnemies(){
  fill(0,255,0);
  for(int i = 0; i < amount_npcs; i++){
   ellipse(npc_x[i],npc_y[i], radius_npcs, radius_npcs); 
  }
  //enemiesGenerated = true;    El booleano es per a que s'inicialitzin un cop. Per fer que els enemics es moguin el enemiesGenerated haura de ser true.
}

boolean CheckEnemiesCollisions(){
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
        return true;
      }
    }
  }
  return false;
}

void CharactersMovement(){
  fill(255, 0, 0);
  if(sqrt((1 - mouseX)*(1 - mouseX) + (1 - mouseY) * (1 - mouseY)) > 10) {
  xPJ = (1 - alpha) * xPJ + alpha * mouseX;
  yPJ = (1 - alpha) * yPJ + alpha * mouseY;
  }
  ellipse(xPJ,yPJ, radius_pj, radius_pj);
  //Pintar al PNJ
  //PNJ = (1 - alpha) * PNJ + alpha * PJ
  fill(255, 255, 45);
  if(sqrt((xPJ - xPNJ1)*(xPJ - xPNJ1) + (yPJ - yPNJ1) * (yPJ - yPNJ1)) > 70) {
    xPNJ1 = (1 - alpha) * xPNJ1 + alpha * xPJ;
    yPNJ1 = (1 - alpha) * yPNJ1 + alpha * yPJ;
  }
  ellipse(xPNJ1, yPNJ1, radius_PNJ1, radius_PNJ1);
  fill(255, 0, 45);
  if(sqrt((xPNJ1 - xPNJ2)*(xPNJ1 - xPNJ2) + (yPNJ1 - yPNJ2) * (yPNJ1 - yPNJ2)) > 50) {
  xPNJ2 = (1 - alpha) * xPNJ2 + alpha * xPNJ1;
  yPNJ2 = (1 - alpha) * yPNJ2 + alpha * yPNJ1;
  }
  ellipse(xPNJ2, yPNJ2, radius_PNJ2, radius_PNJ2);
}

void draw(){ //Se ejecuta infinitas veces
  //Pintar el PJ
  background(0);
  //if(enemiesGenerated == false){    El if es perque els enemics es per inicialitzar els enemics
    GenerateEnemies();
  //}
  CharactersMovement();
  CheckEnemiesCollisions();
}
