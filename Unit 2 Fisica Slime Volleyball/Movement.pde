void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if (isTouching(leftPlayer, leftPlatform) && wKey) leftPlayer.setVelocity(left_vx, -750);
  if (aKey && !dKey) leftPlayer.setVelocity(left_vx*0.1-450, left_vy);
  if (sKey) leftPlayer.setVelocity(left_vx, 500);
  if (dKey && !aKey) leftPlayer.setVelocity(left_vx*0.1+450, left_vy);
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
  if (isTouching(rightPlayer, rightPlatform) && upKey) rightPlayer.setVelocity(right_vx, -750);
  if (leftKey) rightPlayer.setVelocity(right_vx*0.1-450, right_vy);
  if (downKey) rightPlayer.setVelocity(right_vx, 500);
  if (rightKey) rightPlayer.setVelocity(right_vx*0.1+450, right_vy);
}

boolean hitGround(FBody ground) {
  ArrayList<FContact> contactList = ball.getContacts();
  for (FContact c : contactList) if (c.contains(ground)) return true;
  return false;
}

boolean isTouching(FBody player, FBody ground) {
  ArrayList<FContact> contactList = player.getContacts();
  for (FContact c : contactList) if (c.contains(ground)) return true;
  return false;
}
