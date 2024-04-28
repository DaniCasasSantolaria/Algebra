void mousePressed(){
  if(scene == 3 && !completePuzzle){
    int inversion = 0;
    if(mouseButton==LEFT){
      //count the time that has passed until mouse is pressed
      init = millis();
      
      //press de NEW button 
      if(mouseX>= 1400 && mouseX<1500 && mouseY>= 200 && mouseY<300){
       
        //always show the time "0:0:0" in NEW mode
        init=start;
        lock=false;
        play=false;
        
        do{
          //shuffle
          Collections.shuffle(rand);
          
          //find the # of inversions
          for(int i=0;i<9;i++)
          for(int j=i+1; j<9;j++){
            if(rand.get(i)>rand.get(j))  inversion++;
          }
          //check if solvable
        }while (inversion%2==1);
        println("pressed NEW button");
      }
      
      //press PLAY button
      if(mouseX>=1400 && mouseX<1550 && mouseY >= 350 && mouseY<420){
       //reset the step when game starts 
       step = 0;
       play=true;
       println("pressed PLAY button");
      }
      
      //press EXIT button
      if(mouseX>=1400 && mouseX<1500 && mouseY >= 460 && mouseY<600){
        play=false;
        println("press EXIT button");
        exit(); 
      }
      
    }
  }
  
}
