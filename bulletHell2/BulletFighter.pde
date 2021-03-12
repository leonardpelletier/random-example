class Fighter extends Bullet {

  Gun gun;

  Fighter(float x, float y, float angle, float speed, boolean g) {
    super(x, y, angle, speed, g);
    gun = new GunTwinMachineGun();
  }

  void act() {
    super.act();
    gun.update(x,y);
    gun.fire();
  }

  void show() {
    pushMatrix();
    translate(x, y, z);
    rotate(-this.angle);
    image(starfighterPics[5], 0, 0, w, h);  
    popMatrix();
  }
}