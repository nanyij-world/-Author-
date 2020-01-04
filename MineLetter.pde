class MineLetter {
  PVector location;
  PVector velocity;
  PVector acceleration;
  char mine;
  float x,y, homex,homey;
  float theta;
  float mousex,mousey;

   MineLetter(PVector location_,char mine_, float x_,float y_){
    location = location_;
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mine = mine_;
    homex = x_;
    homey = y_;
    theta = random(2*TWO_PI);
  
  
}
   
   void update() {
    PVector mouse = new PVector (mouseX, mouseY);
    mouse.sub(location);
    mouse.setMag(0.5); // set the magnitude of the vector 
    acceleration = mouse;
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(3);
    x = mouseX;    
    y = mouseY;
  }
  
  void displayR(){
    translate(location.x,location.y);
    text(mine,0,0);
  }
  
  void displayP(){
    translate(x,y);
    rotate(theta);
    text(mine,0,0);
text(mine,0,0);
  }
  
  void home(){
    x = lerp(x,homex,0.05);
    y = lerp(y,homey,0.05);
    theta = lerp(theta,0,0.05);
  }
  
  void back(){
    x = lerp(homex,x,0.05);
    y = lerp(homey,y,0.05);
    theta = lerp(theta,0,0.05);
  }
  
  
  
  void shake() {
    x += random(-3,3);
    y += random(-5,5);
    theta += random(-1,1);
  }

}
