void intro() {
  background(blue);
  stroke(0);
  strokeWeight(5);
  fill(255);
  rect(width/2, height/2, width-200, height-200);
  fill(100, 255, 100);
  rect(width/2, height/2, width-250, height-250);

  fill(0);
  textSize(150);
  text("MINI", width/2, height*2/5);
  text("GOLF", width/2, height*3/5);
}

void introClicks() {
  mode = GAME;
}
