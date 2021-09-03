import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

boolean hasArduino = false;
boolean hatVisible = false;
long counter = 0;

void setup(){
  size(400, 400);
 
  
  if (Arduino.list() != null && Arduino.list().length > 1){
      hasArduino = true;
      arduino = new Arduino(this, Arduino.list()[1], 57600);
  }//change the [0] to a [1] or [2] etc. if your program doesn't work
  
 
}
int leftButton;
int rightButton;
int y = 150;
void draw(){
  counter++;
  background(155);
  timer();
  if (hasArduino)
    y = arduino.analogRead(5);
  buildShapes();
  buildAddons();
  makeHat();
  buildLimbs();
  leftButton = arduino.analogRead(1);
  rightButton = arduino.analogRead(6);
  drawTie();
}
int ellipseX = 200;
int ellipseY = 200;

void timer(){
  if(tie){
    text("Woahhhh! I have a tie now!", 225, 50);
    text("I didn't even know ties existed!", 250, 70);
  }
  if(y < 100){
    fill(0,0,0);
    text("Oh hi! You are obviously not a stranger", 5,30);
    text("No stranger danger here", 5, 40);
    text("I have no idea who you are!", 6,80);
    return;
  }
  if (counter >= 250 && counter <= 500){
    text("Nothing to see here... Just a snowman", 50, 50);
  }
  if (counter > 1000 && counter < 1500){
    text("seriously... no magic to be found here", 50,50);
    text("Just your average man made out of snow", 50,100);
  }
  if (counter > 2000){
    text("You know... I'm not going to show myself",50,50);
    text("You need to know the password",50,100);
  }
  if (counter > 2500){
    counter = 0;
  }
   
}

void buildShapes(){
  fill(255,255,255);
  ellipse(ellipseX,ellipseY + 150,150,150); //base
  ellipse(ellipseX,ellipseY + 35,125,125);  //center
  ellipse(ellipseX,ellipseY - 40, 100, 100);  //top
}
int max1 = ellipseY + 35;
int max2 = ellipseY + 45;
int max3 = ellipseY + 15;
int y1 = 35;
int y2 = 45;
int y3 = 15;
boolean tie = false;
void drawTie(){
  if(rightButton > 0){
    tie = true;
    if(max1 > y1)
      y1++;
    if(max2 > y2)
      y2++;
    if(max3 > y3)  
      y3++;
  }else{
    tie = false;
    y1 = 35;
    y2 = 45;
    y3 = 15;
  }
  if(!tie)
    return;
  pushMatrix();
  fill(0,0,0);
  ellipse(ellipseX, y1, 25, 25); //center bow
  triangle(ellipseX -5, y1, ellipseX - 30, y2, ellipseX -30, y3);
  triangle(ellipseX +5, y1, ellipseX + 30, y2, ellipseX +30, y3);
  popMatrix();
}
/**
BUTTONS+FACE
**/
void buildAddons(){
  fill(0,0,0);
  ellipse(ellipseX,ellipseY + 120,15,15); //base button
  ellipse(ellipseX,ellipseY + 35,15,15);  //center button
  ellipse(ellipseX,ellipseY + 75, 15,15);  //top button
  buildFace();
}
/**
FACE
**/
void buildFace(){
  fill(0,0,0);
  ellipse(ellipseX,ellipseY, 10,10);
  ellipse(ellipseX + 10,ellipseY - 5, 10,10);
  ellipse(ellipseX + 20, ellipseY - 10, 10,10);
  ellipse(ellipseX - 10,ellipseY - 5, 10,10);
  ellipse(ellipseX - 20,ellipseY - 10, 10,10);
  ellipse(ellipseX + 25, ellipseY - 50, 10,10);
  ellipse(ellipseX - 25, ellipseY - 50, 10,10);
}
//original left x = 50;
//original right x = 250;
void buildLimbs(){
  pushMatrix();
  buildLeftArm();
  buildRightArm();
  popMatrix();
}
int rightY = 345;
int leftY = 345;
boolean rotate = false;
boolean visible = false;
boolean opposite = true;
/**
LEFT ARM
**/
int radians = 45;
void buildLeftArm(){
  pushMatrix();
  if (y < 100){
    visible = true; 
    if(leftY>=200){
      rotate = false;
       leftY--;
    }else rotate = true;
  }else{
    leftY = 345;
    rotate = false;
    visible = false;
  }
  if (hasArduino || pressed){
    //  rotate(PI / 4);
    if (visible){
        fill(150,75,0);
        translate(150,leftY);
        rotate(radians(radians));
        if(rotate){
          if(radians > 45){
            opposite = true;
          }
          if(radians < -75)
            opposite = false;
          if(opposite)
            radians--;
          else radians++;
        }
        rect(0, 0,-100,10); //left arm
    }
  }
  popMatrix();

}
/**
RIGHT ARM
**/
int staticRadians = 45;
void buildRightArm(){
  pushMatrix();
    if (y < 100){
    visible = true; 
    if(rightY>=200){
       rightY--;
    }else rotate = true;
    }else{
    rightY = 345;
    rotate = false;
    visible = false;
   
  }
  if (hasArduino || pressed){
    if (visible){
      fill(150,75,0);
      translate(250, rightY);
      if (rotate)
        rotate(radians(staticRadians));
      rect(0,0,100,10); //right arm
   }
  }
  popMatrix();
}
int hatBaseY = 0;
int hatTopY = 0;

/**
HAT
**/
void makeHat(){
  fill(0,0,0);
   if(y < 100){
     hatVisible = true;
     if(hatBaseY < 100)
       hatBaseY++;
     if(hatTopY < 35)
       hatTopY++;
   }else{
     hatBaseY = 0;
     hatTopY = 0;
     hatVisible = false;
   }
   if(hatVisible){
     rect(150, hatBaseY, 100, 20);
      rect(175, hatTopY, 50, 70);
    }
    /*
    rect(150, 100, 100, 20);
    rect(175, 35, 50, 70);
    */
}



void mousePressed(){
    pressed = true;
    y = 50;
}
void mouseReleased(){
    pressed = false;
    y = 150;
}

boolean pressed = false;
