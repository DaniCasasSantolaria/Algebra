int scene = 0;  // 0: Menú principal,
PImage text_play, salon;
void setup(){
  // Creacion ventana
  size(1920,1080,P3D);//Processing 3D (P3D)
  text_play = loadImage("Texto_Play.png");
  salon = loadImage("Salon5.png");
}

void draw(){
 background(#28AFE1);
 translate(width/2,height/2);
 switch (scene){
   case 0:
     pintaEscena();
     textMenu();
     break;
   case 1:
     break;
   case 2:
     break;
   case 3:
     break;
   case 4:
     break;
 }
}
