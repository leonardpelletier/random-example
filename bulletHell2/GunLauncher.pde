class GunLauncher extends Gun {

  GunLauncher() {
    super(); 
    threshold = 30;
  }

  void fire() {
    if (cooldown >= threshold) {
      for (int i = 0; i < 360; i+=random(5,10)) {
        engine.add(new Fighter(x, y, i, 5, true));
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

