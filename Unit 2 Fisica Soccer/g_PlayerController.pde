void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if (wKey) goForwards(leftPlayer, 500);
  if (aKey) leftPlayer.adjustRotation(-0.05);
  if (sKey) goForwards(leftPlayer, -250);
  if (dKey) leftPlayer.adjustRotation(0.05);
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
  if (upKey) goForwards(rightPlayer, 500);
  if (leftKey) rightPlayer.adjustRotation(-0.05);
  if (downKey) goForwards(rightPlayer, -250);
  if (rightKey) rightPlayer.adjustRotation(0.05);
}

boolean isTouching(FBody object, FBody contact) {
  ArrayList<FContact> contactList = object.getContacts();
  for (FContact c : contactList) if (c.contains(contact)) return true;
  return false;
}
void handlePlayerInput(int a) {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if (wKey) leftPlayer.setVelocity(left_vx, -500);
  if (aKey) leftPlayer.setVelocity(-500, left_vy);
  if (sKey) leftPlayer.setVelocity(left_vx, 500);
  if (dKey) leftPlayer.setVelocity(500, left_vy);
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
  if (upKey) rightPlayer.setVelocity(right_vx, -500);
  if (leftKey) rightPlayer.setVelocity(-500, right_vy);
  if (downKey) rightPlayer.setVelocity(right_vx, 500);
  if (rightKey) rightPlayer.setVelocity(500, right_vy);
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
