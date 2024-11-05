void intro() {
  background(123);
  fill(0);
  textSize(125);
  text("Fisica", width/2, height*2/5);
  text("Platformer", width/2, height*3/5);
}

void introClicks() {
  mode = GAME;
}

void pause() {
  if (!enterPauseMode) {
    fill(0, 128);
    rect(width/2, height/2, width, height);
    textSize(250);
    fill(255);
    text("Paused", width/2, height/2);
    enterPauseMode = true;
  }
}

void pauseClicks() {
  mode = GAME;
  enterPauseMode = false;
}

void freeze() {
  if (freeze > 0) freeze--;
  else mode = GAME;
}
