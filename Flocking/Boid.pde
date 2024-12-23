// The Boid class

class Boid {

  PVector position;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  boolean player = false;

  Boid(float x, float y) {
    acceleration = new PVector(0, 0);

    velocity = PVector.random2D();

    position = new PVector(x, y);
    r = 2.0;
    maxspeed = 2;
    maxforce = 0.03;
  }

  float mouseDist() {
    return dist(position.x, position.y, mouseX, mouseY);
  }

  void run(ArrayList<Boid> boids) {
    if (player) {
      playerMovement();
    } else {
      flock(boids);
      update();
    }
    borders();
    render();
    player = false;
  }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList<Boid> boids) {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion
    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    // Add the force vectors to acceleration
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
  }

  // Method to update position
  void update() {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    position.add(velocity);
    // Reset accelertion to 0 each cycle
    acceleration.mult(0);
  }

  // A method that calculates and applies a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  PVector seek(PVector target) {
    PVector desired = PVector.sub(target, position);  // A vector pointing from the position to the target
    // Scale to maximum speed
    desired.setMag(maxspeed);


    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    return steer;
  }

  void render() {
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading() + radians(90);

    fill(200, 100);
    stroke(255);
    pushMatrix();
    translate(position.x, position.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape();
    popMatrix();
  }

  // Wraparound
  void borders() {
    if (position.x < -r) position.x = width+r;
    if (position.y < -r) position.y = height+r;
    if (position.x > width+r) position.x = -r;
    if (position.y > height+r) position.y = -r;
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList<Boid> boids) {
    float desiredseparation = 15.0f; // How close it is allowed to be to another Boid
    PVector steer = new PVector(0, 0, 0);
    int count = 0;
    // For every boid in the system, check if it's too close
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(position, other.position);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) {

      // Implement Reynolds: Steering = Desired - Velocity
      steer.setMag(maxspeed);
      steer.sub(velocity);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList<Boid> boids) {
    float neighbordist = 100; // How far to count as part of its flock
    PVector sum = new PVector(0, 0);
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.velocity);
        count++;
      }
    }
    if (count > 0) {
      sum.div((float)count);

      // Implement Reynolds: Steering = Desired - Velocity
      sum.setMag(maxspeed);
      PVector steer = PVector.sub(sum, velocity);
      steer.limit(maxforce);
      return steer;
    } else {
      return new PVector(0, 0);
    }
  }

  // Cohesion
  // For the average position (i.e. center) of all nearby boids, calculate steering vector towards that position
  PVector cohesion (ArrayList<Boid> boids) {
    float neighbordist = 100; // How far to count as part of its flock
    PVector sum = new PVector(0, 0);   // Start with empty vector to accumulate all positions
    int count = 0;
    for (Boid other : boids) {
      float d = PVector.dist(position, other.position);
      if ((d > 0) && (d < neighbordist)) {
        sum.add(other.position); // Add position
        count++;
      }
    }
    if (count > 0) {
      sum.div(count);
      return seek(sum);  // Steer towards the position
    } else {
      return new PVector(0, 0);
    }
  }

  void playerMovement() {
    N = new PVector(0, -1);
    NE = new PVector(1, -1);
    E = new PVector(1, 0);
    SE = new PVector(1, 1);
    S = new PVector(0, 1);
    SW = new PVector(-1, 1);
    W = new PVector(-1, 0);
    NW = new PVector(-1, -1);
    mvt = new PVector(0, 0);
    N.setMag(velocityN);
    NE.setMag(velocityNE);
    E.setMag(velocityE);
    SE.setMag(velocitySE);
    S.setMag(velocityS);
    SW.setMag(velocitySW);
    W.setMag(velocityW);
    NW.setMag(velocityNW);
    velocityN *= 0.95;
    velocityNE *= 0.95;
    velocityE *= 0.95;
    velocitySE *= 0.95;
    velocityS *= 0.95;
    velocitySW *= 0.95;
    velocityW *= 0.95;
    velocityNW *= 0.95;
    if (wkey && dkey) velocityNE += accel;
    if (dkey && skey) velocitySE += accel;
    if (skey && akey) velocitySW += accel;
    if (akey && wkey) velocityNW += accel;
    if (wkey && !(dkey || akey)) velocityN += accel;
    if (akey && !(wkey || skey)) velocityW += accel;
    if (skey && !(akey || dkey)) velocityS += accel;
    if (dkey && !(wkey || skey)) velocityE += accel;
    if (velocityN <= 0.01) velocityN = 0;
    if (velocityNE <= 0.01) velocityNE = 0;
    if (velocityE <= 0.01) velocityE = 0;
    if (velocitySE <= 0.01) velocitySE = 0;
    if (velocityS <= 0.01) velocityS = 0;
    if (velocitySW <= 0.01) velocitySW = 0;
    if (velocityW <= 0.01) velocityW = 0;
    if (velocityNW <= 0.01) velocityNW = 0;
    PVector mvt = new PVector(0, 1);
    mvt.setMag(0);
    mvt.add(N);
    mvt.add(NE);
    mvt.add(E);
    mvt.add(SE);
    mvt.add(S);
    mvt.add(SW);
    mvt.add(W);
    mvt.add(NW);
    position.x += mvt.x;
    position.y += mvt.y;
    velocity = mvt;
  }
}
