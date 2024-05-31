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

class particula {
  // Atributos
  PVector posicio_particula;
  PVector velocitat_particula;
  PVector acceleracio_particula;
  float massa_particula;
  float tamany_particula;
  float constant_desti, constant_lider, constant_friccio;
  float distancia_minima;
  color color_particula;

  // Constructor
  particula(PVector p, PVector v, float m, float tam, float const_d, float const_l, float const_f, float dist_min, color c) {
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
    distancia_minima = dist_min;
  }

  // Métodos
  void calcula_particula(){
    PVector acumulador_forsa = new PVector(0.0, 0.0, 0.0);
    PVector vector_per_usar = new PVector(0.0, 0.0, 0.0);
    
    // Força cap al destí
    vector_per_usar = PVector.sub(desti, posicio_particula);
    vector_per_usar.normalize();
    vector_per_usar.mult(constant_desti);
    acumulador_forsa.add(vector_per_usar);
    
    // Força cap al líder
    vector_per_usar = PVector.sub(lider, posicio_particula);
    float distancia_lider = vector_per_usar.mag();
    if (distancia_lider < distancia_minima) {
      // Si está demasiado cerca, aplica una fuerza de separación
      vector_per_usar.normalize();
      vector_per_usar.mult(-constant_lider * (distancia_minima - distancia_lider));
    } else {
      vector_per_usar.normalize();
      vector_per_usar.mult(constant_lider);
    }
    acumulador_forsa.add(vector_per_usar);
    
    // Força de fricció
    vector_per_usar = PVector.mult(velocitat_particula, -constant_friccio);
    acumulador_forsa.add(vector_per_usar);
    
    // 1) Acceleració
    acceleracio_particula = PVector.div(acumulador_forsa, massa_particula);
    
    // 2) Velocitat
    velocitat_particula.add(PVector.mult(acceleracio_particula, increment_temps));
    velocitat_particula.limit(MAX_VELOCITY);
    
    // 3) Posició
    posicio_particula.add(PVector.mult(velocitat_particula, increment_temps));
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
