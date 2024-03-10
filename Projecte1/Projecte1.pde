//Un PNJ persigue a un PJ
//Usamos la equacion parametrica de la recta
//r(alpha) = P + alpha * vector
//Vector = Q - P
//Q sera la posicion del PJ(Final)
//P sera la posicion del PNJ(Inicial)
//El PJ, osea Q, esta en la posicion del raton
float alpha = 0.02;
float xPJ = width, yPJ = height, xPNJ1 = width - 50, yPNJ1 = 900, xPNJ2 = 900, yPNJ2 = 175;
float[] npc_x, npc_y, npc_quadrant;
int amount_npcs = 10; // 10 npcs en la escena
int radius_npcs = 20, radius_pj = 25, radius_PNJ1 = 20, radius_PNJ2 = 15;
int pj_quadrant;
boolean enemiesGenerated = false;
//Mapa
int circles_radius = 60, squares_height = 50, squares_width = 90;
int circles = (int)random(6, 10); //Crear entre 6 y 10 circulos como objetos en el mapa
int squares = 12 - circles;
float[] x_circles, y_circles, x_squares, y_squares; //Coordenadas circulos y cuadrados
boolean touchPNJ1 = false, touchPNJ2; //Para comprobar si el PJ ha tocado al PNJ1 y al PNJ2

void setup(){ //Se ejecuta una vez al principio
  //La ventanta
  size(1000, 1000); 
  PJ_lifes = 3;
  PNJ2_lifes = 4;
  npc_x = new float [amount_npcs];
  npc_y = new float [amount_npcs];
  npc_quadrant = new float [amount_npcs];
  //NPCS are randomly located
  for(int counter = 0; counter < amount_npcs; counter++){
   npc_x[counter] = (int)random(width);
   npc_y[counter] = (int)random(height / 2, height);  //Ponemos int porque la pantalla no tiene decimales, tiene pixeles
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
  //Objetos mapa
  x_circles = new float [circles];
  y_circles = new float [circles];
  x_squares = new float [squares];
  y_squares = new float [squares];
  for(int i = 0; i < circles; i++){
    x_circles[i] = random(circles_radius, width - circles_radius);
    y_circles[i] = random(circles_radius, height - circles_radius);
  }
  for(int i = 0; i < squares; i++){
    x_squares[i] = random(squares_height, width - squares_height);
    y_squares[i] = random(squares_height, width - squares_height);
  }
}

void CharactersMovement(){
  float[] vector; //vector from de PJ to any NPC
  float magnitude; //vector size = distance between circles
  vector = new float [4];
  fill(255, 0, 0);
  if(sqrt((1 - mouseX)*(1 - mouseX) + (1 - mouseY) * (1 - mouseY)) > 10) {
  xPJ = (1 - alpha) * xPJ + alpha * mouseX;
  yPJ = (1 - alpha) * yPJ + alpha * mouseY;
  }
  ellipse(xPJ,yPJ, radius_pj, radius_pj);
  //Pintar al PNJ
  //PNJ = (1 - alpha) * PNJ + alpha * PJ
  vector[0] = xPNJ1 - xPJ;//Vx = NPCx - PJx
  vector[1] = yPNJ1 - yPJ;//Vy = NPCy - PJy
  magnitude = sqrt(vector[0] * vector[0] + vector[1] * vector[1]); // = distance
  //When are we having collisions?
  if(touchPNJ1 == false){
    if(magnitude < radius_PNJ1 + radius_pj){
      touchPNJ1 = true;
      println("I just collided with PNJ1");
    }
  }
  else{
    if(sqrt((xPJ - xPNJ1)*(xPJ - xPNJ1) + (yPJ - yPNJ1) * (yPJ - yPNJ1)) > 70){
        xPNJ1 = (1 - alpha) * xPNJ1 + alpha * xPJ;
        yPNJ1 = (1 - alpha) * yPNJ1 + alpha * yPJ;
    }
  }
  if(touchPNJ2 == false && touchPNJ1 == true){
    vector[2] = xPJ - xPNJ2;
    vector[3] = yPJ - yPNJ2;
    magnitude = sqrt(vector[2] * vector[2] + vector[3] * vector[3]); // = distance
    if(magnitude < radius_PNJ2 + radius_pj){
      touchPNJ2 = true;
      println("I just collided with PNJ2");
    }
  }
  else if (touchPNJ1 == true){ 
    if(sqrt((xPNJ1 - xPNJ2)*(xPNJ1 - xPNJ2) + (yPNJ1 - yPNJ2) * (yPNJ1 - yPNJ2)) > 50) {
    xPNJ2 = (1 - alpha) * xPNJ2 + alpha * xPNJ1;
    yPNJ2 = (1 - alpha) * yPNJ2 + alpha * yPNJ1;
    }
  }
  fill(255, 255, 45);
  ellipse(xPNJ1, yPNJ1, radius_PNJ1, radius_PNJ1);
  if(touchPNJ1 == true){
    fill(255, 0, 45);
    ellipse(xPNJ2, yPNJ2, radius_PNJ2, radius_PNJ2);
  }
}

void draw(){ //Se ejecuta infinitas veces
  background(33);
  LifeBar();
  CharactersMovement();
  if(touchPNJ1 == true && touchPNJ2 == true){
    if(enemiesGenerated == false){    //El if es para inicialitzar a los enemigos una vez y después se muevan
      GenerateEnemies_type1();
    }
    else{
      MovementEnemies();
    }
  }

  //image(loadImage("Slime.png"), 50.0, 50.0); Para añadir una imagen primero añadir en sketch (arriba izquierda) y seguir este formato
  CheckEnemiesCollisions();
  CrearMapa();
}
