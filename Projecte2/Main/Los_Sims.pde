PImage playerRight, playerLeft, playerUp, playerDown, playerRightRun, playerLeftRun, playerUpRun, playerDownRun;
PImage house1, house2, house3, house4;
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
  timer = millis() / 1000.0;
  for (int i = 0; i < NUM_CARS; i++) {
    fill(cars[i].paint);
    rect(cars[i].x, cars[i].y, 120, 60);
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
int height_pj = 60;
int width_pj = 50;
int prevSquareX, prevSquareY;
void housesColliders(){
  PVector min_pc = new PVector(player.x - width_pj/2.0, player.y + height_pj/2.0);
  PVector max_pc = new PVector(player.x + width_pj/2.0, player.y - height_pj/2.0);
  // We continue with the walls (we loop through them)
  PVector min_houses = new PVector(0,0);
  PVector max_houses = new PVector(0,0);
  boolean collided;
  for(int counter=0;counter<NUM_HOUSES;counter++){
    min_houses.x = houses[counter].x - houses[counter].hWidth/2.0;
    min_houses.y = houses[counter].y + houses[counter].hHeight/2.0;
    max_houses.x = houses[counter].x + houses[counter].hWidth/2.0;
    max_houses.y = houses[counter].y - houses[counter].hHeight/2.0;
    // We perform the Min Max Test
    if ((max_pc.x<min_houses.x)||(max_pc.y>min_houses.y)||
    (max_houses.x<min_pc.x)||(max_houses.y>min_pc.y)) collided = false;
    else collided = true;
    fill(255,255,255);
    if (collided){
      if(player.y > houses[counter].y && player.x < houses[counter].x + 20 && player.x > houses[counter].x - 20) scene = 0;
      player.x = prevSquareX;
      player.y = prevSquareY;
    }
    else{
      prevSquareX = player.x;
      prevSquareY = player.y;
      text("NO :(", houses[counter].x, houses[counter].y);
    }
  }
}
