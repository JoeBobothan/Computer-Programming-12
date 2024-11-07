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
        if (contactY >= playerTop && contactY <= playerBottom) {
          return true;
        }
      }
    }
  }
  return false;
}

boolean isTouchingLeftWall(FBody player) {
  ArrayList<FContact> contactList = player.getContacts(); // Get list of contacts of player
  float tolerance = 1; // For some reason player is always 1 pixel away from the wall
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
  float tolerance = 1; // For some reason player is always 1 pixel away from the wall
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
