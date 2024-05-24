// Una corba d'interpolació
// Per a generar una trajectòria
// Polinòmica, Cúbica, Paramètrica
// Amb 4 punts de control (P0, P1, P2, P3)

// Variables i objectes
corba la_primera_corba;
corba[] corbes;
PVector lider;
//Classes
class corba {
  //Atributs
  PVector[] punts_ctrl;  // Per on passa
  PVector[] coefs;  // Governen l'equacio
  int numero_punts;  // Quants punts volem pintar
  //Constructor
  corba(PVector[] pc, int np) {
    punts_ctrl = new PVector[NUM_PUNTS];  // Hi ha 4 punts de control
    coefs = new PVector[4];
    for (int i = 0; i < 4; i++) {
      punts_ctrl[i] = new PVector(0.0, 0.0, 0.0);
      coefs[i] = new PVector(0.0, 0.0, 0.0);
      // Copiem els 4 punts de control que ens han passat
      punts_ctrl[i] = pc[i];
    }
    numero_punts = np;
  }
  //Mètodes
  void calcular_coefs() {
    // Necessitem les equacions de la corba d'interpolació
    // C0 = P0
    coefs[0].x = punts_ctrl[0].x;
    coefs[0].y = punts_ctrl[0].y;
    coefs[0].z = punts_ctrl[0].z;
    // C1 = -5.5 * P0 + 9 * P1 - 4.5 * P2 + P3
    coefs[1].x = -3 * punts_ctrl[0].x + 3 * punts_ctrl[1].x;
    coefs[1].y = -3 * punts_ctrl[0].y + 3 * punts_ctrl[1].y;
    coefs[1].z = -3 * punts_ctrl[0].z + 3 * punts_ctrl[1].z;
    // C2 = 9 * P0 - 22.5 * P1 + 18 * P2 - 4.5 * P3
    coefs[2].x = 3 * punts_ctrl[0].x - 6 * punts_ctrl[1].x + 3 * punts_ctrl[2].x;
    coefs[2].y = 3 * punts_ctrl[0].y - 6 * punts_ctrl[1].y + 3 * punts_ctrl[2].y;
    coefs[2].z = 3 * punts_ctrl[0].z - 6 * punts_ctrl[1].z + 3 * punts_ctrl[2].z;
    // C3 = -4.5 * P0 + 13.5 * P1 - 13.5 * P2 + 4.5 * P3
    coefs[3].x = -1 * punts_ctrl[0].x + 3 * punts_ctrl[1].x - 3 * punts_ctrl[2].x + punts_ctrl[3].x;
    coefs[3].y = -1 * punts_ctrl[0].y + 3 * punts_ctrl[1].y - 3 * punts_ctrl[2].y + punts_ctrl[3].y;
    coefs[3].z = -1 * punts_ctrl[0].z + 3 * punts_ctrl[1].z - 3 * punts_ctrl[2].z + punts_ctrl[3].z;
  }

  void pintar() {
    // Comencem pintant els punts de control
    fill(255, 0, 0);
    strokeWeight(3);
    stroke(255);
    for (int i = 0; i < 4; i++) {
      pushMatrix();
      translate(punts_ctrl[i].x, punts_ctrl[i].y, punts_ctrl[i].z);
      sphere(25);   //ERROR
      popMatrix();
    }
    //Seguim pintant els punts de la corba
    stroke(255, 255, 0);
    strokeWeight(15);
    // Corba(u) = C0 * C1 * u + C2 * u^2 + C3 * u^3
    // u va de 0 (inici) a 1 (fi)
    // l'interval es 1 / numero_punts
    PVector punt_a_pintar = new PVector(0.0, 0.0);
    float interval = 1.0 / numero_punts;
    for (float u = 0; u <= 1; u += interval) {
      punt_a_pintar.x = coefs[0].x + coefs[1].x * u + coefs[2].x * sq(u) + coefs[3].x * sq(u) * u;
      punt_a_pintar.y = coefs[0].y + coefs[1].y * u + coefs[2].y * sq(u) + coefs[3].y * sq(u) * u;
      punt_a_pintar.z = coefs[0].z + coefs[1].z * u + coefs[2].z * sq(u) + coefs[3].z * sq(u) * u;
      point(punt_a_pintar.x, punt_a_pintar.y, punt_a_pintar.z);
    }
  }

  void pintarCaixa() {
    stroke(255);
    line(punts_ctrl[0].x, punts_ctrl[0].y, punts_ctrl[1].x, punts_ctrl[1].y);
    line(punts_ctrl[1].x, punts_ctrl[1].y, punts_ctrl[3].x, punts_ctrl[3].y);
    line(punts_ctrl[3].x, punts_ctrl[3].y, punts_ctrl[2].x, punts_ctrl[2].y);
    line(punts_ctrl[2].x, punts_ctrl[2].y, punts_ctrl[0].x, punts_ctrl[0].y);
  }

  void pintarLider(float u) {
    noStroke();
    fill(255, 0, 255);
    lider.x = coefs[0].x + coefs[1].x * u + coefs[2].x * sq(u) + coefs[3].x * sq(u) * u;
    lider.y = coefs[0].y + coefs[1].y * u + coefs[2].y * sq(u) + coefs[3].y * sq(u) * u;
    lider.z = coefs[0].z + coefs[1].z * u + coefs[2].z * sq(u) + coefs[3].z * sq(u) * u;
    translate(lider.x, lider.y, lider.z);
    sphere(30);
    //rotate(45);
    //rotateY(45);
    //scale(10);
    //shape(fish); 
  }
}
