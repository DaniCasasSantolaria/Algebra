float u = 0;
int curva = 0;
int NUM_PUNTS = 4;
int NUM_CORBES = 5;
int NUM_PARTICULES = 7;
PVector p1[], p2[], p3[], p4[], p5[];
float x, y, z;
float rotX, rotY, rotZ;
//PShape fish;
//PImage texture;

void setup() {
  size(1920, 1080, P3D);

  //fish = loadShape("Fish.obj");
  //texture = loadImage("Texture.jpg");
  //fish.setTexture(texture);

  // Els 4 punts de control
  corbes = new corba[NUM_CORBES];
  p1 = new PVector[NUM_PUNTS];
  p1[0] = new PVector(50, 100, 0);
  p1[1] = new PVector(250, 150, 0);
  p1[2] = new PVector(60, 700, 0);
  p1[3] = new PVector(200, 850, 0);

  p2 = new PVector[NUM_PUNTS];
  p2[0] = new PVector(200, 850, 0);
  p2[1] = new PVector(400, 1000, 0);
  p2[2] = new PVector(250, 150, 0);
  p2[3] = new PVector(450, 100, 0);

  p3 = new PVector[NUM_PUNTS];
  p3[0] = new PVector(450, 100, 0);
  p3[1] = new PVector(650, 0, 0);
  p3[2] = new PVector(400, 800, 0);
  p3[3] = new PVector(700, 1000, 0);

  p4 = new PVector[NUM_PUNTS];
  p4[0] = new PVector(700, 1000, 0);
  p4[1] = new PVector(950, 1080, 0);
  p4[2] = new PVector(650, 150, 0);
  p4[3] = new PVector(950, 220, 0);

  p5 = new PVector[NUM_PUNTS];
  p5[0] = new PVector(950, 220, 0);
  p5[1] = new PVector(1250, 350, 0);
  p5[2] = new PVector(950, 1060, 0);
  p5[3] = new PVector(1200, 980, 0);
  // Crido al constructor de l'objecte
  corbes[0] = new corba(p1, 250);
  corbes[1] = new corba(p2, 250);
  corbes[2] = new corba(p3, 250);
  corbes[3] = new corba(p4, 250);
  corbes[4] = new corba(p5, 250);
  for (int i = 0; i < NUM_CORBES; i++) {
    corbes[i].calcular_coefs();
  }
  lider = new PVector(0.0, 0.0, 0.0);
  //
  // PARTICULAS
  //Inicialitzo el desti
  desti = new PVector(width, 100.0, 0.0);
  // Inicialitzo les particules
  // Constructor = PVector p, PVector v, float m, float tam, float constant_desti, float constant_lider, color c
  particulas = new particula[NUM_PARTICULES];
  for (int i = 0; i < NUM_PARTICULES; i++) {
    particulas[i] = new particula (new PVector(lider.x - 50, lider.y - 50, lider.z), new PVector(0.0, 0.0),
      1.0, 20.0, 0.1, 0.9, 0.01, color(255, 0, 0));  //K desti = 0.2, K lider = 0.8, K friccio = 0.02
  }
  x = 0;
  y = 0;
  z = 0;
  rotX = 0;
  rotY = 0;
  rotZ = 0;
}

void draw() {
  background(15);
  translate(x, y, z);
  rotateX(radians(rotX));
  rotateY(radians(rotY));
  rotateZ(radians(rotZ));
  for (int i = 0; i < NUM_PARTICULES; i++) {
    particulas[i].calcula_particula();
    particulas[i].pinta_particula();
  }
  if (curva < NUM_CORBES) {
    //corbes[curva].calcular_coefs();
    //corbes[curva].pintarCaixa();
    corbes[curva].pintar();
    corbes[curva].pintarLider(u);
    u += 0.0013;
  } else background(255);
  if (u > 1) {
    u = 0;
    curva++;
  }
}
