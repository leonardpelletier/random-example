class GameEngine {

  ArrayList<GameObject> objects;

  GameEngine() {
    objects = new ArrayList<GameObject>();
  }

  void update() {
    int i = objects.size()-1;
    while (  i >= 0 ) {
      GameObject obj = objects.get(i);
      obj.show();
      obj.act();
      if (obj instanceof Bullet) {
        checkCollisions((Bullet)obj);
      }

      i = i - 1;
    }
  }

  void add(GameObject obj) {
    objects.add(obj);
  }

  int size() {
    return objects.size();
  }

  void checkCollisions(Bullet bullet) {
    if (bullet.good) {
      for (int i = objects.size()-1; i >= 0; i--) {
        if (objects.get(i) instanceof Enemy) {
          ((Enemy)objects.get(i)).checkCollisions(bullet);
        }
      }
    } else {
      starfighter.checkCollisions(bullet);
    }
  }
}