void win() {
  if (!enterWinMode) {
    if (blueWins) background(blue);
    else background(red);
    enterWinMode = true;

    noStroke();
    if (blueWins) fill(blue, 150);
    else fill(red, 150);
    rect(width/2, height/2, width, height);
    
    fill(0);
    textSize(150);
    if (blueWins) text("BLUE", width/2, height*2/5);
    else text("RED", width/2, height*2/5);
    text("WINS!", width/2, height*3/5);
  }
}

void winClicks() {
  mode = INTRO;
}
