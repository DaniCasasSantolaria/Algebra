boolean PJisCollided = false;
boolean PJhasCollided = false;

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
  for (int j = 0; j < squares; j++) {
    float distancia = dist(xPJ, yPJ, x_squares[j], y_squares[j]);
    float radioSuma = (radius_pj) + (squares_height / 3);
    if (distancia < radioSuma) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(yPJ - y_squares[j], xPJ - x_squares[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      xPJ = x_squares[j] + cos(angulo) * nuevaDistancia;
      yPJ = y_squares[j] + sin(angulo) * nuevaDistancia;
    }
      
    float distancia1 = dist(xPNJ1, yPNJ1, x_squares[j], y_squares[j]);
    float radioSuma1 = (radius_PNJ1) + (squares_height / 3);
    if (distancia1 < radioSuma1) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(yPNJ1 - y_squares[j], xPNJ1 - x_squares[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      xPNJ1 = x_squares[j] + cos(angulo) * nuevaDistancia;
      yPNJ1 = y_squares[j] + sin(angulo) * nuevaDistancia;
    }
    float distancia2 = dist(xPNJ2, yPNJ2, x_squares[j], y_squares[j]);
    float radioSuma2 = (radius_PNJ2) + (squares_height / 3);
    if (distancia2 < radioSuma2) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(yPNJ2 - y_squares[j], xPNJ2 - x_squares[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      xPNJ2 = x_squares[j] + cos(angulo) * nuevaDistancia;
      yPNJ2 = y_squares[j] + sin(angulo) * nuevaDistancia;
    }
  }
}
