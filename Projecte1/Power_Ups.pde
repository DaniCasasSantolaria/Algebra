int amountPowerUps = 5;
float[] x_PowerUps = new float [amountPowerUps];
float[] y_PowerUps = new float [amountPowerUps];
// variables de los vértices de los polígonos
int triangle = 3;
int pentagon = 5;
int hexagon = 6;
int heptagon = 7;
int octagon = 8;
float radius_polygon = 20;

boolean touchP0 = false; 
boolean touchP1 = true;
boolean touchP2 = true;
boolean touchP3 = true;
boolean touchP4 = true;
  

void PowerUpsInitialize(){
  //Power Up 1 --> disminuye la velocidad de los enemigos 
  x_PowerUps[0] = 700;
  y_PowerUps[0] = 200;
  //Power Up 2 --> aumenta la velocidad del PJ 
  x_PowerUps[1] = 400;
  y_PowerUps[1] = 300;
  //Power Up 3 --> 1 vida extra 
  x_PowerUps[2] = 250;
  y_PowerUps[2] = 750;
  //Power Up 4 --> los obstáculos no restan vida 
  x_PowerUps[3] = 800;
  y_PowerUps[3] = 350;
  //Power Up 5 --> el PJ triplica su tamaño 
  x_PowerUps[4] = 600;
  y_PowerUps[4] = 700;
}


void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
void printPolygons (){ 
  if (touchP0 == false) {
    pushMatrix();
    translate(width*0.7, height*0.2);
    polygon(x_PowerUps[0],y_PowerUps[0],radius_polygon,triangle);
    popMatrix();
   // Hay colision
    float distancia = dist(xPJ, yPJ, x_PowerUps[0], y_PowerUps[0]);
    float radioSuma = (radius_pj) + (radius_polygon / 6);
    if (distancia < radioSuma) {
      touchP0 = true;
      touchP1 = false; 
      }
  }
  else if (touchP1 == false) {
   pushMatrix();
    translate(width*0.4, height*0.3);
  polygon(x_PowerUps[1],y_PowerUps[1],radius_polygon,pentagon);
  popMatrix();
     for (int j = 0; j < amountPowerUps; j++) {
    float distancia = dist(xPJ, yPJ, x_PowerUps[j], y_PowerUps[j]);
    float radioSuma = (radius_pj) + (radius_polygon / 6);
    if (distancia < radioSuma) {
      touchP1 = true;
      touchP2 = false; 
      }
    }
  }
  else if (touchP2 == false){
  pushMatrix();
  translate(width*0.25, height*0.75);
  polygon(x_PowerUps[2],y_PowerUps[2],radius_polygon,hexagon);
  popMatrix();
  for (int j = 0; j < amountPowerUps; j++) {
    float distancia = dist(xPJ, yPJ, x_PowerUps[j], y_PowerUps[j]);
    float radioSuma = (radius_pj) + (radius_polygon / 6);
    if (distancia < radioSuma) {
      touchP2 = true;
      touchP3 = false; 
      }
    }
  }
  else if (touchP3 == false){
  pushMatrix();
  translate(width*0.8, height*0.35);
  polygon(x_PowerUps[3],y_PowerUps[3],radius_polygon,heptagon);
  popMatrix();
  for (int j = 0; j < amountPowerUps; j++) {
    float distancia = dist(xPJ, yPJ, x_PowerUps[j], y_PowerUps[j]);
    float radioSuma = (radius_pj) + (radius_polygon / 6);
    if (distancia < radioSuma) {
      touchP3 = true;
      touchP4 = false; 
      }
    }
  }
  else if (touchP4 == false){
  pushMatrix();
    translate(width*0.6, height*0.7);
  polygon(x_PowerUps[4],y_PowerUps[4],radius_polygon,octagon);
  popMatrix();
  for (int j = 0; j < amountPowerUps; j++) {
    float distancia = dist(xPJ, yPJ, x_PowerUps[j], y_PowerUps[j]);
    float radioSuma = (radius_pj) + (radius_polygon / 6);
    if (distancia < radioSuma) {
      touchP4 = true;
       }
     }
    }
  }

  
  
  
  
  
  
