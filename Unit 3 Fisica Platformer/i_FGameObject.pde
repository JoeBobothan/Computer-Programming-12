class FGameObject extends FBox {
  FGameObject() {
    super(gridSize, gridSize);
  }
  void act() {
  }
  boolean isTouching(String f) {
    ArrayList<FContact> contactList = getContacts(); // Get list of contacts of player
    for (FContact c : contactList) { // For every FContact, name it c and run
      if (c.contains(f)) {
        return true;
      }
    }
    return false;
  }
}
