// Anem a crear un sistema solar
// Amb 3 cossos, emprant funcions
// i transformacions

// Variables
float angleLluna, angleTerra, angleMercuri, angleMart, angleJupiter, angleLluna1Jupiter, angleLluna2Jupiter;
float incAngle1, incAngle2;    //Un lent i un ràpid (llunes) i un lent (planetes)

// Funcions

// Aquesta funció pinta un planeta
// del color i radi indicats
void pintaPlaneta(float diametrePlaneta, color colorPlaneta){
  fill(colorPlaneta);
  stroke(255);
  strokeWeight(3);
  ellipse(0,0,diametrePlaneta,diametrePlaneta);
}

// Aquesta funció ho pinta tot!
void pintaSistemaSolar(){
  // Sol
  translate(width/2.0,height/2.0);
  pintaPlaneta(100.0, color(255,255,0));
  
  pushMatrix(); //Voldré tornar al sol i per això es fa el push
    // Terra
    rotate(angleTerra);
    translate(100.0,0.0);
    pintaPlaneta(25.0, color(0,255,255));
  
    // Lluna
    rotate(angleLluna);
    translate(40.0,0.0);
    pintaPlaneta(10.0, color(127,127,127));
    popMatrix();
  
  pushMatrix();
    // Mart
    rotate(angleMart);
    translate(140.0,0.0);
    pintaPlaneta(35.0, color(255,0,0));
    popMatrix(); //Vull tornar al Sol
  
  pushMatrix();
    // Mercuri
    rotate(angleMercuri);
    translate(70.0,0.0);
    pintaPlaneta(15.0, color(100,200,150));
    popMatrix();//Vull tornar al Sol
  
  pushMatrix();
    // Jupiter
    rotate(angleMercuri);
    translate(210.0,0.0);
    pintaPlaneta(85.0, color(123,12,200));
    pushMatrix();
      // 1a Lluna
      rotate(angleLluna1Jupiter);
      translate(95.0,0.0);
      pintaPlaneta(10.0, color(200,127,30));
      popMatrix();
    
      pushMatrix();
      // 2a Lluna
      rotate(angleLluna2Jupiter);
      translate(65.0,0.0);
      pintaPlaneta(14.0, color(100,200,0));
      //La Lluna de la Lluna
      pushMatrix();
        rotate(angleLluna2Jupiter);
        translate(15.0,0.0);
        pintaPlaneta(8.0, color(0,0,0));
        popMatrix();
  
    popMatrix();//Vull tornar al Sol
  
  popMatrix();
}

void setup(){
 size(500,500);
 frameRate(30);
 // Inicialitzem els increments
 incAngle1 = 0.01;
 incAngle2 = 0.06;
}

void draw(){
  background(0);
  pintaSistemaSolar();
  angleTerra += incAngle1;
  angleLluna += incAngle2;
  angleMercuri += incAngle1 * 1.5;
  angleMart += incAngle1 * 0.5;
  angleJupiter += incAngle1;
  angleLluna1Jupiter += incAngle2 * 0.7;
  angleLluna2Jupiter += incAngle2 * 0.3;
}
