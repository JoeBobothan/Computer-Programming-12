void game() {
  if (blueTurn) background(blue);
  else background(red);
  stroke(0);
  strokeWeight(5);
  fill(255);
  rect(width/2, height/2, width-200, height-200);
  fill(100, 255, 100);
  rect(width/2, height/2, width-250, height-250);

  fill(0);
  circle(width/2, height-800, ballD*1.25);

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

  if (draggingBall) {
    push();
    translate(ballX, ballY);
    rotate(atan2(mouseY - ballY, mouseX - ballX));
    noStroke();
    float d = dist(ballX, ballY, mouseX, mouseY);
    if (d > 100) d = 100;
    triangle(0, - 3 - ballD/2, 0, 3 + ballD/2, d, 0);
    pop();
  }
  ballX += ballV.x;
  ballY += ballV.y;
  ballV.mult(0.99);
  if (ballX < ballD/2 + 125) ballV.x = abs(ballV.x);
  if (ballX > width - ballD/2 - 125) ballV.x = -abs(ballV.x);
  if (ballY < ballD/2 + 125) ballV.y = abs(ballV.y);
  if (ballY > height - ballD/2 - 125) ballV.y = -abs(ballV.y);
  fill(255);
  circle(ballX, ballY, ballD);

  if (dist(ballX, ballY, width/2, height-800) < ballD*0.6 && dist(ballX, ballY, width/2, height-800) > 5) {
    float d = map(dist(ballX, ballY, width/2, height-800), 0, ballD, 10, 0);
    noFill();
    strokeWeight(d);
    circle(ballX, ballY, ballD-d+5);
    ballV.mult(0.5);
    fall = new PVector(width/2-ballX, height-800-ballY);
    fall.setMag(3);
    ballX += fall.x;
    ballY += fall.y;
  }

  if (dist(ballX, ballY, width/2, height-800) <= 5) {
    float d = map(dist(ballX, ballY, width/2, height-800), 0, ballD, 10, 0);
    noFill();
    strokeWeight(d);
    circle(ballX, ballY, ballD-d+5);
    ballX = width/2;
    ballY = height-800;
  }


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
    } else if (/*ballV.x > 0 && ballV.y > 0 && */dist(ballX, ballY, wall.Xpos - wall.Width/2, wall.Ypos - wall.Height/2) < ballD/2) {
      ballV = cornerCollision(new PVector(1, -1), wall.Xpos - wall.Width/2, wall.Ypos - wall.Height/2);
      debugger = "Top Left";
    } else if (/*ballV.x < 0 && ballV.y > 0 && */dist(ballX, ballY, wall.Xpos + wall.Width/2, wall.Ypos - wall.Height/2) < ballD/2) {
      ballV = cornerCollision(new PVector(1, 1), wall.Xpos + wall.Width/2, wall.Ypos - wall.Height/2);
      debugger = "Top Right";
    } else if (/*ballV.x < 0 && ballV.y < 0 && */dist(ballX, ballY, wall.Xpos + wall.Width/2, wall.Ypos + wall.Height/2) < ballD/2) {
      ballV = cornerCollision(new PVector(-1, 1), wall.Xpos + wall.Width/2, wall.Ypos + wall.Height/2);
      debugger = "Bottom Right";
    } else if (/*ballV.x > 0 && ballV.y < 0 && */dist(ballX, ballY, wall.Xpos - wall.Width/2, wall.Ypos + wall.Height/2) < ballD/2) {
      ballV = cornerCollision(new PVector(-1, -1), wall.Xpos - wall.Width/2, wall.Ypos + wall.Height/2);
      debugger = "Bottom Left";
    }
  }
  if (hints) {
    fill(0);
    text(debugger, width/2, 850);
  }

  //2 cirlces bouncing off each other would bounce using the tangent line as a flat surface

  for (int i = 0; i < walls.size(); i++) {
    Wall wall = walls.get(i);
    wall.show();
  }

  if ((shotBall && ballV.mag() < 0.25) || dist(ballX, ballY, width/2, height-800) < 10) {
    ballV.setMag(0);
    switchTimer--;
    if (switchTimer <= 0) {
      if (dist(ballX, ballY, width/2, height-800) < 10) {
        if (blueTurn) blueScore++;
        else redScore++;
      }
      turnReset();
      shotBall = false;
      blueTurn = !blueTurn;
      if (blueTurn) {
        if ((blueScore != redScore) && (blueScore >= 10 || redScore >= 10)) {
          if (blueScore > redScore) {
            blueWins = true;
          } else {
            blueWins = false;
          }
          mode = WIN;
        }
        nextMap();
      }
    }
  }

  if (hints) {
    noStroke();
    if (map == 9) {
      fill(255, 0, 0);
      // Map 9 Winnable places
      //square(278, 875, 2);// bottom right pixel only
      set(278, 875, color(255, 0, 0));//  the pixel 1 down works on map 5
      square(550, 875, 2);
      square(200, 875, 2);
      square(448, 875, 2);
      square(448, 900, 2);
      square(420, 900, 2);
      square(405, 900, 2);
      square(428, 678, 2);
    }

    if (map == 5) {
      fill(0, 255, 0);
      square(500, 900, 2);
      square(243, 875, 2);
      set(278, 876, color(0, 255, 0));//  the pixel 1 down works on map 5
    }
  }
}

PVector cornerCollision(PVector corner, float cornerX, float cornerY) {
  //PVector ballVec = new PVector(cornerX - ballX, cornerY - ballY);
  PVector ballVec = ballV;
  float reflect = degrees(PVector.angleBetween(ballVec, corner));
  //debugger = str(reflect) + " , " + str(ballVec.x) + " , " + str(ballVec.y) + " , " + str(corner.x) + " , " + str(corner.y);
  corner.rotate(radians(-reflect));
  corner.setMag(ballV.mag());
  return corner;
}

void gameClicks() {
  if (draggingBall) {
    draggingBall = false;
    shotBall = true;
    PVector ballVec = new PVector((ballX - mouseX), (ballY - mouseY));
    ballVec.limit(100);
    ballV = new PVector(ballVec.x/5, ballVec.y/5);
  }
}

void nextMap() {
  walls.clear();
  map++;
  if (map == M0) {
  } else if (map == M1) {
    walls.add(new Wall(width/2, height/2, 40, 450));
  } else if (map == M2) {
    walls.add(new Wall(300, height/2, 350, 40));
  } else if (map == M3) {
    walls.add(new Wall(500, height/3, 250, 40));
    walls.add(new Wall(250, height*2/3, 250, 40));
  } else if (map == M4) {
    walls.add(new Wall(340, 420, 60, 40)); // + 20
    walls.add(new Wall(410, 580, 60, 40));
    walls.add(new Wall(290, height/2, 40, 200));
    walls.add(new Wall(460, height/2, 40, 200));
    
    walls.add(new Wall(155, height/2, 60, 40));
    walls.add(new Wall(595, height/2, 60, 40));
  } else if (map == M5) {
    walls.add(new Wall(350, 400, 350, 40));
    walls.add(new Wall(350, 600, 350, 40));
    walls.add(new Wall(300, height/2, 350, 40));
  } else if (map == M6) {
    walls.add(new Wall(275, 350, 300, 40));
    walls.add(new Wall(575, 350, 100, 40));
    walls.add(new Wall(475, 650, 300, 40));
    walls.add(new Wall(175, 650, 100, 40));
  } else if (map == M7) {
    walls.add(new Wall(250, height/2, 40, 600));
    walls.add(new Wall(500, height/2, 40, 600));
    walls.add(new Wall(width/2, 300, 40, 40));
    walls.add(new Wall(width/2, height/2, 40, 40));
    walls.add(new Wall(width/2, 700, 40, 40));
  } else if (map == M8) {
    walls.add(new Wall(250, 700, 40, 150));
    walls.add(new Wall(500, 700, 40, 150));
    walls.add(new Wall(width/2, 400, 300, 40));
  } else if (map == M9) {
    walls.add(new Wall(320, 320, 100, 40));
    walls.add(new Wall(430, 680, 100, 40));
    walls.add(new Wall(200, height/2, 40, 400));
    walls.add(new Wall(550, height/2, 40, 400));
  } else {
    map = M0;
  }
}
