PVector p0, p1, p2, p3;
particula particulas;
PVector C0, C1, C2, C3;
class particula {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size;
  float constant_destiny, constant_lider, constant_friction;
  color colors;
  // Constructor
  particula(boolean l, PVector p, PVector v, float m, float tam, float const_d, float const_l, float const_f, color c) {
    position = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    acceleration = new PVector(0.0, 0.0);

    position.set(p);
    velocity.set(v);

    mass = m;
    size = tam;
    colors = c;

    constant_lider = const_l;
    constant_destiny = const_d;
    constant_friction = const_f;
  }
  // Metodes
  void calcula_particula() {
    
  }

  void pinta_particula() {
    fill(colors);
    ellipse(position.x, position.y,
      size, size);
  }
}

void setup() {
  p0 = new PVector(50, height - 50);
  p1 = new PVector(150, height - 200);
  p2 = new PVector(500, height - 250);
  p3 = new PVector(600, height - 400);
  //particulas = new particula(PARAMETROS);
  //C0 =
  //C1 =
  //C2 =
  //C3 =
}

void draw() {
}
