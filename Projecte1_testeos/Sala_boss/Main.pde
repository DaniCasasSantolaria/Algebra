
void setup() 
{
   size (1000,1000);
  x_boss = 800;
  y_boss = 500;
  x_tower = new float[amount_towers];
  y_tower = new float[amount_towers];
  // asignación de posiciones de las torres 
  x_tower[0] = radius_tower;
  y_tower[0] = radius_tower;
  x_tower[1] = width - radius_tower; 
  y_tower[1] = radius_tower; 
  x_tower[2] = radius_tower;
  y_tower[2] = height - radius_tower;
  x_tower[3] = width - radius_tower;
  y_tower[3] = height - radius_tower;

  x_obstacles = new float[amount_obstacles];
  y_obstacles = new float[amount_obstacles];
  //asignación de posiciones de los obstáculos 
  x_obstacles[0] = radius_tower * 2; 
  y_obstacles[0] = height/3;
  x_obstacles[1] = radius_tower * 2; 
  y_obstacles[1] = (2 * height)/3;
  x_obstacles[2] = width/3;
  y_obstacles[2] = height -radius_tower * 2;
  x_obstacles[3] = (2 * width)/3;
  y_obstacles[3] = height - radius_tower * 2;
  x_obstacles[4] = width - radius_tower * 2;
  y_obstacles[4] = (2 * height)/3;
  x_obstacles[5] = width - radius_tower * 2;
  y_obstacles[5] = height/3;
  x_obstacles[6] = (2 * width)/3;
  y_obstacles[6] = radius_tower * 2;
  x_obstacles[7] = width/3;
  y_obstacles[7] = radius_tower * 2;
  
}

void draw()
{
  background(#F07F41);
  CreateMap();
  fill(#F93500);
  ellipse(200,200,100,100);
  
}
