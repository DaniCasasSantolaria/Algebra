// AABB (Axis Aligned Bounding Boxes) Collision's detector
// Walls are static and red (besides rectangular)
// The P.C. moves with the mouse and it is green

// Variables
PVector[] walls; // The walls to collide with
int amount_walls; // The amount of walls to be created
int wall_width, wall_height; // Size of the walls
// Setup
void setup(){
  // Window
  size(600,600);
  // Initialize everything
  amount_walls = 10;
  walls = new PVector[amount_walls];
  wall_width = 30;
  wall_height = 15;
  // Initialize wall's positions in screen
  for(int counter=0;counter<amount_walls;counter++){
    walls[counter] = new PVector(0,0);
    walls[counter].x = (int)random(wall_width/2.0,width-wall_width/2.0);
    walls[counter].y = (int)random(wall_height/2.0,height-wall_height/2.0);
  }
}

// Draw
void draw(){
  // Background
  background(0);
  // Draw the walls
  fill(255,0,0);
  rectMode(CENTER);
  for(int counter=0;counter<amount_walls;counter++){
    rect(walls[counter].x, walls[counter].y, wall_width, wall_height);
  }
}

// Events and functions
void mouseMoved(){
  // Draw the P.C.
  fill(0,255,0);
  rect(mouseX, mouseY, wall_width, wall_height);
  // Collision detection happens here for efficiency
  // We calculate when we move the mouse only
  // Collision detection code (Min Max Test)
  // 1- Find the coords of the 2 rectangles (xmin, xmax,ymin,ymax)
  // 2- Compare them
  // 3- Decide!
  // We start with the P.C.
  PVector min_pc = new PVector(mouseX-wall_width/2.0,mouseY+wall_height/2.0);
  PVector max_pc = new PVector(mouseX+wall_width/2.0,mouseY-wall_height/2.0);
  // We continue with the walls (we loop through them)
  PVector min_wall = new PVector(0,0);
  PVector max_wall = new PVector(0,0);
  boolean collided;
  for(int counter=0;counter<amount_walls;counter++){
    min_wall.x = walls[counter].x - wall_width/2.0;
    min_wall.y = walls[counter].y + wall_height/2.0;
    max_wall.x = walls[counter].x + wall_width/2.0;
    max_wall.y = walls[counter].y - wall_height/2.0;
    // We perform the Min Max Test
    if ((max_pc.x<min_wall.x)||(max_pc.y>min_wall.y)||
    (max_wall.x<min_pc.x)||(max_wall.y>min_pc.y)) collided = false;
    else collided = true;
    fill(255,255,255);
    if (collided){
      text("YES :)", walls[counter].x, walls[counter].y);
    }
    else{
      text("NO :(", walls[counter].x, walls[counter].y);
    }
  }
}
