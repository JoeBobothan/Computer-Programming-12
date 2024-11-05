void win() {
  push();
  if (!enterWinMode) {
    //run code once, upon entering Win Mode
  }
  pop();
}

void winClicks() {
  mode = INTRO;
  enterWinMode = false;
}
