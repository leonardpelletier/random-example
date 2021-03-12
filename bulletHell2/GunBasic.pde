class GunBasic extends Gun {

  GunBasic() {
    super();
  }

  void fire() {
    if (cooldown >= threshold) {
      engine.add(new Bullet(starfighter.x, starfighter.y, 90, 10, true));
      cooldown = 0;
    }
  }
  
  void update(float _x, float _y) {
    cooldown++; 
    x = _x;
    y = _y;   
  }

}

