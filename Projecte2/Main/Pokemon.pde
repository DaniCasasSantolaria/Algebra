PImage playerRight, playerLeft, playerUp, playerDown, playerRightRun, playerLeftRun, playerUpRun, playerDownRun;
PImage house1, house2, house3, house4;
PImage busLeft, busRight, vanLeft, vanRight, taxiLeft, taxiRight, carLeft, carRight, car2Left, car2Right;
PImage[] NPC;
class Car {
  PImage imageLeft, imageRight;
  color paint;
  float x, y, speed;
  int type, v_height, v_width;
  
  Car() {
    float randomImage = (int)random(4.1);
    if(randomImage == 0){
     imageLeft = busLeft;
     imageRight = busRight;
     v_height = 70; 
     v_width = 150;
     speed = random(1.5, 2.1);
    }
    else if(randomImage == 1){
     imageLeft = vanLeft;
     imageRight = vanRight;
     v_height = 90; 
     v_width = 150;
     speed = random(1.7, 2.5);
    }
    else if(randomImage == 2){
     imageLeft = taxiLeft;
     imageRight = taxiRight;
     v_height = 50; 
     v_width = 120;
     speed = random(2, 2.8);
    }
    else if(randomImage == 3){
     imageLeft = carLeft;
     imageRight = carRight;
     v_height = 50; 
     v_width = 130;
     speed = random(2.5, 3.2);
    }
    else{
     imageLeft = car2Left;
     imageRight = car2Right;
     v_height = 50; 
     v_width = 130;
     speed = random(2.5, 3.2);
    }
    paint = color(random(255), random(255), random(255));
    float position = random(1.01);
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

class Player{
  PImage direction;
  int x, y;
  Player(){
    direction = playerDown;
    x = width / 2;
    y = 100;
  }
}
Player player;

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
 drawCars();
}

void drawHouses(){
 pushMatrix();
 imageMode(CENTER);
 for(int i = 0; i < NUM_HOUSES; i++){
   image(houses[i].image, houses[i].x, houses[i].y);
 }
 popMatrix();
}


int NUM_CARS = 2;
Car[] cars = new Car[NUM_CARS];
float timer;

void drawCars() {
  imageMode(CENTER);
  timer = millis() / 1000.0;
  for (int i = 0; i < NUM_CARS; i++) {
    fill(cars[i].paint);
    if (cars[i].type == 1) {
      image(cars[i].imageRight, cars[i].x, cars[i].y);
      cars[i].x += cars[i].speed;
      if (cars[i].x > width + 100) {
        cars[i] = new Car();
      }
    } else {
      image(cars[i].imageLeft, cars[i].x, cars[i].y);
      cars[i].x -= cars[i].speed;
      if (cars[i].x < -100) {
        cars[i] = new Car();
      }
    }
  }
}

void drawCharacter(){
  playerMovement();
  image(player.direction, player.x, player.y);
}

class House{
  PImage image;
  int x, y;
  int hWidth, hHeight;
}

int NUM_HOUSES = 4;
House[] houses = new House[NUM_HOUSES];
