void handlePlayerInput() {
  float left_vx = leftPlayers[leftControlling].getVelocityX();
  float left_vy = leftPlayers[leftControlling].getVelocityY();
  if (wKey) goForwards(leftPlayers[leftControlling], 500);
  if (aKey) leftPlayers[leftControlling].adjustRotation(-0.05);
  if (sKey) goForwards(leftPlayers[leftControlling], -250);
  if (dKey) leftPlayers[leftControlling].adjustRotation(0.05);
  float right_vx = rightPlayers[rightControlling].getVelocityX();
  float right_vy = rightPlayers[rightControlling].getVelocityY();
  if (upKey) goForwards(rightPlayers[rightControlling], 500);
  if (leftKey) rightPlayers[rightControlling].adjustRotation(-0.05);
  if (downKey) goForwards(rightPlayers[rightControlling], -250);
  if (rightKey) rightPlayers[rightControlling].adjustRotation(0.05);
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

void rotateVelocity(FBody body, float rotation) {
  PVector v = getVelocity(body);
  v.rotate(rotation);
  body.setVelocity(v.x, v.y);
}

void goForwards(FBody body, float mag) {
  float angle = body.getRotation();
  float vx = cos(angle);
  float vy = sin(angle);
  body.setVelocity(vx * mag, vy * mag);
}
