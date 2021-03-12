class GunTwinMachineGun extends Gun {

  int cooldown;
  int threshold;

  GunTwinMachineGun() {
    cooldown = 0;
    threshold = 10;
  }

  void fire() {
    if (cooldown >= threshold) {
      engine.add(new Bullet(x-50, y, 90, 20, true));
      engine.add(new Bullet(x+50, y, 90, 20, true));
      cooldown = 0;
    }
  }

  void update(float _x, float _y) {
    cooldown++; 
    x = _x;
    y = _y;
  }
}