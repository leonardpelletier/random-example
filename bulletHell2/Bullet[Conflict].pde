class Bullet extends GameObject {

  boolean good, alive;
  float angle;

  Bullet(float x, float y, float angle, float speed, boolean g) {
    good = g;
    alive = true;
    this.x = x;
    this.y = y;
    w = 40;
    h = 20;
  
    this.angle = map (angle, 0, 360, 0, TWO_PI);
    vx = cos(this.angle)*speed;
    vy = -sin(this.angle)*speed;
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    rotate(-this.angle);
    angle = angle + TWO_PI*0.05;
    if (good) 
    image(laserblue, 0, 0, w, h);  
    else 
      image(laserred, 0, 0, w, h);
    
    popMatrix();
  }


  boolean hasPerished() {
    return !alive || super.hasPerished();
  }
}

