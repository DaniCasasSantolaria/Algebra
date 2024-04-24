PImage playerRight, playerLeft, playerUp, playerDown, playerRightRun, playerLeftRun, playerUpRun, playerDownRun;
void createMap(){
 rectMode(CENTER);
 //Carretera
 fill(#7c7c7c);
 rect(width / 2, height / 2, width, 300);
 //Lineas Carretera
 pushMatrix();
 fill(255);
 for(int i = 0; i < 11; i++){
  rect(60, height / 2, 100, 20);
  translate(200,0);
 }
 popMatrix();
 //Casa 1
 rect(300, 175, 300, 300);
 //Casa 2
 rect(width - 300, 175, 300, 300);
 //Casa 3
 rect(300, height - 175, 300, 300);
 //Casa 4
 rect(width - 300, height - 175, 300, 300);
 //Coches
 drawCars();
}

class Car {
  color paint;
  float x, y, speed;
  int type;
  
  Car() {
    paint = color(random(255), random(255), random(255));
    speed = random(1, 3.5);
    float position = random(1);
    if (position > 0.5) {
      x = -100;
      y = (height / 2) - (300 / 4);
      type = 1;
    } else {
      x = width + 100;
      y = (height / 2) + (300 / 4);
      type = 2;
    }
  }
}

int NUM_CARS = 2;
Car[] cars = new Car[NUM_CARS];
float timer;

void drawCars() {
  timer = millis() / 1000.0;
  for (int i = 0; i < NUM_CARS; i++) {
    fill(cars[i].paint);
    rect(cars[i].x, cars[i].y, 100, 50);
    if (cars[i].type == 1) {
      cars[i].x += cars[i].speed;
      if (cars[i].x > width + 100) {
        cars[i] = new Car();
      }
    } else {
      cars[i].x -= cars[i].speed;
      if (cars[i].x < -100) {
        cars[i] = new Car();
      }
    }
  }
}


void drawCharacter(){
  rectMode(CENTER);
  rect(width / 2, 100, 50, 50);
}
