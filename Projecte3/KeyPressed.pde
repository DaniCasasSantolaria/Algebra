
void keyPressed() {
  float moveAmount = 15; // Cantidad de movimiento de la cámara
  float angleMoved = 3;
  switch(key) {
    case CODED:
      if (keyCode == UP) {
        y += moveAmount;
      } else if (keyCode == DOWN) {
        y -= moveAmount;
      } else if (keyCode == LEFT) {
        x += moveAmount;
      } else if (keyCode == RIGHT) {
        x -= moveAmount;
      } else if (keyCode == SHIFT){
        z += moveAmount;
      } else if (keyCode == CONTROL){
        z -= moveAmount;
      }
      break;
    default:
      // No coded keys
      break;
  }
  switch(key){
   case 'w':
      rotY += angleMoved; 
      break;
    case 's':
      rotY -= angleMoved;
      break;
    case 'a':
      rotX += angleMoved;
      break;
    case 'd':
      rotX -= angleMoved;;
      break;
    default:
      // No coded keys
      break; 
    
  }
}
