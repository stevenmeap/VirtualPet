import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

void setup(){
  size(400, 400);
   arduino = new Arduino(this, Arduino.list()[1], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
 
}
int y = 0;
void draw(){
  background(144);
  y = arduino.analogRead(5);
  System.out.println(y);
  buildShapes();
  buildAddons();
  buildLimbs();
}
int ellipseX = 200;
int ellipseY = 200;

void buildShapes(){
  fill(255,255,255);
  ellipse(ellipseX,ellipseY + 150,150,150); //base
  ellipse(ellipseX,ellipseY + 35,125,125);  //center
  ellipse(ellipseX,ellipseY - 40, 100, 100);  //top
}
void buildAddons(){
  fill(0,0,0);
  ellipse(ellipseX,ellipseY + 120,15,15); //base button
  ellipse(ellipseX,ellipseY + 35,15,15);  //center button
  ellipse(ellipseX,ellipseY + 75, 15,15);  //top button
  buildFace();
}
void buildFace(){
  fill(0,0,0);
  ellipse(ellipseX,ellipseY, 10,10);
  ellipse(ellipseX + 10,ellipseY - 5, 10,10);
  ellipse(ellipseX + 20, ellipseY - 10, 10,10);
  ellipse(ellipseX - 10,ellipseY - 5, 10,10);
  ellipse(ellipseX - 20,ellipseY - 10, 10,10);
}
//original left x = 50;
//original right x = 250;
void buildLimbs(){
  buildLeftArm();
  buildRightArm();
}
int rightY = 345;
int leftY = 345;
boolean rotate = false;
boolean visible = false;
void buildLeftArm(){
  if (y < 100){
    visible = true; 
    if(leftY>=20){
       rotate = true;
       leftY--;
    }
  }else{
    leftY = 345;
    rotate = false;
    visible = false;
  }
  if(rotate)
     //rotate(PI / 4);
  if (visible){
    fill(150,75,0);
    rect(150, leftY,100,10); //left arm
  }
 // rect(150,250,100,10); //right arm
}
void buildRightArm(){
    if (y < 100){
    visible = true; 
    if(rightY>=0){
       rotate = true;
       rightY--;
    }
  }else{
    rightY = 345;
    rotate = false;
    visible = false;
   
  }
  if(rotate)
     rotate(PI/4);
  if (visible){
    fill(150,75,0);
    rect(350,rightY,100,10); //right arm
 }
}



/*
void mouseMoved(){
  ellipseX = mouseX;
  ellipseY = mouseY;
  background(155,255,255);
}
*/
