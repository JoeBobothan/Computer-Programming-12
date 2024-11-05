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
  rightPlayer = new FPlayer(1);
  world.add(rightPlayer);
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
  ArrayList<FContact> contactList = player.getContacts(); //get list of contacts of player
  for (FContact c : contactList) { // for every FContact, name it c and run
    FBody b = c.getBody1(); // turn FContact into a usable FBody
    // if FBody b's name is not null, and its name is "ground", return true
    if (b.getName() != null && b.getName().equals("ground")) return true;
  }
  return false;
}
