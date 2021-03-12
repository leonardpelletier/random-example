class GunMachineGun extends Gun {

  int cooldown;
  int threshold;

  GunMachineGun() {
    cooldown = 0;
    threshold = 10;
  }

  void fire() {
    if (cooldown >= threshold) {
      engine.add(new Bullet(x, y, 90, 20, true));
      cooldown = 0;
    }
  }
  
    void update(float _x, float _y) {
    cooldown++; 
    x = _x;
    y = _y;   
  }
}

