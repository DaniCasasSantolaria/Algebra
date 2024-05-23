
void keyPressed() {
  float moveAmount = 20; // Cantidad de movimiento de la cámara
  switch(key) {
    case CODED:
      if (keyCode == UP) {
        camY -= moveAmount;
      } else if (keyCode == DOWN) {
        camY += moveAmount;
      } else if (keyCode == LEFT) {
        camX -= moveAmount;
      } else if (keyCode == RIGHT) {
        camX += moveAmount;
      }
      break;
    default:
      // No coded keys
      break;
  }
}
