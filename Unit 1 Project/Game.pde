void game() {
  background(100, 255, 100);
  stroke(0);
  strokeWeight(5);
  fill(255);
  if (draggingBall) {
    push();
    translate(ballX, ballY);
    rotate(atan2(mouseY - ballY, mouseX - ballX));
    noStroke();
    float d = dist(ballX, ballY, mouseX, mouseY);
    if (d > 150) d = 150;
    triangle(0, - 3 - ballD/2, 0, 3 + ballD/2, d, 0);
    pop();
  }
  ballX += ballV.x;
  ballY += ballV.y;
  ballV.mult(0.99);
  if (ballX < ballD/2) ballV.x = abs(ballV.x);
  if (ballX > width - ballD/2) ballV.x = -abs(ballV.x);
  if (ballY < ballD/2) ballV.y = abs(ballV.y);
  if (ballY > height - ballD/2) ballV.y = -abs(ballV.y);
  circle(ballX, ballY, ballD);

  fill(0);
  noStroke();

  for (int i = 0; i < walls.size(); i++) {
    Wall wall = walls.get(i);
    // Collision Detection for: Left, Right, Top, Bottom, 4 corners, clockwise from top left
    if (ballV.x > 0 && ballX < wall.Xpos && ballX > wall.Xpos - wall.Width/2 - ballD/2 && ballY > wall.Ypos - wall.Height/2 && ballY < wall.Ypos + wall.Height/2) {
      ballV.x = -abs(ballV.x);
      debugger = "Left";
    } else if (ballV.x < 0 && ballX < wall.Xpos + wall.Width/2 + ballD/2 && ballX > wall.Xpos && ballY > wall.Ypos - wall.Height/2 && ballY < wall.Ypos + wall.Height/2) {
      ballV.x = abs(ballV.x);
      debugger = "Right";
    } else if (ballV.y > 0 && ballX < wall.Xpos + wall.Width/2 && ballX > wall.Xpos - wall.Width/2 && ballY > wall.Ypos - wall.Height/2 - ballD/2 && ballY < wall.Ypos) {
      ballV.y = -abs(ballV.y);
      debugger = "Top";
    } else if (ballV.y < 0 && ballX < wall.Xpos + wall.Width/2 && ballX > wall.Xpos - wall.Width/2 && ballY > wall.Ypos && ballY < wall.Ypos + wall.Height/2 + ballD/2) {
      ballV.y = abs(ballV.y);
      debugger = "Bottom";
    } else if (ballV.x > 0 && ballV.y > 0 && dist(ballX, ballY, wall.Xpos - wall.Width/2, wall.Ypos - wall.Height/2) < ballD/2) {
      //ballV = cornerCollision(ballX, ballY, ballV, new PVector(1, -1));
      background(123);
      debugger = "Top Left";
    } else if (ballV.x < 0 && ballV.y > 0 && dist(ballX, ballY, wall.Xpos + wall.Width/2, wall.Ypos - wall.Height/2) < ballD/2) {
      background(123);
      debugger = "Top Right";
    } else if (ballV.x < 0 && ballV.y < 0 && dist(ballX, ballY, wall.Xpos + wall.Width/2, wall.Ypos + wall.Height/2) < ballD/2) {
      background(123);
      debugger = "Bottom Right";
    } else if (ballV.x > 0 && ballV.y < 0 && dist(ballX, ballY, wall.Xpos - wall.Width/2, wall.Ypos + wall.Height/2) < ballD/2) {
      background(123);
      debugger = "Bottom Left";
    }
  }
  fill(0);
  text(debugger, width/2, 850);
  /*

   function for corner bouncing calculation
   returns ONE value
   inputs ball coords
   
   pvector (0, 1)
   v.rotate(deg)
   v.setmag(5)
   
   also, 2 cirlces bouncing off each other would bounce using the tangent line as a flat surface
   */
  for (int i = 0; i < walls.size(); i++) {
    Wall wall = walls.get(i);
    wall.show();
  }
}

PVector cornerCollision(float x, float y, PVector ballVec, PVector corner) {
  return new PVector(x, y);
}

void gameClicks() {
}

void nextMap() {
  walls.clear();
  map++;
  if (map == M0) {
  } else if (map == M1) {
    walls.add(new Wall(width/2, height/2, 50, 450));
  } else if (map == M2) {
    walls.add(new Wall(200, height/3, 400, 50));
    walls.add(new Wall(width - 200, height*2/3, 400, 50));
  } else if (map == M3) {
  } else if (map == M4) {
  } else if (map == M5) {
  } else if (map == M6) {
  } else if (map == M7) {
  } else if (map == M8) {
  } else if (map == M9) {
  } else {
    map = M0;
  }
}
