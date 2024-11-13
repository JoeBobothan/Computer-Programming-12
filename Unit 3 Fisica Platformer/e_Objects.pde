void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == WIN) {
    winClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  }
}

void makePlayers() {
  leftPlayer = new FPlayer(0);
  world.add(leftPlayer);
  //rightPlayer = new FPlayer(1);
  //world.add(rightPlayer);
}

boolean isTouching(FBody object, FBody contact) {
  ArrayList<FContact> contactList = object.getContacts();
  for (FContact c : contactList) if (c.contains(contact)) return true;
  return false;
}

PVector getVelocity(FBody body) {
  float vx = body.getVelocityX();
  float vy = body.getVelocityY();
  return new PVector(vx, vy);
}

boolean isOnGround(FBody player) {
  ArrayList<FContact> contactList = player.getContacts(); // Get list of contacts of player
  for (FContact c : contactList) { // For every FContact, name it c and run
    FBody b = c.getBody1(); // Get the FBody from the contact
    if (b.getName() != null && b.getName().equals("ground")) {
      float normalY = c.getNormalY();  // Get the Y component of the normal vector
      if (normalY < -0.5) {
        float contactY = c.getY();  // Get the Y coordinate of the contact point
        float playerTop = player.getY() - gridSize / 2;  // Top of the player
        float playerBottom = player.getY() + gridSize / 2;  // Bottom of the player
        if (contactY >= playerTop  - tolerance && contactY <= playerBottom + tolerance) {
          return true;
        }
      }
    }
  }
  return false;
}

boolean isTouchingLeftWall(FBody player) {
  ArrayList<FContact> contactList = player.getContacts(); // Get list of contacts of player
  for (FContact c : contactList) { // For every FContact, name it c and run
    FBody b = c.getBody1(); // Get the FBody from the contact
    if (b.getName() != null && b.getName().equals("ground")) {
      float normalX = c.getNormalX(); // Get the X component of the normal vector
      if (normalX > 0.5) {
        float contactX = c.getX();  // Get the X coordinate of the contact point
        float playerLeft = player.getX() - gridSize / 2;  // Left side of the player
        float playerRight = player.getX() + gridSize / 2;  // Right side of the player
        if (contactX >= playerLeft - tolerance && contactX <= playerRight + tolerance) {
          return true;
        }
      }
    }
  }
  return false;
}

boolean isTouchingRightWall(FBody player) {
  ArrayList<FContact> contactList = player.getContacts(); // Get list of contacts of player
  for (FContact c : contactList) { // For every FContact, name it c and run
    FBody b = c.getBody1(); // Get the FBody from the contact
    if (b.getName() != null && b.getName().equals("ground")) {
      float normalX = c.getNormalX(); // Get the X component of the normal vector
      if (normalX < -0.5) {
        float contactX = c.getX();  // Get the X coordinate of the contact point
        float playerLeft = player.getX() - gridSize / 2;  // Left side of the player
        float playerRight = player.getX() + gridSize / 2;  // Right side of the player
        if (contactX >= playerLeft - tolerance && contactX <= playerRight + tolerance) {
          return true;
        }
      }
    }
  }
  return false;
}

boolean checkForGround(FBody player) {
  int gridX = int(map(player.getX(), 0, 1024, 0, 8));
  int gridY = int(map(player.getY(), 0, 1024, 0, 8));

  for (int _x = -1; _x <= 1; _x++) {
    for (int _y = -1; _y <= 1; _y++) {
      int checkX = gridX + _x;
      int checkY = gridY + _y;
      if (checkX >= 0 && checkX < 8 && checkY >= 0 && checkY < 8) {
        for (FBox b : gridTiles[checkX][checkY]) {
          //b.setFillColor(green);
          if (dist(player.getX(), player.getY(), b.getX(), b.getY()) < gridSize*1.5) ;//return true;
        }
      }
    }
  }
  return false;
}
