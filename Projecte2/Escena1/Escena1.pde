/*void setup(){
    size(900,900, P3D);
}

void draw(){
  translate(width/2,height/2);
  drawScene();
}*/

//Una proyeccion isomètrica
//120 grados de separación entre ejes
//Para ello, acumulamos 2 transformaciones homogeneas
//de rotacion alrededor de los ejes X e Y...
//en Y son 45 grados
//En X?

//Variables
//Perspectiva isonomètrica
float anguloX=-35.26;
float anguloY=45.0;
//float anguloZ=110.0;
// Funciones
void pintaEjes(){
  //GruesoEjes
  strokeWeight(5);
  //Eje X
  stroke(255,0,0);
  line(0,0,0,100,0,0);
  //Eje Y
  stroke(0,0,255);
  line(0,0,0,0,100,0);
  //Eje Z
  stroke(0,255,0);
  line(0,0,0,0,0,100);
}

void pintaEscena(){
  int sum = 110;
  translate(-1000,350, 350);
  for(int rowsBox = 0; rowsBox < 20; rowsBox++){
    for(int columnsBox = 0; columnsBox < 20; columnsBox++, sum += 110){
      translate(110,0);
      fill(#078004);
      strokeWeight(3);
      box(110);
    }
    translate(-sum, 0, -110);
    sum = 0;
  }
  
}
//Setup
void setup(){
  // Creacion ventana
  //ATENCION! queremos pintar  en 3D!!!
  size(1920,1080,P3D);//Processing 3D (P3D)
 
}
//Draw
void draw(){
  //Limpiar fondo
 background(0);
 //Nos trasladamos al centro de la ventana
 translate(width/2,height/2);
 //Pintar una escena
 pintaEscena();
 //Pinto el cubo
 // Pinto los ejes
 //Incremento angulo para que se mueva
 anguloX++;
 anguloY++;
 
}
