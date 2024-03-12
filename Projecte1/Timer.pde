int tiempoTotal = 6000; //* 60 * 1000; // 6 minutos en milisegundos
int tiempoRestante;
int tiempoAnterior;

void ShowTimer() {
  int minutos = int(tiempoRestante / 60000);
  int segundos = int((tiempoRestante % 60000) / 1000);
  
  textAlign(CENTER, CENTER);
  textSize(48);
  fill(255);
  text(nf(minutos, 2) + ":" + nf(segundos, 2), width - 100, 30);
}

void UpdateTimer() {
  println(tiempoRestante);
  int tiempoTranscurrido = millis() - tiempoAnterior;
  
  if (tiempoRestante > 0) {
    tiempoRestante = max(0, tiempoRestante - tiempoTranscurrido);
  }
  else{
    if(PJ_lifes > 0){
      PJ_lifes--;
      scene = 4;
    }
    else{
      
    }
  }
  tiempoAnterior = millis();
}

void TimerOver(){
  background(0);
  fill(255);
  textSize(100);
  text("-1 LIFE", 480, 335);
  textSize(50);
  text("Press enter to try again", 480, 700);
  text("Current lifes:", 430, 900);
  text(PJ_lifes, 600, 900);
}

void keyPressed(){
  if(scene == 4 && key == ENTER){
    scene = 1;
  }
}
