abstract class GameObject {
 
  float x, y, z, w, h, vx, vy;
  color c;
  
  GameObject() {

  }
  
  void show() {
    fill(c);
    pushMatrix();
    translate(x,y,z);
    rect(0, 0, w, h);
    popMatrix();
  }
  
  void act() {
    x = x + vx;
    y = y + vy;  
  }
  
  boolean hasPerished() {
    return y > height || y < 0 || x > width || x < 0; 
  } 
  
}
