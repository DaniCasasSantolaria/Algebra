float positionX_firstCircle = random(circles_radius, width - (circles_radius * 2));
float positionY_firstCircle = random(circles_radius, height - (circles_radius * 2));
void CreateMap(){
  fill(255,255,255);
  float[] positionCircles;
  positionCircles = new float [2]; // Para guardar la coordenada x y y del circulo que no colisiona con los otros
  boolean circlesNotColliding = false;
  int countCircles = circles;
  //Crear circulos que no colisiones los unos con los otros
  for(int i = 0; i < circles; i++){
    for(int j = i; j >= 0; j--){
      if(i == 0){
        circlesNotColliding = true;
        positionCircles[0] = x_circles[i];
        positionCircles[1] = y_circles[i];
      }
      else{
        float distancia = dist(x_circles[i], y_circles[i], x_circles[j], y_circles[j]);
        float radioSuma = (circles_radius) + (circles_radius);
        if(distancia > radioSuma){
          circlesNotColliding = true;
          positionCircles[0] = x_circles[i];
          positionCircles[1] = y_circles[i];
          j = 0;
        }
      }
    }
    if(circlesNotColliding == true && countCircles > 0){
      ellipse(positionCircles[0], positionCircles[1], circles_radius, circles_radius);
      circlesNotColliding = false;
      countCircles--;
    }
  }
  //Crear cuadrados que no colisiones los unos con los otros
  for(int i = 0; i < squares; i++){
    rectMode(CENTER);
    rect(x_squares[i], y_squares[i], squares_height, squares_width);
  }
}

void DoorToFinalBoss(){
  float radius_door = 300;
  float x_door = width + 50, y_door = 500;
  fill(255);
  ellipse(x_door, y_door, radius_door, radius_door);
  float distance = dist(xPJ, yPJ, x_door, y_door);
  float radioSum = (radius_pj) + (radius_door / 2.1);
  if (distance< radioSum) {
    scene = 2;
  }
}
