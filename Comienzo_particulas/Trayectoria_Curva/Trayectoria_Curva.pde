PVector p0, p1, p2, p3;
particula particulas;
PVector C0, C1, C2, C3;
float u = 0;

class particula {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float size;
  float constant_destiny, constant_lider, constant_friction;
  color colors;
  // Constructor
  particula(PVector p, PVector v, float m, float tam, float const_d, float const_l, float const_f, color c) {
    position = new PVector(0.0, 0.0, 0.0);
    velocity = new PVector(0.0, 0.0, 0.0);
    acceleration = new PVector(0.0, 0.0, 0.0);

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
  void calcula_particula(PVector C0, PVector C1, PVector C2, PVector C3, float u) {
      position.x = C0.x + C1.x * u + C2.x * sq(u) + C3.x * sq(u) * u;
      position.y = C0.y + C1.y * u + C2.y * sq(u) + C3.y * sq(u) * u;
      //position.z = C0.z + C1.z * u + C2.z * sq(u) + C3.z * sq(u) * u;
  }

  void pinta_particula() {
    fill(colors);
    ellipse(position.x, position.y,
      size, size);
  }
}

void setup() {
  size(1000, 1000);
  background(0);
  p0 = new PVector(50, 50, 0);
  p1 = new PVector(800, 150, 0);
  p2 = new PVector(500, 500, 0);
  p3 = new PVector(300, 300, 0);
  // boolean l, PVector position, PVector velocity, float mass, float size, float const_d, float const_l, float const_f, color c
  particulas = new particula(new PVector(50, height - 50, 0), new PVector(0.0, 0.0, 0.0), 1.0, 30.0, 0.7, 0.4, 0.1, color(255));
  C0 = p0;
  C1 = new PVector(p0.x * 1 + p1.x * 1/3 + p2.x * sq(1/3) + p3.x * sq(1/3) * 1/3, 
                  p0.y * 1 + p1.y * 1/3 + p2.y * sq(1/3) + p3.y * sq(1/3) * 1/3/*,
                  p0.z * 1 + p1.z * 1/3 + p2.z * sq(1/3) + p3.z * sq(1/3) * 1/3*/);
  C2 = new PVector(p0.x * 1 + p1.x * 2/3 + p2.x * sq(2/3) + p3.x * sq(2/3) * 2/3, 
                  p0.y * 1 + p1.y * 2/3 + p2.y * sq(2/3) + p3.y * sq(2/3) * 2/3/*,
                  p0.z * 1 + p1.z * 2/3 + p2.z * sq(2/3) + p3.z * sq(2/3) * 2/3*/);
  C3 = new PVector(p0.x + p1.x + p2.x + p3.x, 
                  p0.y + p1.y + p2.y + p3.y/*,
                  p0.z + p1.z + p2.z + p3.z*/);
}

void draw() {
  particulas.calcula_particula(C0, C1, C2, C3, u);
  particulas.pinta_particula();
  u+=0.01;
  if(u > 1) u = 0;
}
