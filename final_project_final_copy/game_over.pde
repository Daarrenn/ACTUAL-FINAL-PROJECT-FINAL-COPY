void gameover() {
  MUSIC.rewind();
  background(0);
  fill(255);
  textSize(100);
  if(scoreone == 10){
    text("RED WINS!", width/2, 200);
  }
  if(scoretwo == 10){
    text("BLUE WINS!", width/2, 200);
  }
  
  rect(175, 550, 250, 150);
  textSize(60);
  fill(0);
  text("play", width/2, 600);
  text("again", width/2, 650);
}

void gameoverClicks() {
  if(mouseX > 175 && mouseX < 425 && mouseY > 550 && mouseY < 700){
  mode = INTRO;
  
  //score
  scoreone = 0;
  scoretwo = 0;
  
  countdownPause = 0;
  countdownCount = 1;
  
  //gravity
  grav = -2;
  gravtwo = -2;
  
  //one
  onex = width/2;
  oney = height/2+100;
  onevx = 2;
  onevy = -3;
  oned = 80;
  onedie = 200;

  
  //two
  twox = width/2;
  twoy = height/2-100;
  twovx = -2;
  twovy = -3;
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
  
  //star
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
}
