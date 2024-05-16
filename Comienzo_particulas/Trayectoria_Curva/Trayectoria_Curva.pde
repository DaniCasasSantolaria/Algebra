PVector P0, P1, P2, P3;
PVector C0, C1, C2, C3;
float u;

void setup(){
  size(1000,1000);
  P0 = new PVector(50,50,0);
  P1 = new PVector(150,700,0);
  P2 = new PVector(500,150,0);
  P3 = new PVector(800,850,0);
  C0 = new PVector(0,0,0);
  C1 = new PVector(0,0,0);
  C2 = new PVector(0,0,0);
  C3 = new PVector(0,0,0);
  C0.x = P0.x;
  C1.x = -5.5 * P0.x + 9 * P1.x - 4.5 * P2.x + P3.x;
  C2.x = 9 * P0.x - 22.5 * P1.x + 18 * P2.x - 4.5 * P3.x;
  C3.x = -4.5 * P0.x + 13.5*P1.x - 13.5 * P2.x + 4.5 * P3.x;
  
  C0.y = P0.y;
  C1.y = -5.5 * P0.y + 9 * P1.y - 4.5 * P2.y + P3.y;
  C2.y = 9 * P0.y - 22.5 * P1.y + 18 * P2.y - 4.5 * P3.y;
  C3.y = -4.5 * P0.y + 13.5*P1.y - 13.5 * P2.y + 4.5 * P3.y; 
  
  u = 0;
}

void draw(){
  background(0);
  fill(255);
  u += 0.001;
  ellipse(C0.x + C1.x * u + C2.x * sq(u) + C3.x * sq(u) * u, C0.y + C1.y * u + C2.y * sq(u) + C3.y * sq(u) * u, 50, 50 );
  if(u > 1) u = 0;
}
