float u = 0;
int curva = 0;

void setup() {
  size(1000, 1000);
  // Els 4 punts de control
  PVector p[];
  p = new PVector[4];
  p[0] = new PVector(100, 100);
  p[1] = new PVector(200, height - 200);
  p[2] = new PVector(400, height / 2);
  p[3] = new PVector(300, height - 100);
  // Crido al constructor de l'objecte
  la_primera_corba = new corba(p, 100);
  la_primera_corba.calcular_coefs();
  lider = new PVector(0.0, 0.0);
}


void draw() {
  background(0);
  if (curva == 0) {
    la_primera_corba.calcular_coefs();
    la_primera_corba.pintarCaixa();
    la_primera_corba.pintar();
    la_primera_corba.pintarLider(u);
    u += 0.0025;
  }
  if (u > 1) u = 0;
}
