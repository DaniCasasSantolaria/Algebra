//tamaño de ventana
int widthD= 1920;
int HeightD= 1080;
int score=0;
int lives=3;
String message;

//Bloques 
float brickX=0;
int spaceBetweenBricks= 5;
int numberOfBricks= 10;
int numberOfBrickRows= 10;
int spaceFromCeiling= 20; //space between the first row of bricks and the ceiling
float brickWidth= (widthD-(numberOfBricks-2)*spaceBetweenBricks)/numberOfBricks;
float brickHeight= 10;
color brickColors[]= {color(255, 0,0), color(255, 183, 0), color(255,255,0), color(0,255,0), color(0,0,255), color(156,0,255), color(255, 0,0), color(255,183, 0), color(255,255,0), color(0,255,0)};
color brickColor= color(255, 255, 0);
ArrayList<Block> BasketOfBricks= new ArrayList<Block>();

//Pelota 
int ballWidth= 16;
float ballStartX=random(widthD);
float ballStartY=HeightD/2;
color ballColor= color(255, 0, 0);
boolean hasLost= false;
boolean hasWon= false;
Ball Moe = new Ball(ballStartX, ballStartY, ballWidth, ballColor);

//Paddle
int paddleX= widthD/2;
int paddleY= HeightD-50;
int paddleHeight= 20;
int paddleWidth= 80;
color paddleColor= color(255, 0, 255);
Block paddle= new Block(paddleX, paddleY, paddleWidth, paddleHeight, paddleColor);

//Inicializar todos los bloques
void setupBricks() {
  
  for(int rowNumber=0;rowNumber<numberOfBrickRows;rowNumber++) {
    for(int brickNumber=0;brickNumber<numberOfBricks;brickNumber++) {
        color brickColor=brickColors[rowNumber];
        float brickY= spaceFromCeiling+(brickHeight+spaceBetweenBricks)*rowNumber;
        brickX=(brickWidth+spaceBetweenBricks)*brickNumber;
        BasketOfBricks.add(new Block(brickX, brickY, brickWidth, brickHeight, brickColor));
    }
  }
}

//dibujar los bloques 
void drawBricks() {  
  for(int brickNumber= BasketOfBricks.size()-1; brickNumber>=0; brickNumber--) {
    Block brick=BasketOfBricks.get(brickNumber);
    brick.draw();
    if(brick.collidesWith(Moe)) {
      BasketOfBricks.remove(brick);
      updateScore(true);
    }
  }
}

//dibujar la bola 
void drawBall() {
    Moe.draw();
    Moe.update();
    if(Moe.checkWallCollision()) {
      lives--;
      Moe.move(width/2, height/2);
    }
}

//dibujar el paddle y movimiento mouse 
void drawPaddle() {
  paddle.draw();
  paddle.blockX=mouseX - paddleWidth / 2;
  paddle.collidesWith(Moe);
}

void displayText(String message, int x, int y, boolean isCentered) {
  fill(0);
  textSize(32);
    String name= message;
    float textX= x;
    if (isCentered) {
      float widthText= textWidth(name);
      textX= (width-widthText)/2;
    } 
    int textY= y;
    text(name, textX, textY);
}
 //Dibujar perder 
void drawLose() {
  String message="You lose!";
    displayText(message, 0, height/2, true);
    hasLost=true;
  }
  //Sumar score 
void updateScore(boolean isNew) {
  if (isNew) score+=10;
  message="Score:"+score;
  displayText(message, 0, height-2, false);
  if(score==numberOfBricks*numberOfBrickRows*10) {
    displayText("You win!",0,height/2,true);
    hasWon=true;
  }
}
//Comprovar vidas 
void checkLives() {
  if(Moe.ballY+Moe.ballWidth==height) {
    lives--;
  }
  drawLivesText();
}

void drawLivesText() {
  String message;
  message="Lives: " + lives;
  displayText(message,((int)(width-textWidth(message))),height-2,false);
}
/*******Clase de pelota*************/
/* La clase predeterminada tiene los siguientes modos predeterminados
Función constructora: para crear una nueva bola llama a:
ballName= new Ball(x, y, Width, Color);
ballName.draw(); //esto atrae la pelota
ballName.update(); //esto mueve la pelota
ballName.checkWallCollision();
 */
class Ball {
  float ballX;
  float ballY;
  float ballWidth;
  color ballColor;
  float speedY= 3.5;
  float speedX= 3.5;
  
  //Constructor
  Ball(float x, float y, int Width, color Color) {
     ballX= x;
     ballY= y;
     ballWidth= Width;
     ballColor= Color; 
  }
//Draw 
  void draw() {
    noStroke();
    fill(ballColor);
    ellipse(ballX, ballY, ballWidth, ballWidth);
  }
  
  
  //Cambiar velocidad bola 
  void update() {
    ballX+=speedX;
    ballY+=speedY;
  }
  void move(int X, int Y) {
    ballX = X;
    ballY = Y;
    speedY= 4;
    speedX= 4;
  }
  
  //Rebote 
  boolean checkWallCollision() {
    if (ballX>width-ballWidth/2) {
        speedX=-abs(speedX); 
    } else if (ballX<ballWidth/2) {
       speedX=abs(speedX);
    } if (ballY>height-ballWidth/2) { 
        speedY=-abs(speedY);
        return true; 
    } else if (ballY<ballWidth/2) {
        speedY= abs(speedY);
    }
    return false;
  }
}
/*******Clase de bloque*************/
/* La clase predeterminada tiene los siguientes modos predeterminados
Función constructora: para crear un nuevo bloque llama:
Bloque nombre de bloque = nuevo bloque (x, y, ancho, alto, color);
blockName.draw(); //esto dibuja el bloque
blockName.move(x, y); //esto mueve el bloque para que se centre en X e Y
blockName.collidesWith(Ball b); //comprueba si hay choque y provoca rebote 
blockName.setHits(int numOfHits); //te permite establecer el número de veces que debe golpear un bloque 
blockName.getHits(); //te dice las veces que se puede golpear el bloque que queda
 */
class Block {
  float blockX;
  float blockY;
  float blockWidth;
  float blockHeight;
  color blockColor;
  int maxHits= 1;
  int hits=maxHits;
  
  //Constructor 
  Block(float x, float y, float Width, float Height, color Color) {
     blockX= x;
     blockY= y;
     blockWidth= Width;
     blockHeight= Height;
     blockColor= Color; 
  }
   //Draw 
  void draw() {
    noStroke();
    fill(blockColor);
    rect(blockX, blockY, blockWidth, blockHeight);
  }
  
  
  //Mueve la plataforma 
  void move(int X, int Y) {
    blockX=X-blockWidth/2;
    blockY=Y-blockHeight/2;
    
    //evita que se salga de la pantalla en la dirección X
    if (blockX+blockWidth>width) {
      blockX=width-blockWidth;
    }
    else if (blockX<0) {
      blockX=0;
    }
    
    //evita que salga de la pantalla en la dirección Y
    if (blockY+blockHeight>height) {
      blockY=height-blockWidth;
    }
    else if (blockY<0) {
      blockY=0;
    }
    
  }
   
  //te permite cambiar el número de veces que se puede golpear un bloque individual
  void setMaxHits(int numberOfHits) {
    maxHits=numberOfHits;
    hits= maxHits;
  }
  

  //te dice si el bloque se puede golpear más
  //devuelve 0 si es necesario quitar el bloque 
  //útil si quieres que el bloque golpee varias veces
  int getHits() {
   return hits;
  }
  
  //devuelve un valor booleano si choca con una pelota.
  // Cambia automáticamente la velocidad de la pelota.
  boolean collidesWith(Ball b) {
    //choca con la parte inferior del bloque
    if ((b.ballX+b.ballWidth/4>blockX && b.ballX-b.ballWidth/4<blockX+blockWidth)
        && (b.ballY-b.ballWidth/2<(blockY+blockHeight) && b.ballY-ballWidth/2>blockY)) {
        //println("Collision Bottom 2 ");
        b.speedY=abs(b.speedY);
        hits--;
        return true;
      }
    
    //choca con la parte superior del bloque
    if ((b.ballX+b.ballWidth/4>blockX && b.ballX-b.ballWidth/4<blockX+blockWidth)
      && (b.ballY+b.ballWidth/2<blockY+blockHeight && b.ballY+b.ballWidth/2>blockY)) {
        //println("Collision Top ");
        b.speedY=-abs(b.speedY);
        hits--;
        return true;
      }
      
     //choca con el lado izquierdo del bloque
    else if ((b.ballY+b.ballWidth/4>blockY && b.ballY-b.ballWidth/4<blockY+blockHeight)
      && (b.ballX+b.ballWidth/2>blockX && b.ballX+b.ballWidth/2<blockX+blockWidth)) {
        //println("Collision Left ");
        b.speedX=-abs(b.speedX);
        hits--;
        return true;
      }
 
    //choca con el lado derecho del bloque
   if ((b.ballY+b.ballWidth/4>blockY && b.ballY-b.ballWidth/4<blockY+blockHeight)
      && (b.ballX-b.ballWidth/2<blockX+blockWidth && b.ballX-b.ballWidth/2>blockX)) {
        //println("Collision Right");
        b.speedX=abs(b.speedX);
        hits--;
        return true;
      }
  return false;
  }
}
