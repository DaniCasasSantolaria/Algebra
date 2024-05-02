// Un sistema de particules necessita estructura
// Una bona manera d'estructurar es tenir objectes
// Els objectes es creen amb classes
// Una particula pot ser un objecte!

//Variables i objectes
float increment_temps = 0.04;
particula[] particulas_derecha;
particula[] particulas_izquierda;
particula[] particulas;
int num_particulas = 1;
particula lider;
//Funcions i classes
class particula {
  // Atributs
  PVector posicio_particula;  // Posició
  PVector velocitat_particula;  // Velocitat
  PVector acceleracio_particula;  //Acceleració
  float massa_particula;  //Massa
  float tamany_particula;
  color color_particula;
  //Constructor
  particula() {
    posicio_particula = new PVector(width / 2, height / 2);  // Posició
    velocitat_particula = new PVector(0.0, 0.0);  // Velocitat
    acceleracio_particula = new PVector(0.0, 0.0);  //Acceleració
  }
  particula(PVector p, PVector v, float m, float tam, color c) {
    posicio_particula = new PVector(0.0, 0.0);  // Posició
    velocitat_particula = new PVector(0.0, 0.0);  // Velocitat
    acceleracio_particula = new PVector(0.0, 0.0);  //Acceleració

    posicio_particula.set(p);  // Posició
    velocitat_particula.set(v);  // Velocitat
    massa_particula = m;  //Massa
    tamany_particula = tam;
    color_particula = c;
  }
  //Metodes
  void calcula_particula(PVector lider) {
    //Solver EULER
    PVector acumulador_forsa;
    acumulador_forsa = new PVector(0.0, 0.0);
    // 0) Acumular les forces
    lider.normalize();
    PVector desti = new PVector(width - posicio_particula.x, 0 - posicio_particula.y);
    PVector follow = new PVector(lider.x - posicio_particula.x, lider.y - posicio_particula.y);
    follow.normalize();
    acumulador_forsa.x = desti.x; // Podria afegir més forces
    acumulador_forsa.y = desti.y;
    // 1) Acceleració
    acceleracio_particula.x = acumulador_forsa.x / massa_particula;
    acceleracio_particula.y = acumulador_forsa.y / massa_particula;
    // 2) Velocitat
    velocitat_particula.x = velocitat_particula.x + acceleracio_particula.x * increment_temps;
    velocitat_particula.y = velocitat_particula.y + acceleracio_particula.y * increment_temps;
    // 3) Posició
    posicio_particula.x = posicio_particula.x + velocitat_particula.x * increment_temps;
    posicio_particula.y = posicio_particula.y + velocitat_particula.y * increment_temps;
  }

  void pinta_particula() {
    fill(color_particula);
    ellipse(posicio_particula.x, posicio_particula.y, tamany_particula, tamany_particula);
  }
}


void setup() {
  size(1000, 1000);
  // Contructor = PVector p, PVector v, float m, float tam, color c
  //particulas_derecha = new particula[particulas];
  //particulas_izquierda = new particula[particulas];
  particulas = new particula[num_particulas];
  for (int i = 0; i < num_particulas; i++) {
    //particulas_derecha[i] = new particula(new PVector(width / 2, height / 2), new PVector(-10.0, -30.0), 1, 30, color(255, 0, 0));
    //particulas_izquierda[i] = new particula(new PVector(width / 2, height / 2), new PVector(10.0, -30.0), 1, 30, color(0, 255, 0));
    particulas[i] = new particula(new PVector(0, height / 2), new PVector(10.0, -10.0), 1, 20, color(0, 255, 0));
  }
  lider = new particula(new PVector(width / 2, height / 2), new PVector(10.0, -30.0), 2, 30, color(255));
}

void draw() {
  background(0);
  fill(#804000);


  // Calcular
  //for (int i = 0; i < particulas; i++) {
  //  if (particulas_derecha[i].posicio_particula.x > width || particulas_derecha[i].posicio_particula.x < 0 || particulas_derecha[i].posicio_particula.y > height || particulas_derecha[i].posicio_particula.y < 0) {
  //    particulas_derecha[i] = new particula(new PVector(width / 2, height / 2), new PVector(random(-30.0, -10.0), random(-50.0, -30.0)), 1, 30, color(255, 0, 0));
  //  }
  //  if (particulas_izquierda[i].posicio_particula.x > width || particulas_izquierda[i].posicio_particula.x < 0 || particulas_izquierda[i].posicio_particula.y > height || particulas_izquierda[i].posicio_particula.y < 0) {
  //    particulas_izquierda[i] = new particula(new PVector(width / 2, height / 2), new PVector(random(10.0, 30.0), random(-50.0, -30.0)), 1, 30, color(0, 255, 0));
  //  }
  //}
  //for (int i = 0; i < particulas; i++) {
  //  particulas_derecha[i].calcula_particula();
  //  particulas_izquierda[i].calcula_particula();
  //  // Pintar
  //  particulas_derecha[i].pinta_particula();
  //  particulas_izquierda[i].pinta_particula();
  //}
  for (int i = 0; i < num_particulas; i++) {
    particulas[i].calcula_particula(lider.posicio_particula);
    particulas[i].calcula_particula(lider.posicio_particula);
    // Pintar
    particulas[i].pinta_particula();
    particulas[i].pinta_particula();
  }
  fill(255);
  lider.calcula_particula(new PVector(width, 0.0f));
  lider.pinta_particula();
}


void keyPressed() {
  if (key == 'w' || key == 'W') {
    //followLider = true;
    //followDestiny = false;
  } else if (key == 's' || key == 'S') {
    //followLider = false;
    //followDestiny = true;
  }
}
