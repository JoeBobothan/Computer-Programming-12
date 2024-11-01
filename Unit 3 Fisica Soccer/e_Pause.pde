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
