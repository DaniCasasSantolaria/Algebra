void CheckCirclesCollisions(){
  for (int j = 0; j < circles; j++) {
    float distancia = dist(xPJ, yPJ, x_circles[j], y_circles[j]);
    float radioSuma = (radius_pj) + (circles_radius);
    if (distancia < radioSuma) {
      // Hay colisión
      // Mover la bola fuera del círculo para evitar la sobreposición
      float angulo = atan2(yPJ - y_circles[j], xPJ - x_circles[j]);
      float nuevaDistancia = radioSuma + 1; // Evitar sobreposición
      xPJ = x_circles[j] + cos(angulo) * nuevaDistancia;
      yPJ = y_circles[j] + sin(angulo) * nuevaDistancia;
    }
  }
}
