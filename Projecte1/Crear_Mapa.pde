void CrearMapa(){
  fill(255,255,255);
  for(int i = 1; i < circles; i++){
    for(int j = 0; j < circles; j++){
      if(x_circles[i] != x_circles[j] && y_circles[i] != y_circles[j]){
        ellipse(x_circles[i], y_circles[i], circles_radius, circles_radius);
      }
    }
  }
  for(int i = 0; i < squares; i++){
    for(int j = 0; j < squares; j++){
       for(int z = 0; z < circles; z++){
          if(x_squares[i] != x_squares[j] && y_squares[i] != y_squares[j] && x_squares[i] != x_circles[z] && y_squares[i] != y_circles[z]){
            rectMode(CENTER);
            rect(x_squares[i], y_squares[i], squares_height, squares_width);
          }
        }
     }
  }
}
