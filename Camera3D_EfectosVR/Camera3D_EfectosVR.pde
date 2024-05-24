// MI PRIMER CODIGO ESTEREOSCOPICO EN 3D
// USAMOS LA LIBRERIA CAMERA 3D
import camera3D.Camera3D;

// ZONA OBJETOS Y VARIABLES
Camera3D estereoscopia; // Objeto de camara 3D para el efeco stereo
float rotX = 0.0, rotY = 0.0, rotZ = 0.0; // Angulos de rotacion del cubo en radianes
// ZONA SETUP
void setup(){
  size(1000, 1000, P3D);
  // Fuciones para activar estereoscopia
  estereoscopia = new Camera3D(this); // Llamamos al constructor
  estereoscopia.setBackgroundColor(color(255 / 2));
  estereoscopia.renderDefaultAnaglyph().setDivergence(1);  // 1 es el valor por defecto
}

// ZONA DRAW
void draw(){
  // Transformamos y pintamos el cubo
  // Trasladamos el cubo al centro y rotamos los 3 ejes
  translate(width / 2, height / 2, 0.0);
  rotateX(rotX);  // Rotamos un angulo rotX
  rotateY(rotY);  // Rotamos un angulo roty
  rotateZ(rotZ);  // Rotamos un angulo rotz
  strokeWeight(8);
  stroke(0);
  box(250);
  // Modificamos los 3 angulos
  rotX += 0.01;
  rotY -= 0.02;
  rotZ += 0.03;
}
