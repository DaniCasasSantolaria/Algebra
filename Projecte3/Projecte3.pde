float u = 0;
int curva = 0;
int NUM_PUNTS = 4;
int NUM_CORBES = 8;
PVector p1[], p2[], p3[], p4[], p5[], p6[], p7[], p8[];

void setup() {
  size(1920, 1080, P3D);
  // Els 4 punts de control
  corbes = new corba[NUM_CORBES];
  p1 = new PVector[NUM_PUNTS];
  p1[0] = new PVector(50, 100, 0);
  p1[1] = new PVector(250, 150, 0);
  p1[2] = new PVector(60, 700, 0);
  p1[3] = new PVector(200, 850, 0);
  
  p2 = new PVector[NUM_PUNTS];
  p2[0] = new PVector(200, 850, 0);
  p2[1] = new PVector(400, 800, 0);
  p2[2] = new PVector(250, 150, 0);
  p2[3] = new PVector(450, 100, 0);
  
  p3 = new PVector[NUM_PUNTS];
  p3[0] = new PVector(60, 800, 0);
  p3[1] = new PVector(10, 900, 0);
  p3[2] = new PVector(140, 850, 0);
  p3[3] = new PVector(60, 1000, 0);
  
  p4 = new PVector[NUM_PUNTS];
  p4[0] = new PVector(60, 1000, 0);
  p4[1] = new PVector(250, 220, 0);
  p4[2] = new PVector(550, 600, 0);
  p4[3] = new PVector(500, 200, 0);
  
  p5 = new PVector[NUM_PUNTS];
  p6 = new PVector[NUM_PUNTS];
  p7 = new PVector[NUM_PUNTS];
  p8 = new PVector[NUM_PUNTS];
  // Crido al constructor de l'objecte
  corbes[0] = new corba(p1, 100);
  corbes[1] = new corba(p2, 150);
  corbes[2] = new corba(p3, 150);
  corbes[3] = new corba(p4, 450);
  for (int i = 0; i < NUM_CORBES; i++) {
    corbes[0].calcular_coefs();
    corbes[1].calcular_coefs();
    corbes[2].calcular_coefs();
    corbes[3].calcular_coefs();
  }
  lider = new PVector(0.0, 0.0, 0.0);
}

boolean hasRotate = false;
void draw() {
  background(0);
  if (!hasRotate) {
    rotate(radians(90));
    hasRotate = true;
  }
  if (curva < NUM_CORBES) {
    //corbes[curva].calcular_coefs();
    corbes[curva].pintarCaixa();
    corbes[curva].pintar();
    corbes[curva].pintarLider(u);
    u += 0.0025;
  }
  if (u > 1) {
    u = 0;
    curva++;
  }
}
