class FastEnemy extends Enemy {

  FastEnemy(float angle, float speed) {
    super(angle, speed);
    y = height;
    vy = -5;
    w = 20;
    h = 50;
    threshold = 10;
    hp = 5;
  }
  
  void show() {
    fill(c);
    pushMatrix();
    translate(x, y, z);
    rotate(-angle);
    noTint();
    image(enemyPic2, 0, 0);
    popMatrix();
  }

  void act() {
    x = x + vx;
    y = y + vy;
    cooldown++;
    if (cooldown >= threshold) {
      float bearing = -atan2(starfighter.y - y, starfighter.x - x);
      bearing = map (bearing, 0, TWO_PI, 0, 360);
      engine.add(new Bullet(x, y, bearing, 10, false));
      cooldown = 0;
    }
  }
}

