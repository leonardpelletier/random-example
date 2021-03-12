//Imports
import ddf.minim.*;

//Palette
color dark   = #000000;
color orange = #F23A08;
color blue   = #4DFFFB;
color yellow = #FFCD72;
color brown  = #813714;

//Constants
final int LOADING  = 0;
final int INTRO    = 1;
final int PLAYING  = 2;
final int GAMEOVER = 3;

//Assets
PImage introscreen;
PImage enemyPic;
PImage enemyPic2;
PImage enemyPic3;
PImage laserred;
PImage laserblue;
PImage overlay;

PImage[] starfighterPics;
PFont font;

Minim minim;
AudioPlayer introSong;
AudioPlayer gameSong;
AudioPlayer laserBlast;
AudioMetaData meta;

//Global Variables
int gamestate;

//Global Objects
GameEngine engine; 

StarFighter starfighter;

boolean holdingUp, holdingDown, holdingRight, holdingLeft, holdingSpace;


void setup() {
  holdingUp=holdingDown=holdingRight=holdingLeft=holdingSpace=false;
  rectMode(CENTER);
  imageMode(CENTER);
  frameRate(40);
  noStroke();

  //New objects!

  engine = new GameEngine();
  starfighter = new StarFighter();
  engine.add(starfighter);
  minim = new Minim(this);

  gamestate = INTRO;

  //load images
  starfighterPics = new PImage[11];
  for (int i = 0; i < starfighterPics.length; i++) {
    starfighterPics[i] = loadImage("images/fighter_" + i + ".gif");
  }
  introscreen = loadImage("images/spacebattle.jpg");
  enemyPic = loadImage("images/enemy1.png");
  enemyPic2 = loadImage("images/enemy2.png");
  enemyPic3 = loadImage("images/cruiser.png");
  laserred = loadImage("images/laserred.png");
  laserblue = loadImage("images/laserblue.png");
  overlay = loadImage("images/overlay.png");
  font = loadFont("data/SpaceRanger-100.vlw");

  //load music & sounds
  introSong = minim.loadFile("sounds/moonlight.mp3");
  gameSong = minim.loadFile("sounds/spacebattles.mp3");
  laserBlast = minim.loadFile("sounds/pew.mp3");

  size(displayWidth, displayHeight, P3D);  
  background(0);
  lights();
}

void draw() {
  if (gamestate == INTRO) 
    drawIntroScreen();
  else if (gamestate == PLAYING)
    drawGame();
  else if (gamestate == GAMEOVER) 
    drawEndScreen();
  else {
    println("YOU DONE GOOFED");
  }
}

void drawLoadingScreen() {
}

void drawIntroScreen() {
  introSong.play();

  fill(orange);
  textFont(font);
  
  tint(255, 0, 0, 10);
  image(introscreen, width/2, height/2, width, height);
  text("STARMAGEDDON", 100, height/2-300);

  if (mousePressed) {
    introSong.pause();
    gamestate = PLAYING;
  }
}

void drawGame() {

  gameSong.play();
  fill(0, 80);
  rect(width/2, height/2, width, height);
  engine.update();
  makeObjects();
  //image(overlay, width/2, height/2, width, height);
}

void makeObjects() {
  engine.add(new Star());
  if (frameCount % 30 == 0) {
    engine.add(new Enemy(random(260, 280), 5));
  }  
  if (frameCount % 100 == 0) {
    engine.add(new FastEnemy(random(45, 135), 8));
  }
  if (frameCount % 200 == 0) {
    engine.add(new EnemyCruiser(random(260, 280), 1));
  }
}

void drawEndScreen() {
}

void pressKey(int key) {

  if (key == UP) {
    holdingUp = true;
  }
  if (key == DOWN) {
    holdingDown = true;
  }
  if (key == LEFT) {
    holdingLeft = true;
  }
  if (key == RIGHT) {
    holdingRight = true;
  }
  if (key ==  ' ') {
    holdingSpace = true;
  }
}
void releaseKey(int key) {
  if (key == UP) {
    holdingUp = false;
  }
  if (key == DOWN) {
    holdingDown = false;
  }
  if (key == LEFT) {
    holdingLeft = false;
  }
  if (key == RIGHT) {
    holdingRight = false;
  }
  if (key == ' ') {
    holdingSpace = false;
  }
}


void keyPressed(KeyEvent evt) {
  pressKey(evt.getKeyCode());
}

void keyReleased(KeyEvent evt) {
  releaseKey(evt.getKeyCode());
}