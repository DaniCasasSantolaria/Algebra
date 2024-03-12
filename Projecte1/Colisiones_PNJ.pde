void CheckPNJCollisions(float magnitude){
  float[] vector; //vector from de PJ to any NPC
  vector = new float [2];
 //When are we having collisions?
  if(touchPNJ1 == false){
    if(magnitude < radius_PNJ1 + radius_pj){
      touchPNJ1 = true;
      println("I just collided with PNJ1");
    }
  }
  else{
    if(sqrt((xPJ - xPNJ1)*(xPJ - xPNJ1) + (yPJ - yPNJ1) * (yPJ - yPNJ1)) > 70) {
      xPNJ1 = (1 - alpha) * xPNJ1 + alpha * xPJ;
      yPNJ1 = (1 - alpha) * yPNJ1 + alpha * yPJ;
    }
  }
  if(touchPNJ2 == false && touchPNJ1 == true){
    vector[0] = xPJ - xPNJ2;
    vector[1] = yPJ - yPNJ2;
    magnitude = sqrt(vector[0] * vector[0] + vector[1] * vector[1]); // = distance
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
