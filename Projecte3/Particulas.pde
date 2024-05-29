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
particula[] particulas;
float MAX_VELOCITY = 3.0f;

// Funcions i classes
class particula {
  // Atributs
  PVector posicio_particula;
  PVector velocitat_particula;
  PVector acceleracio_particula;
  float massa_particula;
  float tamany_particula;
  float constant_desti, constant_lider, constant_friccio;
  color color_particula;
  // Constructor
  particula(PVector p, PVector v, float m, float tam, float const_d, float const_l,float const_f,color c) {
    posicio_particula = new PVector(0.0, 0.0, 0.0);
    velocitat_particula = new PVector(0.0, 0.0, 0.0);
    acceleracio_particula = new PVector(0.0, 0.0, 0.0);
    
    posicio_particula.set(p);
    velocitat_particula.set(v);
    
    massa_particula = m;
    tamany_particula = tam;
    color_particula = c;
    
    constant_lider = const_l;
    constant_desti = const_d;
    constant_friccio = const_f;
  }
  // Metodes
  void calcula_particula(){
    PVector acumulador_forsa;
    PVector vector_per_usar;
    acumulador_forsa = new PVector(0.0, 0.0, 0.0);
    vector_per_usar = new PVector(0.0, 0.0, 0.0);
    // Solver Euler
    // 0) Acumular les forces
    // Força cap al desti
    vector_per_usar.x = desti.x - posicio_particula.x;
    vector_per_usar.y = desti.y - posicio_particula.y;
    vector_per_usar.z = desti.z - posicio_particula.z;
    // Calcular modul
    float modul = sqrt(vector_per_usar.x * vector_per_usar.x + vector_per_usar.y * vector_per_usar.y + vector_per_usar.z * vector_per_usar.z);
    // Fer el vector unitari (Vector / modul)
    vector_per_usar.x /= modul;
    vector_per_usar.y /= modul;
    vector_per_usar.z /= modul;
    // Multipliquem el vector per la seva constant associada
    vector_per_usar.x *= constant_desti;
    vector_per_usar.y *= constant_desti;
    vector_per_usar.z *= constant_desti;
    // Ara el vector ja és la força que necessitem per anar al destí
    acumulador_forsa.x = vector_per_usar.x;
    acumulador_forsa.y = vector_per_usar.y;
    acumulador_forsa.z = vector_per_usar.z;
    
    // Força cap al lider
      // Calculo el vector del boid al lider    
      vector_per_usar.x = lider.x - posicio_particula.x;
      vector_per_usar.y = lider.y - posicio_particula.y;
      vector_per_usar.y = lider.z - posicio_particula.z;
      // Calculo el modul del vector
      modul = sqrt(vector_per_usar.x * vector_per_usar.x + vector_per_usar.y * vector_per_usar.y + vector_per_usar.z * vector_per_usar.z);
      // Faig unitari el vector(Vector / modul)
      vector_per_usar.x /= modul;
      vector_per_usar.y /= modul;
      vector_per_usar.z /= modul;
      // Multiplico el vector per la constant
      vector_per_usar.x *= constant_lider;
      vector_per_usar.y *= constant_lider;
      vector_per_usar.z *= constant_lider;
      // Afegeixo la força al acomulador de forces
      acumulador_forsa.x += vector_per_usar.x;
      acumulador_forsa.y += vector_per_usar.y;
      acumulador_forsa.z += vector_per_usar.z;
      
    // Força de friccio
    acumulador_forsa.x += -1.0 * constant_friccio * velocitat_particula.x;
    acumulador_forsa.y += -1.0 * constant_friccio * velocitat_particula.y;
    acumulador_forsa.z += -1.0 * constant_friccio * velocitat_particula.z;
    
    
    // 1) Acceleracio
    acceleracio_particula.x = acumulador_forsa.x / massa_particula;
    acceleracio_particula.y = acumulador_forsa.y / massa_particula;
    acceleracio_particula.z = acumulador_forsa.z / massa_particula;
    // 2) Velocitat
    velocitat_particula.x = velocitat_particula.x
    + acceleracio_particula.x * increment_temps;
    velocitat_particula.y = velocitat_particula.y
    + acceleracio_particula.y * increment_temps;
    velocitat_particula.z = velocitat_particula.z
    + acceleracio_particula.z * increment_temps;
    velocitat_particula.limit(MAX_VELOCITY);
    // 3) Posicio
    posicio_particula.x = posicio_particula.x
    + velocitat_particula.x * increment_temps;
    posicio_particula.y = posicio_particula.y
    + velocitat_particula.y * increment_temps;
    posicio_particula.z = posicio_particula.z
    + velocitat_particula.z * increment_temps;
  }
  
  void pinta_particula(){
    fill(color_particula);
    pushMatrix();
    translate(posicio_particula.x, posicio_particula.y, posicio_particula.z);
    sphere(tamany_particula);
    popMatrix();
  }
}
// Draw
void mouseMoved(){
 desti.x = mouseX;
 desti.y = mouseY;
}
