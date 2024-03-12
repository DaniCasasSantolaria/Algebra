void CheckCirclesCollisions(){
  for (int j = 0; j < circles; j++) {
    float distancia = dist(xPJ, yPJ, x_circles[j], y_circles[j]);
    float radioSuma = (radius_pj) + (circles_radius / 6);
    if (distancia < radioSuma) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(yPJ - y_circles[j], xPJ - x_circles[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      xPJ = x_circles[j] + cos(angulo) * nuevaDistancia;
      yPJ = y_circles[j] + sin(angulo) * nuevaDistancia;
    }
      
    float distancia1 = dist(xPNJ1, yPNJ1, x_circles[j], y_circles[j]);
    float radioSuma1 = (radius_PNJ1) + (circles_radius / 3);
    if (distancia1 < radioSuma1) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(yPNJ1 - y_circles[j], xPNJ1 - x_circles[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      xPNJ1 = x_circles[j] + cos(angulo) * nuevaDistancia;
      yPNJ1 = y_circles[j] + sin(angulo) * nuevaDistancia;
    }
    float distancia2 = dist(xPNJ2, yPNJ2, x_circles[j], y_circles[j]);
    float radioSuma2 = (radius_PNJ2) + (circles_radius / 2);
    if (distancia2 < radioSuma2) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(yPNJ2 - y_circles[j], xPNJ2 - x_circles[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      xPNJ2 = x_circles[j] + cos(angulo) * nuevaDistancia;
      yPNJ2 = y_circles[j] + sin(angulo) * nuevaDistancia;
    }
  }
}

void CheckSquaresCollisions(){
  PVector min_pj = new PVector(xPJ-squares_height/2.0,yPJ+squares_height/2.0);
  PVector max_pj = new PVector(xPJ+squares_height/2.0,yPJ-squares_height/2.0);
  // We continue with the walls (we loop through them)
  PVector min_wall = new PVector(0,0);
  PVector max_wall = new PVector(0,0);
  boolean collided;
  for(int counter=0;counter<squares;counter++){
    min_wall.x = x_squares[counter] - squares_height/2.0;
    min_wall.y = y_squares[counter] + squares_height/2.0;
    max_wall.x = x_squares[counter] + squares_height/2.0;
    max_wall.y = y_squares[counter] - squares_height/2.0;
    // We perform the Min Max Test
    if ((max_pj.x<min_wall.x)||(max_pj.y>min_wall.y)||
    (max_wall.x<min_pj.x)||(max_wall.y>min_pj.y)) collided = false;
    else collided = true;
    fill(255,255,255);
    if (collided){
      fill(255,0,0);
      rect(x_squares[counter], y_squares[counter], squares_height, squares_width);
    }
  }
}
