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
 //Suelo Jardín
 stroke(0);
 pushMatrix();
 translate(0,510,500);
 fill(#078004);
 box(900);
 popMatrix();
 
 //Camino
 pushMatrix();
 translate(-20,69.8,820);
 fill(#646b63);
 for(int i = 0; i < 3; i++){
   pushMatrix();
   for(int amountCubes = 0; amountCubes < 7; amountCubes++){
       box(20);
       translate(0,0,-20);
   }
   popMatrix();
   translate(20,0,0);
 }
 popMatrix();
 
 //Paredes Casa
 pushMatrix();
 translate(0,0,635);
 fill(#fad6a5);
 box(150);
 popMatrix();
 pushMatrix();
 translate(-180,0,500);
 fill(#fad6a5);
 box(150);
 popMatrix();
 
 //Puerta
 pushMatrix();
 translate(0,0,685);
 fill(#82623b);
 stroke(#82623b);
 box(50);
 translate(0,35,0);
 box(50);
 translate(-17,-12,24);
 fill(0);
 stroke(0);
 box(4);
 popMatrix();
 
 //Ventanas
 pushMatrix();
 
 popMatrix();
 
 //Techo
 /*fill(#E56455);
 beginShape();
 vertex(-100,-100,-100);
 vertex(100,-100,-100);
 vertex(0,0,100);
 vertex(100,-100,-100);
 vertex(100,100,-100);
 vertex(0,0,100);
 vertex(-100,-100,-100);
 vertex(100,100,-100);
 vertex(0,0,100);
 vertex(-100,100,-100);
 vertex(-100,-100,-100);
 vertex(0,0,100);
 endShape();*/
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
 background(#28AFE1);
 translate(width/2,height/2);
 //Pintar una escena
 pintaEscena();
}
