int scene = 0;  // 0: Menú principal,
PImage text_play, salon;
void setup(){
  // Creacion ventana
  size(1920,1080,P3D);//Processing 3D (P3D)
  //fullScreen(P3D);
  text_play = loadImage("Texto_Play.png");
  salon = loadImage("Salon5.png");
}

void draw(){
 switch (scene){
   case 0:
     translate(width/2,height/2);
     background(#28AFE1);
     pintaEscena();
     textMenu();
     break;
   case 1:
     break;
   case 2:
     background(#306f26);
     createMap();
     break;
   case 3:
     break;
   case 4:
     break;
 }
}
