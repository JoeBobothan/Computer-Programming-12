void win() {
  if (!enterWinMode) {
    if (blueWins) background(blue);
    else background(red);

    stroke(0);
    strokeWeight(5);
    fill(255);
    rect(width/2, height/2, width-200, height-200);
    fill(100, 255, 100);
    rect(width/2, height/2, width-250, height-250);
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
