class StarFighter extends GameObject {

  Gun gun;
  int costume;

  StarFighter() {
    x = width/2;
    y = height * 0.75;
    z = 1;
    w = 20;
    h = 20;
    vx = 0;
    vy = 0;
    c = blue;
    gun = new GunDeathBlossom();
    costume = 5;
  }

  void show() {
    fill(c);
    pushMatrix();
    translate(x,y,z);
    noTint();
    image(starfighterPics[costume], 0, 0);
    popMatrix(); 
    
  }

  void act() {
    super.act();

    vx = vx * 0.95;
    vy = vy * 0.95;

    if (x > width)  x = width; 
    if (y > height) y = height; 
    if (x < 0)      x = 0;
    if (y < 0)      y = 0;

    handleInput();
    gun.update(x, y);
  }

  void handleInput() {
    if (kbd.holdingLeft) {
      vx = vx - 1;
      vx = max(vx, -5);
      if (costume > 0) 
        costume--;
    }        
    if (kbd.holdingRight) {
      vx = vx + 1;
      vx = min(vx, 5);
      if (costume < 10) 
         costume++;
    }
    if (kbd.holdingUp) {
      vy = vy - 1; 
      vy = max(vy, -5);
    }
    if (kbd.holdingDown) {
      vy = vy + 1;   
      vy = min(vy, 5);
    }
    if (kbd.holdingSpace) {
      gun.fire();
    }
    if (!kbd.holdingLeft && !kbd.holdingRight) {
      if (costume > 5) 
        costume--;
      else if (costume < 5)
        costume++;
    }
  }

  void checkCollisions(Bullet b) {
    if (b.good == false && rectRect(b.x, b.y, b.w, b.h, x, y, w, h)) {
      b.alive = false;

      for (int i = 0; i < 100; i++) {
        engine.add(new Particle(b.x, b.y, true));
      }
    }
  }
}

