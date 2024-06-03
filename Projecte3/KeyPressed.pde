boolean viewMode = false;

void keyPressed() {
  if (key == 'v' || key == 'V') {
    viewMode = !viewMode; // Alternar entre 0 y 1
  }
  if (key == 'g') {
    for (int i = 0; i < particulas.length; i++) {
      particulas[i].alternar_vent();
    }
  } else if (key == 'f') {
    for (int i = 0; i < particulas.length; i++) {
      particulas[i].alternar_friccio();
    }
  }
}
