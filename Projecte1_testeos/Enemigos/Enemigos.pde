float alpha = 0.02;
float beta = 0.01;
float xPJ = width;
float yPJ = height;
float xPNJ1 = width / 2;
float yPNJ1 = height / 2;
float xPNJ2 = width / 3;
float yPNJ2 = height / 3;
int radius_pj = 25;
int radius_PNJ1 = 20;
int radius_PNJ2 = 15;
int num_enemies = 5;
float[] enemies_x;
float[] enemies_y;
int radius_enemies = 15;
float speed = 5.0;
boolean enemiesGenerated = false;

void setup(){
 size(1000,1000);
 enemies_x = new float [num_enemies];
 enemies_y = new float [num_enemies];
 for(int i = 0; i < num_enemies; i++){
   enemies_x[i] = random(15, width - 15); // 15 and - 15 (radio) para que los enemigos no aparezcan fuera de los parametros de la pantalla
   enemies_y[i] = random(15, height - 15);
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

void GenerateEnemies(){
  fill(0,255,0);
  for(int i = 0; i < num_enemies; i++){
   ellipse(enemies_x[i],enemies_y[i], radius_enemies, radius_enemies); 
  }
  enemiesGenerated = true;  //El booleano es para que se inicialicen una sola vez. Para hacer que los enemigos se muevan el enemiesGenerated deberá ser true.
}

void MovementEnemies(){  // Después de crear los enemigos llamamos a esta función para el movimiento de estos
  for(int i = 0; i < num_enemies; i++){
    enemies_x[i] = (1 - beta) * enemies_x[i] + beta * xPNJ2;
    enemies_y[i] = (1 - beta) * enemies_y[i] + beta * yPNJ2;
    ellipse(enemies_x[i],enemies_y[i], radius_enemies, radius_enemies); 
  }  
}

void draw(){
  background(0);
  CharactersMovement();
  if(enemiesGenerated == false){    //El if es para inicialitzar a los enemigos una vez y después se muevan
    GenerateEnemies();
  }
  else{
    MovementEnemies();
  }
  
  //image(loadImage("Slime.png"), 50.0, 50.0); Para añadir una imagen primero añadir en sketch (arriba izquierda) y seguir este formato
}
