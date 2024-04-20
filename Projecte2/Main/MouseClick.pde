boolean hasClickedPlay = false;
void mouseClicked(){
  if(mouseX > 1420 && mouseX < 1800 && mouseY > 160 && mouseY < 310){
    scene = 2;
    hasClickedPlay = true;
  }
}
