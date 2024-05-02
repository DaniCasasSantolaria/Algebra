PShape wolf;
//Vector lider, vector bandada, vector colision, vector destino
//Al final se suman todos los vectores
//No fer la correspondencia de les velocitats
void setup() {
  size(1000, 1000);
  wolf = loadShape("wilk.obj"); //.obj
}

void draw() {
  background(0);
  shape(wolf, width / 2, height / 2);
  scale(5000);
}
