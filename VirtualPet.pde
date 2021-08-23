
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
  ellipse(ellipseX,ellipseY + 120,15,15); //base
  ellipse(ellipseX,ellipseY + 35,15,15);  //center
  ellipse(ellipseX,ellipseY + 75, 15,15);  //top
}
void buildLimbs(){
  rotate(45);
  fill(255,0,0);
  rect(50,250,50,250);
}


/*
void mouseMoved(){
  ellipseX = mouseX;
  ellipseY = mouseY;
  background(155,255,255);
}
*/


