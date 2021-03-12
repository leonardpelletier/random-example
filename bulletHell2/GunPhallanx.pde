class GunPhallanx extends Gun {

  GunPhallanx() {
    super();
    threshold = 10;
  }

  void fire() {
    if (cooldown >= threshold) {
      for (int i = -45; i <= 45; i+=10) {
        engine.add(new Bullet(x+10, y, i, 20, true));
        engine.add(new Bullet(x-10, y, i, 20, true));
      }
      for (int i = 135; i <= 225; i+=10) {
        engine.add(new Bullet(x+10, y, i, 20, true));
        engine.add(new Bullet(x-10, y, i, 20, true));
      }
      cooldown = 0;
    }
  }

  void update(float _x, float _y) {
    cooldown++; 
    x = _x;
    y = _y;   
  }

}