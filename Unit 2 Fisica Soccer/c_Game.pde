void game() {
  background(green);
  handlePlayerInput();
  world.step();
  leftPlayers[leftControlling].setFillColor(lerpColor(red, white, 0.25));
  rightPlayers[rightControlling].setFillColor(lerpColor(blue, white, 0.25));
  if (ballChangeCooldown > 0) ballChangeCooldown--;
  closest = 1000;
  for (int i = 0; i < 3; i++) {
    if (distToBall(leftPlayers[i]) < closest) {
      closest = distToBall(leftPlayers[i]);
      newPossessor = leftPlayers[i];
    }
    if (distToBall(rightPlayers[i]) < closest) {
      closest = distToBall(rightPlayers[i]);
      newPossessor = rightPlayers[i];
    }
  }
  if (ballChangeCooldown <= 0 && hasBall != newPossessor && closest < 75) {
    changePossession(newPossessor);
  }
  if (hasBall != null) {
    updateBallPositionWithPlayer();
  }
  world.draw();
  for (int i = 0; i < 3; i++) {
    leftPlayers[i].setFillColor(red);
    rightPlayers[i].setFillColor(blue);
    float left_x = leftPlayers[i].getX();
    float left_y = leftPlayers[i].getY();
    float right_x = rightPlayers[i].getX();
    float right_y = rightPlayers[i].getY();
    push();
    strokeWeight(3);
    translate(left_x, left_y);
    rotate(leftPlayers[i].getRotation());
    line(-playerD/3, 0, playerD/3, 0);
    line(playerD/3, 0, 0, -playerD/4);
    line(playerD/3, 0, 0, playerD/4);
    pop();
    push();
    strokeWeight(3);
    translate(right_x, right_y);
    rotate(rightPlayers[i].getRotation());
    line(-playerD/3, 0, playerD/3, 0);
    line(playerD/3, 0, 0, -playerD/4);
    line(playerD/3, 0, 0, playerD/4);
    pop();
    textSize(10);
  }

  // draws a star (or any shape really) on the play with the ball if it is in possession
  
  //if (hasBall != null) {
  //  push();
  //  stroke(lerpColor(yellow, black, 0.25), 50);
  //  fill(yellow, 50);
  //  translate(hasBall.getX(), hasBall.getY());
  //  rotate(hasBall.getRotation());
  //  PVector v = new PVector(1, 0);
  //  beginShape();
  //  for (int i = 0; i < 5; i++) {
  //    v.setMag(playerD/2);
  //    vertex(v.x, v.y);
  //    v.rotate(PI/5);
  //    v.setMag(10);
  //    vertex(v.x, v.y);
  //    v.rotate(PI/5);
  //  }
  //  endShape();
  //  pop();
  //}

  if (isTouching(ball, leftNet)) score(true);
  if (isTouching(ball, rightNet)) score(false);
  drawScore();
  
  // win criteria: 10 goals
  if (blueScore >= 10 || redScore >= 10) {
    if (blueScore > redScore) {
      blueWins = true;
    } else {
      blueWins = false;
    }
    mode = WIN;
  }

  //text(ballChangeCooldown, mouseX, mouseY - 30);
  //if (hasBall == null) text("Nobody has the Ball", mouseX, mouseY + 30);
}

void drawScore() {
  push();
  translate(width/2, 0);
  fill(255);
  rect(0, 0, 200, 100, 25);
  line(0, 0, 0, 50);
  textSize(25);
  fill(blue);
  text(blueScore, -50, 22);
  fill(red);
  text(redScore, 50, 22);
  pop();
}

void gameClicks() {
  mode = PAUSE;
}

float distToBall(FBody player) {
  float distance = dist(ball.getX(), ball.getY(), player.getX(), player.getY());
  return distance;
}

void updateBallPositionWithPlayer() {
  ball.setVelocity(0, 0);
  float direction = hasBall.getRotation();
  PVector forwards = new PVector(1, 0).rotate(direction).setMag((playerD+ballD)*0.6);
  ball.setPosition(hasBall.getX() + forwards.x, hasBall.getY() + forwards.y);
}

void changePossession(FBody newPossessor) {
  hasBall = newPossessor;
  ballChangeCooldown = 30;
}

void kickBall(float force) {
  if (hasBall != null) {
    ballChangeCooldown = 30;
    float direction = hasBall.getRotation();
    PVector forwards = new PVector(1, 0).rotate(direction).setMag(1000000*force);
    ball.setForce(forwards.x, forwards.y);
    hasBall = null;
  }
}

//float getFPolyWidth(FPoly poly) {
//  ArrayList<Vec2> vertices = poly.getVertices();
//  float minX = Float.MAX_VALUE;
//  float maxX = Float.MIN_VALUE;

//  for (Fisica.FVector vertex : vertices) {
//    if (vertex.x < minX) minX = vertex.x;
//    if (vertex.x > maxX) maxX = vertex.x;
//  }
  
//  return maxX - minX;
//}

//float getFPolyHeight(FPoly poly) {
//  ArrayList<Vec2> vertices = poly.getVertices();
//  float minY = Float.MAX_VALUE;
//  float maxY = Float.MIN_VALUE;

//  for (Fisica.FVector vertex : vertices) {
//    if (vertex.y < minY) minY = vertex.y;
//    if (vertex.y > maxY) maxY = vertex.y;
//  }
  
//  return maxY - minY;
//}
