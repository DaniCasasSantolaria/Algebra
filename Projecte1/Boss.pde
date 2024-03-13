float x_boss = 700, y_boss = 500;
float radius_boss = 80;
int life_boss = 3;
//Queriamos implementar sierras en el boss final con el codigo de los planetas pero no hemos tenido tiempo
//float [] x_saw, y_saw; 
//int amount_saws = 3; 
//float radius_saws = 40;

void BossMovement()
{
    float direction = atan2(yPJ - y_boss, xPJ - x_boss);  //La función atan2 sirve para calcular el angulo entre el PNJ2 y los npcs
    //Calculamos el desplazamiento en el eje X y en el eje Y
    float velocityBoss = 2;
    float moveX = cos(direction) * velocityBoss;
    float moveY = sin(direction) * velocityBoss;
    x_boss += moveX;
    y_boss += moveY;
    fill(0,255,255);
    ellipse(x_boss, y_boss, radius_boss, radius_boss);
    CheckBossMapCollisions();
}
