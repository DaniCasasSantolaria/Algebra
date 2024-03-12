float[] x_tower, y_tower;
int amount_towers = 4; 
int life_towers = 5;
float radius_tower = 100; 
float[] x_obstacles, y_obstacles;
int amount_obstacles = 8;
float obstacles_height = 40;

void CreateBossMap()
{
  background(0);
  fill(#5E41F0);
  for (int i = 0; i < amount_obstacles; i++)
  {
    rectMode(CENTER);
    rect(x_obstacles[i], y_obstacles[i], obstacles_height,obstacles_height);
  }
  
  fill(#00AEEB);
   for (int i = 0; i < amount_towers; i++)
  {
    ellipse(x_tower[i],y_tower[i],radius_tower, radius_tower);
  }
}

void CheckBossMapCollisions(){
  
}
