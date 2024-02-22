//Un PNJ persigue a un PJ
//Usamos la equacion parametrica de la recta
//r(alpha) = P + alpha * vector
//Vector = Q - P
//Q sera la posicion del PJ(Final)
//P sera la posicion del PNJ(Inicial)
//El PJ, osea Q, esta en la posicion del raton
float alpha = 0.05;
float xPNJ1 = width / 2;
float yPNJ1 = height / 2;
float xPNJ2 = width / 4;
float yPNJ2 = height / 4;
void setup(){ //Se ejecuta una vez al principio
  //La ventanta
  size(1000, 1000); 
}

void draw(){ //Se ejecuta infinitas veces
  //Pintar el PJ
  background(0);
  fill(255, 0, 0);
  ellipse(mouseX,mouseY, 30.0, 30.0);
  //Pintar al PNJ
  //PNJ = (1 - alpha) * PNJ + alpha * PJ
  fill(255, 255, 45);
  if(sqrt((mouseX - xPNJ1)*(mouseX - xPNJ1) + (mouseY - yPNJ1) * (mouseY - yPNJ1)) > 60) {
    xPNJ1 = (1 - alpha) * xPNJ1 + alpha * mouseX;
    yPNJ1 = (1 - alpha) * yPNJ1 + alpha * mouseY;
  }
  if(sqrt((mouseX - xPNJ1)*(mouseX - xPNJ1) + (mouseY - yPNJ1) * (mouseY - yPNJ1)) < 26.0) {
    println("Collision");
  }
  ellipse(xPNJ1, yPNJ1, 20.0, 20.0);
  fill(255, 0, 45);
  if(sqrt((xPNJ1 - xPNJ2)*(xPNJ1 - xPNJ2) + (yPNJ1 - yPNJ2) * (yPNJ1 - yPNJ2)) > 50) {
  xPNJ2 = (1 - alpha) * xPNJ2 + alpha * xPNJ1;
  yPNJ2 = (1 - alpha) * yPNJ2 + alpha * yPNJ1;
  }
    ellipse(xPNJ2, yPNJ2, 15.0, 15.0);
}
