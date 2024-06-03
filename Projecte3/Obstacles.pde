Obstacle[] obstacles;
class Obstacle {
  PVector pos;
  float size;

  Obstacle(float x, float y, float z, float s) {
    pos = new PVector(x, y, z);
    size = s;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    box(size);
    popMatrix();
  }
}
