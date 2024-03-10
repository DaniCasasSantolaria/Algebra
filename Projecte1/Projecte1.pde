//Un PNJ persigue a un PJ
//Usamos la equacion parametrica de la recta
//r(alpha) = P + alpha * vector
//Vector = Q - P
//Q sera la posicion del PJ(Final)
//P sera la posicion del PNJ(Inicial)
//El PJ, osea Q, esta en la posicion del raton
float alpha = 0.02, beta = 0.01;
float xPJ = width, yPJ = height, xPNJ1 = width / 2, yPNJ1 = height / 2, xPNJ2 = width / 3, yPNJ2 = height / 3, prevxPJ, prevyPJ;
float[] npc_x, npc_y, npc_quadrant;
int amount_npcs = 10; // 10 npcs in the scene
int radius_npcs = 20, radius_pj = 25, radius_PNJ1 = 20, radius_PNJ2 = 15;
int pj_quadrant;
boolean enemiesGenerated = false;

void setup(){ //Se ejecuta una vez al principio
  //La ventanta
  size(1000, 1000); 
  npc_x = new float [amount_npcs];
  npc_y = new float [amount_npcs];
  npc_quadrant = new float [amount_npcs];
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
background(0);
  CharactersMovement();
  if(enemiesGenerated == false){    //El if es para inicialitzar a los enemigos una vez y después se muevan
    GenerateEnemies_type1();
  }
  else{
    MovementEnemies();
  }

  //image(loadImage("Slime.png"), 50.0, 50.0); Para añadir una imagen primero añadir en sketch (arriba izquierda) y seguir este formato
  CheckEnemiesCollisions();
}
