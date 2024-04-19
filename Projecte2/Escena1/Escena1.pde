
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
 translate(-190,0,550);
 fill(#2BADE1);
 stroke(#2BADE1);
 box(50);
 translate(20,0,0);
 box(50);
 //Bordes ventanas
 fill(#646464);
 stroke(#646464);
 translate(25.2, 26, 24.5);
 for(int j = 0; j < 2; j++){  //Filas de bordes grises
   for(int i = 0; i < 36; i++){
    box(2);
    translate(-2, 0, 0);
   }
   translate(2 * 36, -52, 0);
 }
 for(int i = 0; i < 2; i++){ //Columnas de bordes grises
   for(int j = 0; j < 36; j++){
    box(2);
    translate(0, 2, 0);
   }
   translate(0, 52, 0);
 }
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
