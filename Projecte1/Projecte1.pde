//Un PNJ persigue a un PJ
//Usamos la equacion parametrica de la recta
//r(alpha) = P + alpha * vector
//Vector = Q - P
//Q sera la posicion del PJ(Final)
//P sera la posicion del PNJ(Inicial)
//El PJ, osea Q, esta en la posicion del raton
int scene;  //0 es el menú, 1 la primera sala, 2 la sala del jefe, 3 menú GAME OVER y 4 cuando se acaba el tiempo
boolean start = true;
float alpha = 0.02;
float xPJ, yPJ, xPNJ1 = width - 50, yPNJ1 = 900, xPNJ2 = 900, yPNJ2 = 175;
float[] npc_x, npc_y, npc_quadrant;
int amount_npcs = 2; // npcs en la escena
int radius_npcs = 20, radius_pj = 25, radius_PNJ1 = 20, radius_PNJ2 = 15;
int pj_quadrant;
boolean enemiesGenerated = false;
//Mapa
int circles_radius = 30, squares_height = 40, squares_width = 40;
int circles = (int)random(6, 10); //Crear entre 6 y 10 circulos como objetos en el mapa
int squares = 12 - circles;
float[] x_circles, y_circles, x_squares, y_squares, circle_quadrant, square_quadrant; //Coordenadas circulos y cuadrados
boolean touchPNJ1 = false, touchPNJ2 = false; //Para comprobar si el PJ ha tocado al PNJ1 y al PNJ2
boolean menuOptions = false;
boolean doorToFinalBoss = false;
boolean allPowerUps = false;

void setup(){ //Se ejecuta una vez al principio
  //La ventanta
  size(1000, 1000);
  scene = 0;
  PJ_lifes = 3;
  PNJ2_lifes = 3;
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
  //Boss final
  x_boss = 800;
  y_boss = 500;
  x_tower = new float[amount_towers];
  y_tower = new float[amount_towers];
  // asignación de posiciones de las torres 
  x_tower[0] = radius_tower;
  y_tower[0] = radius_tower;
  x_tower[1] = width - radius_tower; 
  y_tower[1] = radius_tower; 
  x_tower[2] = radius_tower;
  y_tower[2] = height - radius_tower;
  x_tower[3] = width - radius_tower;
  y_tower[3] = height - radius_tower;

  x_obstacles = new float[amount_obstacles];
  y_obstacles = new float[amount_obstacles];
  //asignación de posiciones de los obstáculos 
  x_obstacles[0] = radius_tower * 2; 
  y_obstacles[0] = height/3;
  x_obstacles[1] = radius_tower * 2; 
  y_obstacles[1] = (2 * height)/3;
  x_obstacles[2] = width/3;
  y_obstacles[2] = height -radius_tower * 2;
  x_obstacles[3] = (2 * width)/3;
  y_obstacles[3] = height - radius_tower * 2;
  x_obstacles[4] = width - radius_tower * 2;
  y_obstacles[4] = (2 * height)/3;
  x_obstacles[5] = width - radius_tower * 2;
  y_obstacles[5] = height/3;
  x_obstacles[6] = (2 * width)/3;
  y_obstacles[6] = radius_tower * 2;
  x_obstacles[7] = width/3;
  y_obstacles[7] = radius_tower * 2;
  //Para poner el valor del contador en el tiempo que queramos
  tiempoRestante = tiempoTotal;
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
  if(start == true){
    xPJ = width / 2;
    yPJ = height / 2;
    start = false;
  }
  else{
    float direction = atan2(mouseY - yPJ, mouseX - xPJ);  //La función atan2 sirve para calcular el angulo entre el PNJ2 y los npcs
    //Calculamos el desplazamiento en el eje X y en el eje Y
    float velocityPJ = 4;
    float moveX = cos(direction) * velocityPJ;
    float moveY = sin(direction) * velocityPJ;
    xPJ += moveX;
    yPJ += moveY;
    fill(0,255,255);
    ellipse(xPJ, yPJ, radius_pj, radius_pj);
  }
}

void CharactersMovementKeyboard(){
  fill(255, 0, 0);
  if(start == true){
    xPJ = width / 2;
    yPJ = height / 2;
    start = false;
  }
  else{
    if(keyboardControl){
      if(keyPressed && key == 'w' && yPJ > 12){
        yPJ -= 4;
      }
      if(keyPressed && key == 's' && yPJ < height - 12){
        yPJ += 4;
      }
      if(keyPressed && key == 'd' && xPJ < width - 12){
        xPJ += 4;
      }
      if(keyPressed && key == 'a' && xPJ > 12){
        xPJ -= 4;
      }
    }
  }
}

void draw(){ //Se ejecuta infinitas veces
  switch(scene){
  case 0:  //Menú
    RestartTimer();
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
      background(33);
      CreateMap();
      if(mouseControl) CharactersMovementMouse();
      else if(keyboardControl) CharactersMovementKeyboard();
      CheckCharacterQuadrant();
      float[] vector; //vector from de PJ to any NPC
      float magnitude = 0; //vector size = distance between circles
      vector = new float [2];
      vector[0] = xPNJ1 - xPJ;//Vx = NPCx - PJx
      vector[1] = yPNJ1 - yPJ;//Vy = NPCy - PJy
      magnitude = sqrt(vector[0] * vector[0] + vector[1] * vector[1]); // = distance
      if(followNpc_collided > 0) CheckEnemiesCollisions();
      else amount_npcs = 0; // Hacemos desaparecer a los NPCs
      CheckPNJCollisions(magnitude);
      CheckCirclesCollisions();
      CheckSquaresCollisions();
      if(touchPNJ1 == true && touchPNJ2 == true){
        if(enemiesGenerated == false){    //El if es para inicialitzar a los enemigos una vez y después se muevan
          GenerateEnemies_type1();
        }
        else{
          MovementEnemies();
          LifeBarPNJ2();
          //CheckCollisionsBetweenEnemies();
        }
      }
      if(followNpc_collided <= 0 && allPowerUps){
        DoorToFinalBoss();
      }
      LifeBar();
      Punctuation();
      ShowTimer();
      UpdateTimer();
      printPolygons();
      break;
   case 2:  //Sala del jefe
     CreateBossMap();
     if(mouseControl) CharactersMovementMouse();
     else if(keyboardControl) CharactersMovementKeyboard();
     break;
   case 3:  //GAME OVER
     if(PJ_lifes == 0) GameOver();
     else GameCompleted();
     break;
   case 4:
     if(tiempoRestante <= 0) TimerOver();
  }  
}
