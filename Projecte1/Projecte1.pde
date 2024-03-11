//Un PNJ persigue a un PJ
//Usamos la equacion parametrica de la recta
//r(alpha) = P + alpha * vector
//Vector = Q - P
//Q sera la posicion del PJ(Final)
//P sera la posicion del PNJ(Inicial)
//El PJ, osea Q, esta en la posicion del raton
int scene;  //0 es el menú, 1 la primera sala, 2 la sala del jefe y 3 menú GAME OVER
float alpha = 0.02;
float xPJ = width / 2, yPJ = height / 2, xPNJ1 = width - 50, yPNJ1 = 900, xPNJ2 = 900, yPNJ2 = 175;
float[] npc_x, npc_y, npc_quadrant;
int amount_npcs; // npcs en la escena
int radius_npcs = 20, radius_pj = 25, radius_PNJ1 = 20, radius_PNJ2 = 15;
int pj_quadrant;
boolean enemiesGenerated = false;
//Mapa
int circles_radius = 60, squares_height = 50, squares_width = 90;
int circles = (int)random(6, 10); //Crear entre 6 y 10 circulos como objetos en el mapa
int squares = 12 - circles;
float[] x_circles, y_circles, x_squares, y_squares, circle_quadrant, square_quadrant; //Coordenadas circulos y cuadrados
boolean touchPNJ1 = false, touchPNJ2; //Para comprobar si el PJ ha tocado al PNJ1 y al PNJ2
boolean menuOptions = false;

void setup(){ //Se ejecuta una vez al principio
  //La ventanta
  size(1000, 1000);
  scene = 0;
  PJ_lifes = 3;
  PNJ2_lifes = 4;
  circle_quadrant = new float [circles];
  square_quadrant = new float [squares];
  //NPCS are randomly located
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

void CheckCharacterQuadrant(){
  if(xPJ < width/2.0){
    if(yPJ < height/2.0) pj_quadrant = 1;
    else pj_quadrant = 4;
  }
  else{
    if(yPJ < height/2.0) pj_quadrant = 2;
    else pj_quadrant = 3;
  }
}

void CharactersMovementMouse(){
  float[] vector; //vector from de PJ to any NPC
  float magnitude = 0; //vector size = distance between circles
  vector = new float [2];
  fill(255, 0, 0);
  if(sqrt((1 - mouseX)*(1 - mouseX) + (1 - mouseY) * (1 - mouseY)) > 10) {
    xPJ = (1 - alpha) * xPJ + alpha * mouseX;
    yPJ = (1 - alpha) * yPJ + alpha * mouseY;
  }
  //Pintar al PNJ
  ellipse(xPJ, yPJ, radius_pj, radius_pj);
  //PNJ = (1 - alpha) * PNJ + alpha * PJ
  vector[0] = xPNJ1 - xPJ;//Vx = NPCx - PJx
  vector[1] = yPNJ1 - yPJ;//Vy = NPCy - PJy
  magnitude = sqrt(vector[0] * vector[0] + vector[1] * vector[1]); // = distance
  CheckPNJCollisions(magnitude);
  CheckEnemiesCollisions();
  CheckCirclesCollisions();
}

void draw(){ //Se ejecuta infinitas veces
  switch(scene){
  case 0:  //Menú
    if(clickedPlay == false && clickedControls == false){
      CreateMenu();
    }
    else if(clickedPlay == true){
      MenuPlay();
      npc_x = new float [amount_npcs];
      npc_y = new float [amount_npcs];
      npc_quadrant = new float [amount_npcs];
    }
    else if(clickedControls == true){
      MenuControls();
    }
    break;
  case 1:  //Sala 1
    if(key == TAB) menuOptions = true;
    if(menuOptions == true){
      MenuOptions();
    }
    else{
      background(33);
    LifeBar();
    CharactersMovementMouse();
    CheckCharacterQuadrant();
    if(touchPNJ1 == true && touchPNJ2 == true){
      if(enemiesGenerated == false){    //El if es para inicialitzar a los enemigos una vez y después se muevan
        GenerateEnemies_type1();
      }
      else{
        MovementEnemies();
      }
      //image(loadImage("Slime.png"), 50.0, 50.0); Para añadir una imagen primero añadir en sketch (arriba izquierda) y seguir este formato
    }
    CrearMapa();
    }
      break;
   case 2:  //Sala del jefe
     break;
   case 3:  //GAME OVER
     if(PJ_lifes == 0) GameOver();
     else GameCompleted();
     break;
  }
}
