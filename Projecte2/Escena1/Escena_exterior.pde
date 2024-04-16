int z = 400;
int sumX = -300;

void drawScene(){
    ground();
}


void ground(){
  fill(#078004);
  pushMatrix();
  translate(-300, width / 1.1, z);
  box(160);
  for(int i = 0, x2 = 160, y = -160; i < 7; i++, z -= 23, y -= 160){
    for(int j = 0; j < 3; j++){
      box(160);
      translate(x2, 0, 0);
      sumX += x2;
    }
    translate(-sumX, width / 1.1 - y, z);
    sumX = 0;
  }
  popMatrix();
}
