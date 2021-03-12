class Star extends GameObject {

  Star() {
    x = random(0, width);
    y = 0;
    z = 0;
    vx = 0;
    vy = random(2,5);
    w = vy;
    h = vy;
    c = 255;
  }
}

