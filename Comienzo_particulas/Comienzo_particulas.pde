// Un sistema de particules necessita estructura
// Una bona manera d'estructurar es tenir objectes
// Els objectes es creen amb classes
// Una particula pot ser un objecte! i moltes tb

// Variables i objectes
// En posarem 2 amb 2 heuristiques de moviment(intencions)
// Una de seguir un lider i una altra d'anar a un desti
// Aquestes intencions faran de forces.

////////////UTILITZAR VOXELS
///////////DIVIDIR EL MAPA EN ZONES PER VEURE SI ESTA MOLT A PROP DELS VOXELS. EN EL CAS DE QUE ESTIGUI APROP CALCULAR LES FORCES

float increment_temps = 0.4;
PVector desti;
particula boid1;
particula boid2;
particula lider;

// Funcions i classes
class particula {
  // Atributs
  PVector posicio_particula;
  PVector velocitat_particula;
  PVector acceleracio_particula;
  boolean soc_lider;
  float massa_particula;
  float tamany_particula;
  float constant_desti, constant_lider, constant_friccio;
  color color_particula;
  // Constructor
  particula(boolean l, PVector p, PVector v, float m, float tam, float const_d, float const_l,float const_f,color c) {
    posicio_particula = new PVector(0.0,0.0);
    velocitat_particula = new PVector(0.0,0.0);
    acceleracio_particula = new PVector(0.0,0.0);
    
    posicio_particula.set(p);
    velocitat_particula.set(v);
    
    massa_particula = m;
    tamany_particula = tam;
    color_particula = c;
    
    constant_lider = const_l;
    constant_desti = const_d;
    constant_friccio = const_f;
    soc_lider = l;
  }
  // Metodes
  void calcula_particula(){
    PVector acumulador_forsa;
    PVector vector_per_usar;
    acumulador_forsa = new PVector(0.0,0.0);
    vector_per_usar = new PVector(0.0,0.0);
    // Solver Euler
    // 0) Acumular les forces
    // Força cap al desti
    vector_per_usar.x = desti.x - posicio_particula.x;
    vector_per_usar.y = desti.y - posicio_particula.y;
    // Calcular modul
    float modul = sqrt(vector_per_usar.x * vector_per_usar.x + vector_per_usar.y * vector_per_usar.y);
    // Fer el vector unitari (Vector / modul)
    vector_per_usar.x /= modul;
    vector_per_usar.y /= modul;
    // Multipliquem el vector per la seva constant associada
    vector_per_usar.x *= constant_desti;
    vector_per_usar.y *= constant_desti;
    // Ara el vector ja és la força que necessitem per anar al destí
    acumulador_forsa.x = vector_per_usar.x;
    acumulador_forsa.y = vector_per_usar.y;
    // Força cap al lider
    if(!soc_lider){
      // Calculo el vector del boid al lider    
      vector_per_usar.x = lider.posicio_particula.x - posicio_particula.x;
      vector_per_usar.y = lider.posicio_particula.y - posicio_particula.y;
      // Calculo el modul del vector
      modul = sqrt(vector_per_usar.x * vector_per_usar.x + vector_per_usar.y * vector_per_usar.y);
      // Faig unitari el vector(Vector / modul)
      vector_per_usar.x /= modul;
      vector_per_usar.y /= modul;
      // Multiplico el vector per la constant
      vector_per_usar.x *= constant_lider;
      vector_per_usar.y *= constant_lider;
      // Afegeixo la força al acomulador de forces
      acumulador_forsa.x += vector_per_usar.x;
      acumulador_forsa.y += vector_per_usar.y;
    }
    // Força de friccio
    acumulador_forsa.x += -1.0 * constant_friccio * velocitat_particula.x;
    acumulador_forsa.y += -1.0 * constant_friccio * velocitat_particula.y;
    
    
    // 1) Acceleracio
    acceleracio_particula.x = acumulador_forsa.x / massa_particula;
    acceleracio_particula.y = acumulador_forsa.y / massa_particula;
    // 2) Velocitat
    velocitat_particula.x = velocitat_particula.x
    + acceleracio_particula.x * increment_temps;
    velocitat_particula.y = velocitat_particula.y
    + acceleracio_particula.y * increment_temps;
    // 3) Posicio
    posicio_particula.x = posicio_particula.x
    + velocitat_particula.x * increment_temps;
    posicio_particula.y = posicio_particula.y
    + velocitat_particula.y * increment_temps;
  }
  
  void pinta_particula(){
    fill(color_particula);
    ellipse(posicio_particula.x,posicio_particula.y,
    tamany_particula,tamany_particula);
  }
}

// Setup
void setup(){
  size(500,500);
  //Inicialitzo el desti
  desti = new PVector(width / 2, 100.0);
  // Inicialitzo les particules
  // Constructor = PVector p, PVector v, float m, float tam, float constant_desti, float constant_lider, color c
  boid1 = new particula(false, new PVector(width/4.0, height),
  new PVector(0.0, 0.0), 1.0, 30.0, 0.2, 0.8, 0.5,color(255,0,0));  //K desti = 0.2, K lider = 0.8, K friccio = 0.02
  boid2 = new particula(false, new PVector(3.0*width/4.0, height),
  new PVector(0.0, 0.0), 1.0, 30.0, 0.8, 0.1, 0.2,color(0,255,0));  //K desti = 0.8, K lider = 0.1, K friccio = 0.02
  lider = new particula(true, new PVector(width / 2.0, height - 30),
  new PVector(0.0, 0.0), 1.0, 45.0, 0.9, 0, 0.8,color(0,0,255));  //K desti = 0.9, K lider = 0, K friccio = 0.02
}
// Draw
void draw(){
  background(0);
  // Calcular
  noStroke();
  boid1.calcula_particula();
  boid2.calcula_particula();
  lider.calcula_particula();
  // Pintar
  boid1.pinta_particula();
  boid2.pinta_particula();
  lider.pinta_particula();
  //Pintar desti
  fill(255, 255, 0);
  stroke(255);
  rectMode(CENTER);
  rect(desti.x, desti.y, 30.0, 30.0);
}

void mouseMoved(){
 desti.x = mouseX;
 desti.y = mouseY;
}