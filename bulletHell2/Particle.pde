class Particle extends GameObject {

  int life, maxLife;

  Particle(float _x, float _y, boolean good) {
    x = _x;
    y = _y;
    z = 1;
    w = random(5, 12);
    h = random(5, 12);
    vx = random(-5, 5);
    vy = random(-5, 5);
    maxLife = life = (int)random(10, 50);
    if (good) 
      c = orange;
    else 
      c = blue;
  }   

  void show() {
    noStroke();
    int alpha = (int)map(life, 0, maxLife, 0, 255);
    c = color(c, alpha);
    super.show();
    life--;
  }

  boolean hasPerished() {
    return life <= 0;
  }
}

