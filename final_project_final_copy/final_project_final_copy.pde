import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer FAILURE, MUSIC, SUCCESS;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

PImage star;

PFont airStrike;

float grav, gravtwo;

//keyyyyyyys
boolean wkey, upkey;

//starting game
int countdown = 180;

//birds(?)
float onex, oney, onevx, onevy, oned;
float twox, twoy, twovx, twovy, twod;

//bird alive


//spike speeds
float spikespeedone;//right down
float spikespeedtwo;//right
float spikespeedthree;//left down
float spikespeedfour;//left
//spike right
float rightoney;
float righttwoy;  
//spike left
float leftthreey;
float leftfoury;

//timing stuff :(
float onedie;
float twodie;

int countdownPause;
int countdownCount;

//score
int scoreone;
int scoretwo;
  
//array
boolean[] alive;
int n; //number of bricks
int i = 0; //while loop
float[] x;
float[] y;
float tempX;
float tempY;

//array for spikes on borders
int m; //number of spikes top
int l; //number of spikes bottom
int j; //while loop top
int k; //while loop bottom
int[] a;//x top
int[] b;//x bottom
int tempA;//top
int tempB;//bottom

void setup() {
  size(600, 800);
  mode = INTRO;
  textAlign(CENTER, CENTER);
  imageMode(CENTER);
  
  minim = new Minim(this);
  FAILURE = minim.loadFile("FAILURE.wav");
  MUSIC = minim.loadFile("MUSIC.mp3");
  SUCCESS = minim.loadFile("SUCCESS.wav");
  
  
  star = loadImage("star.png");
  
  airStrike = createFont("airstrike.ttf", 50);
  
  //score
  scoreone = 0;
  scoretwo = 0;
  
  //pause
  countdownPause = 0;
  countdownCount = 1;
  
  //gravity
  grav = -2;
  gravtwo = -2;
  
  //one
  onex = width/2;
  oney = height/2+100;
  onevx = 2;
  oned = 80;
  onedie = 200;

  
  //two
  twox = width/2;
  twoy = height/2-100;
  twovx = -2;
  twod = 80;
  twodie = 200;
  
  //spike
  rightoney = height/2;
  righttwoy = height/2;
  leftthreey = height/2;
  leftfoury = height/2;
  spikespeedone = 3;
  spikespeedtwo = -3;
  spikespeedthree = 3;
  spikespeedfour = -3;
  
  //star array?
  n=19;
  
  x = new float[n];
  y = new float[n];
  alive = new boolean[n];
  tempX = random(50, width-50);
  tempY = random(50, height-50);
  int i = 0;
  while(i < n) {
    x[i] = tempX;
    y[i] = tempY;
    alive[i] = false;
    i = i + 1;
    tempX = random(50, width-50);
    tempY = random(50, height-50);
    }
    alive[0] = true;
    
  //top spikes
  m = 12;
  
  a = new int[m];
  tempA = 0;
  int j = 0;
  while(j < m) {
    a[j] = tempA;
    j = j + 1;
    tempA = tempA + 50;
  }
  //bottom spikes
  l = 12;
  
  b = new int[l];
  tempB = 0;
  int k = 0;
  while(k < l) {
    b[k] = tempB;
    k = k + 1;
    tempB = tempB + 50;
  }
}





void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE){
    pause();
  } else if (mode == GAMEOVER){
    gameover();
  }
}
