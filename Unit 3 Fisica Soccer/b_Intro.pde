void intro() {
  background(123);
  fill(0);
  textSize(125);
  text("Fisica", width/2, height*2/5);
  text("Soccer", width/2, height*3/5);
}

void introClicks() {

  redScore = 0;
  blueScore = 0;
  leftControlling = 0;
  rightControlling = 0;
  mode = GAME;
}
