void intro() {
  MUSIC.rewind();
  background(0);
  fill(255);
  textFont(airStrike);
  textSize(100);
  text("STAR", width/2, 100);
  text("COLLECTOR", width/2, 200);
  
  rect(175, 550, 250, 150);
  textSize(70);
  fill(0);
  text("start", width/2, 625);
}

void introClicks(){
  if(mouseX > 175 && mouseX < 425 && mouseY > 550 && mouseY < 700){
    mode = GAME;
  }
}
