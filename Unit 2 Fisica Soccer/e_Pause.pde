void pause() {
  if (!enterPauseMode) {
    fill(0, 128);
    rect(width/2, height/2, width, height);
    enterPauseMode = true;
  }
}

void pauseClicks() {
  mode = GAME;
  enterPauseMode = false;
}
