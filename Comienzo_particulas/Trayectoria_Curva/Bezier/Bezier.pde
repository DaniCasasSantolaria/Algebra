// Una corba d'interpolació
// Per a generar una trajectòria
// Polinòmica, Cúbica, Paramètrica
// Amb 4 punts de control (P0, P1, P2, P3)

// Variables i objectes
corba la_primera_corba;

//Classes
class corba{
 //Atributs
 PVector[] punts_ctrl;  // Per on passa
 PVector[] coefs;  // Governen l'equacio
 int numero_punts;  // Quants punts volem pintar
 //Constructor
 corba(PVector[] pc, int np){
   punts_ctrl = new PVector[4];  // Hi ha 4 punts de control
   coefs = new PVector[4];
   for(int i = 0; i < 4; i++){
     punts_ctrl[i] = new PVector(0.0, 0.0);
     coefs[i] = new PVector(0.0, 0.0);
     // Copiem els 4 punts de control que ens han passat
     punts_ctrl[i] = pc[i];
   }
   numero_punts = np;
 }
 //Mètodes
 void calcular_coefs(){
   // Necessitem les equacions de la corba d'interpolació
   // C0 = P0
   coefs[0].x = punts_ctrl[0].x;
   coefs[0].y = punts_ctrl[0].y;
   // C1 = -5.5 * P0 + 9 * P1 - 4.5 * P2 + P3
   coefs[1].x = -3 * punts_ctrl[0].x + 3 * punts_ctrl[1].x;
   coefs[1].y = -3 * punts_ctrl[0].y + 3 * punts_ctrl[1].y;
   // C2 = 9 * P0 - 22.5 * P1 + 18 * P2 - 4.5 * P3
   coefs[2].x = 3 * punts_ctrl[0].x - 6 * punts_ctrl[1].x + 3 * punts_ctrl[2].x;
   coefs[2].y = 3 * punts_ctrl[0].y - 6 * punts_ctrl[1].y + 3 * punts_ctrl[2].y;
   // C3 = -4.5 * P0 + 13.5 * P1 - 13.5 * P2 + 4.5 * P3
   coefs[3].x = -1 * punts_ctrl[0].x + 3 * punts_ctrl[1].x - 3 * punts_ctrl[2].x + punts_ctrl[3].x;
   coefs[3].y = -1 * punts_ctrl[0].y + 3 * punts_ctrl[1].y - 3 * punts_ctrl[2].y + punts_ctrl[3].y;
 }
 
 void pintar(){
   // Comencem pintant els punts de control
   fill(255, 0, 0);
   strokeWeight(3);
   stroke(255);
   for(int i = 0; i < 4; i++){
    ellipse(punts_ctrl[i].x, punts_ctrl[i].y, 25, 25); 
   }
   //Seguim pintant els punts de la corba
   stroke(255, 255, 0);
   strokeWeight(15);
   // Corba(u) = C0 * C1 * u + C2 * u^2 + C3 * u^3
   // u va de 0 (inici) a 1 (fi)
   // l'interval es 1 / numero_punts
   PVector punt_a_pintar = new PVector(0.0, 0.0);
   float interval = 1.0 / numero_punts;
   for(float u = 0; u <= 1; u += interval){
     punt_a_pintar.x = coefs[0].x + coefs[1].x * u + coefs[2].x * sq(u) + coefs[3].x * sq(u) * u;
     punt_a_pintar.y = coefs[0].y + coefs[1].y * u + coefs[2].y * sq(u) + coefs[3].y * sq(u) * u;
     point(punt_a_pintar.x, punt_a_pintar.y);
   }
 }
 
 void pintarCaixa(){
  stroke(255);
  line(punts_ctrl[0].x, punts_ctrl[0].y, punts_ctrl[1].x, punts_ctrl[1].y);
  line(punts_ctrl[1].x, punts_ctrl[1].y, punts_ctrl[3].x, punts_ctrl[3].y);
  line(punts_ctrl[3].x, punts_ctrl[3].y, punts_ctrl[2].x, punts_ctrl[2].y);
  line(punts_ctrl[2].x, punts_ctrl[2].y, punts_ctrl[0].x, punts_ctrl[0].y);
 }
}


void setup(){
 size(1000, 1000);
 // Els 4 punts de control
 PVector p[];
 p = new PVector[4];
 p[0] = new PVector(200, 200);
 p[1] = new PVector(300, 300);
 p[2] = new PVector(400, 200);
 p[3] = new PVector(500, 300);
 // Crido al constructor de l'objecte
 la_primera_corba = new corba(p, 100);
 la_primera_corba.calcular_coefs();
}

void draw(){
 background(0);
 la_primera_corba.calcular_coefs();
  la_primera_corba.pintarCaixa();
 la_primera_corba.pintar();
}

void mouseMoved(){
  la_primera_corba.punts_ctrl[1].x = mouseX;
  la_primera_corba.punts_ctrl[1].y = mouseY;
}
