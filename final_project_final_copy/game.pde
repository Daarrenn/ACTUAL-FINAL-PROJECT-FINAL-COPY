void game() {
  background(0);
  MUSIC.play();
  
  textSize(30);
  textFont(airStrike);
  fill(250, 96, 96);
  text("score: "+scoreone, 120, 50);
  fill(96, 166, 250);
  text("score: "+scoretwo, width-120, 50);
  
  fill(255);
  //the stars omg so annoying I cant do this its too hard :(
  //WIAT LOWKEY I COOKED IDK HOW I FIGURED IT OUT
  //genuinely how omg
  //mr p i need you to read this
  //you need to understand how happy i am omg dopamine rush
  //also why does processing drain ur battery so fast on mac
  i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBricks(i);
    }
    i = i + 1;
  }
  
  //top spikes
  j = 0;
  while (j < m) {
    spiketop(a[j], 0);
    j = j + 1;
  }
  
  //bottom spikes
  k = 0;
  while(k < l) {
    spikebottom(b[k], 800);
    k = k + 1;
  }
  
  //birds(?)
  fill(250, 96, 96);
  circle(onex, oney, oned);
  fill(96, 166, 250);
  circle(twox, twoy, twod);
  fill(255);
  
  //bird pause
  onedie = onedie + 1;
  twodie = twodie + 1;
  
  //spike one
  rightoney = rightoney + spikespeedone;
  if(rightoney < 25 || rightoney > height-25) {
    spikespeedone = spikespeedone * -1;
  }
  spikeright(width, rightoney);
  //spike two
  righttwoy = righttwoy + spikespeedtwo;
  if(righttwoy < 25 || righttwoy > height-25) {
    spikespeedtwo = spikespeedtwo * -1;
  }
  spikeright(width, righttwoy);
  //spike three
  leftthreey = leftthreey + spikespeedthree;
  if(leftthreey < 25 || leftthreey > height-25) {
    spikespeedthree = spikespeedthree * -1;
  }
  spikeleft(0, leftthreey);
  //spike four
  leftfoury = leftfoury + spikespeedfour;
  if(leftfoury < 25 || leftfoury > height-25) {
    spikespeedfour = spikespeedfour * -1;
  }
  spikeleft(0, leftfoury);
 
  //spike collision
  onespikecollision(width-30, rightoney); //spike one one
  twospikecollision(width-30, rightoney); //spike one two
  onespikecollision(width-30, righttwoy); //spike two one
  twospikecollision(width-30, righttwoy); //spike two two
  onespikecollision(30, leftthreey); //spike three one
  twospikecollision(30, leftthreey); //spike three two
  onespikecollision(30, leftfoury); //spike four one
  twospikecollision(30, leftfoury); //spike four two
  
  
  
  
  
  //counting
  countdown = countdown - 1;
  fill(255);
  textSize(50);
  if (countdown < 181 && countdown > 120) {
    text("3", width/2, height/2);
  }
  if (countdown < 121 && countdown > 60) {
    text("2", width/2, height/2);
  }
  if (countdown < 61 && countdown > 0) {
    text("1", width/2, height/2);
  }
  
  if (countdown < 0) {
  //accerleration
  if(onedie > 180){
    grav = grav + 0.2;
  }
  if(twodie > 180){
    gravtwo = gravtwo + 0.2;
  }
  
  //move one
  if(onedie > 180){
  onex = onex + onevx;
  oney = oney + onevy + grav;
  }
  
  if(twodie > 180){
  //move two
  twox = twox + twovx;
  twoy = twoy + twovy + gravtwo;
  }
  }
  //side walls
  if(onex < oned/2 || onex > width-oned/2) {
    onevx = onevx * -1;
  }
  if(twox < twod/2 || twox > width-twod/2) {
    twovx = twovx * -1;
  }
  //top bottom walls
  if(oney < oned/2+20 || oney > height-oned/2-20) {
    onex = width/2;
    oney = height/2;
    onedie = 0;
    grav = 3;
    onevy = -7;
    FAILURE.rewind();
    FAILURE.play();
  }
  if(twoy < twod/2+20 || twoy > height-twod/2-20){
    twox = width/2;
    twoy = height/2;
    twodie = 0;
    gravtwo = 3;
    twovy = -7;
    FAILURE.rewind();
    FAILURE.play();
  }
  
  //end
  if(scoreone == 10 || scoretwo == 10){
    mode = GAMEOVER;
  }
}

void keyPressed(){
  if(mode == GAME) {
 if(key == 'w' ||key  == 'W') {
   onevy = -9;
   grav = 3;
 }
 if(keyCode == UP) {
   twovy = -9;
   gravtwo = 3;
}
  }
}

void gameClicks(){
   mode = PAUSE;
}
  

void spikeright(float x, float y) {
  pushMatrix();
  translate(x, y);
  fill(255);
  triangle(0, 25, 0, -25, -50, 0);
  popMatrix();
}

void spikeleft(float x, float y) {
  pushMatrix();
  translate(x, y);
  fill(255);
  triangle(0, 25, 0, -25, 50, 0);
  popMatrix();
}

void spiketop(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255);
  triangle(0, 0, 50, 0, 25, 25);
  popMatrix();
}

void spikebottom(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(255);
  triangle(0, 0, 50, 0, 25, -25);
  popMatrix();
}

void spike(float variable, float speed) {
    if(variable < 0 || variable > height) {
      speed = speed * -1;
  }
}

void onespikecollision(float side, float spike){
  if(dist(onex, oney, side, spike) < 50){////spike one ball two
    onex = width/2;
    oney = height/2;
    onedie = 0;
    grav = 3;
    onevy = -7;
    FAILURE.rewind();
    FAILURE.play();
  }
}

void twospikecollision(float side, float spike){
  if(dist(twox, twoy, side, spike) < 50){////spike one ball two
    twox = width/2;
    twoy = height/2;
    twodie = 0;
    gravtwo = 3;
    twovy = -7;
    FAILURE.rewind();
    FAILURE.play();
  }
}

void manageBricks(int i) {
  fill(255, 217, 0);
  image(star, x[i], y[i], 50, 50);
  if (dist(onex, oney, x[i], y[i]) <= oned/2 + 25) {
    alive[i] = false;
    alive[i + 1] = true;
    scoreone = scoreone + 1;
    SUCCESS.rewind();
    SUCCESS.play();
  }
  if (dist(twox, twoy, x[i], y[i]) <= twod/2 + 25) {
    alive[i] = false;
    alive[i + 1] = true;
    scoretwo = scoretwo + 1;
    SUCCESS.rewind();
    SUCCESS.play();
  }
}
