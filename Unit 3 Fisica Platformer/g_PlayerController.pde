void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  //if (isTouching(leftPlayer, leftPlatform) && wKey) leftPlayer.setVelocity(left_vx, -750);
  if (aKey && !dKey) leftPlayer.setVelocity(left_vx*0.1-450, left_vy);
  if (sKey) leftPlayer.setVelocity(left_vx, 500);
  if (dKey && !aKey) leftPlayer.setVelocity(left_vx*0.1+450, left_vy);
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
  //if (isTouching(rightPlayer, rightPlatform) && upKey) rightPlayer.setVelocity(right_vx, -750);
  if (leftKey) rightPlayer.setVelocity(right_vx*0.1-450, right_vy);
  if (downKey) rightPlayer.setVelocity(right_vx, 500);
  if (rightKey) rightPlayer.setVelocity(right_vx*0.1+450, right_vy);
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
