
void setup(){
  size(400, 400);
 
}

void draw(){
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
}
//original left x = 50;
//original right x = 250;
void buildLimbs(){
  buildLeftArm();
  buildRightArm();
}
void buildLeftArm(){
  rotate(HALF_PI/2);
  fill(150,75,0);
  rect(150,20,100,10); //left arm
 // rect(150,250,100,10); //right arm
}
void buildRightArm(){
 // rotate((HALF_PI));
  fill(150,75,0);
  rect(350,0,100,10); //right arm
 // rect(150,250,100,10); //right arm
}


/*
void mouseMoved(){
  ellipseX = mouseX;
  ellipseY = mouseY;
  background(155,255,255);
}
*/

