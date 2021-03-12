class Enemy extends GameObject {

  boolean alive;
  float angle;
  int cooldown;
  int threshold;
  int hp;

  Enemy(float angle, float speed) {
    alive = true;
    x = random(width);
    y = 0;
    z = 1;
    w = 40;
    h = 20;
    this.angle = map (angle, 0, 360, 0, TWO_PI);
    vx = cos(this.angle)*speed;
    vy = -sin(this.angle)*speed; 
    c = orange;
    threshold = 40;
    cooldown = 0;
    hp = 1;
  }
  
  Enemy(float _x, float _y, float angle, float speed) {
    alive = true;
    x = _x;
    y = _y;
    z = 1;
    w = 40;
    h = 20;
    this.angle = map (angle, 0, 360, 0, TWO_PI);
    vx = cos(this.angle)*speed;
    vy = -sin(this.angle)*speed; 
    c = orange;
    threshold = 40;
    cooldown = 0;
    hp = 2;
  }

  void show() {
    fill(c);
    pushMatrix();
    translate(x, y, z);
    rotate(-angle);
    noTint();
    image(enemyPic, 0, 0);
    popMatrix();
  }

  void act() {
    cooldown++;
    super.act();
    if (cooldown >= threshold) {
      float theta = map(angle, 0, TWO_PI, 0, 360);
      engine.add(new Bullet(x, y, theta, 10, false));
      cooldown = 0;
    }
  }

  boolean hasPerished() {
    if (!alive) return true;
    return super.hasPerished();
  }

  void checkCollisions(Bullet b) {
    if (b.good && rectRect(b.x, b.y, b.w, b.h, x, y, w, h)) {
      b.alive = false;
      hp = hp - 1;
      for (int i = 0; i < 100; i++) {
        engine.add(new Particle(b.x, b.y, false));
      }
      if (hp <= 0) {
       alive = false; 
      }
    }
  }
}

