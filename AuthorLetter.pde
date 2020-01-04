class AuthorLetter {

  PFont f;
  char letter;
  float homex,homey;
  float x,y;
  float theta;

   AuthorLetter(float x_, float y_, char letter_){
    
    homex = x = x_+10;
    homey = y = y_;
    x = random(width);
    y = random(height);
    theta = random(2*TWO_PI);
    letter = letter_; 
    f = createFont("Avenir-Book",15);
  }

   float x(){
    return x;
  }
  
  float y(){
    return y;
  }
  
  void display() {
    textAlign(LEFT);
    //textFont(f);
    translate(x,y);
    rotate(theta);
    text(letter,0,0);
  }
  
  // Move the letter randomly
  void shake() {
    x += random(-3,3);
    y += random(-5,5);
    theta += random(-1,1);
  }

  // Return the letter home using lerp!
  void home() {
    x = lerp(x,homex,0.05);
    y = lerp(y,homey,0.05);
    theta = lerp(theta,0,0.05);
  }
  
    void back() {
    x = lerp(x,random(width),0.05);
    y = lerp(y,random(height),0.05);
    theta = lerp(theta,0,0.05);
  }


}
