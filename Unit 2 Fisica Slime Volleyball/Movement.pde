void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if (wKey) leftPlayer.setVelocity(left_vx, -1000);
  if (aKey) leftPlayer.setVelocity(-1000, left_vy);
  if (sKey) leftPlayer.setVelocity(left_vx, 1000);
  if (dKey) leftPlayer.setVelocity(1000, left_vy);
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
  if (upKey) rightPlayer.setVelocity(right_vx, -1000);
  if (leftKey) rightPlayer.setVelocity(-1000, right_vy);
  if (downKey) rightPlayer.setVelocity(right_vx, 1000);
  if (rightKey) rightPlayer.setVelocity(1000, right_vy);
}

boolean hitGround(FBox ground) {
  ArrayList<FContact> contactList = ball.getContacts();
  for (FContact c : contactList) if (c.contains(ground)) return true;
  return false;
}
