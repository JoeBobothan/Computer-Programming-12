void game() {
  background(255, 50, 50);
  stroke(0);
  strokeWeight(5);
  fill(255);
  if (draggingBall) {
    push();
    translate(ballX, ballY);
    rotate(atan2(mouseY - ballY, mouseX - ballX));
    noStroke();
    triangle(0, - 3 - ballD/2, 0, 3 + ballD/2, dist(ballX, ballY, mouseX, mouseY), 0);
    pop();
  }
  circle(ballX, ballY, ballD);


  for (int i = 0; i < walls.size(); i++) {
    Wall wall = walls.get(i);
    //wall.___();
  }
}

void gameClicks() {
}
