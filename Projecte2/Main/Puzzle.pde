PImage [] img = new PImage[12];
import java.util.Collections;
ArrayList<Integer>rand = new ArrayList<Integer>();

int row[]={0,1,2,0,1,2,0,1,2};
int col[]={0,0,0,1,1,1,2,2,2};
int step=0,white,start,init;
boolean lock= false, play = false;

void drawPuzzleGame(){
 //cover with a color rectangle, so that it can refresh the texts on screen 
 background(128);
 noStroke();
 fill(128);
 rect(0,0,960,630);
 
 //text
 PFont font;
 font = createFont("Calibri", 64);
 textFont (font);
 fill(0);
 text("3x3 sliding Puzzle Game",150,100);
 text("Moves: "+step,150,800);
 
 //check if it's solved
 int j;
 boolean solved=false;
 for (j=0;j<9;j++)
 {
  if(rand.get(j)!=j) break; 
 }
 if (j>8) solved = true;
 
 if (solved && play)
 {
   //so that any subpuzzle cannot be moved UP/DOWN/LEFT/RIGHT
   lock=true;
   println("solved");
 }
 
 //if game starts &it is not solved, then time starts now
 if(play && !solved)
     start=millis();
     
 
 //convert milliseconds into second/minute/hour
 int second = ((start-init)/1000)%60; // 1000 millisec = 1 sec
 int minute = ((start - init)/(1000*60))%60; //1000*60 millisec = 1 min 
 int hour = ((start - init)/(1000*60*60))%24; // 1000*60*60 millisec = 1 hour 
 text("Time: "+hour+":"+minute+":"+second,500,800);
 
 //Show all the subpuzzles (9subpuzzles)
 int Swidth = width/6, Sheight=height/6;
 for (int i=0; i<9; i++)
     image(img[rand.get(i)],row[i]*Swidth+240,col[i]*Sheight+150,Swidth-8,Sheight-8);
     
 //find the position of white subpuzzle (whose index=0)
 for (int i=0; i<9; i++)
 if (rand.get(i)==0) white=i;
 
 image (img[9],1400,205); //NEW button
 image (img[10],1400,300); //PLAY button
 image (img[11], 1400, 460); //EXIT button

}
