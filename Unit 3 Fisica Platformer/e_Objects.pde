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

boolean bottomSensor(String f) {
  FBox s = player.sensors.get(1);
  ArrayList<FContact> contactList = s.getContacts(); // Get list of contacts of player
  for (FContact c : contactList) { // For every FContact, name it c and run
    FBody b = c.getBody1(); // Get the FBody from the contact
    if (f.equals("floor")) {
      if ("ground".equals(b.getName()) || "ice".equals(b.getName()) || "treetop".equals(b.getName()) || "trampoline".equals(b.getName())) {
        return true;
      }
    } else {
      if (f.equals(b.getName())) return true;
    }
  }
  return false;
}


boolean isTouchingLeftWall() {
  FBox s = player.sensors.get(2);
  ArrayList<FContact> contactList = s.getContacts(); // Get list of contacts of player
  for (FContact c : contactList) { // For every FContact, name it c and run
    FBody b = c.getBody1(); // Get the FBody from the contact
    if ("ground".equals(b.getName())) {
      return true;
    }
  }
  return false;
}

boolean isTouchingRightWall() {
  FBox s = player.sensors.get(3);
  ArrayList<FContact> contactList = s.getContacts(); // Get list of contacts of player
  for (FContact c : contactList) { // For every FContact, name it c and run
    FBody b = c.getBody1(); // Get the FBody from the contact
    if ("ground".equals(b.getName())) {
      return true;
    }
  }
  return false;
}
