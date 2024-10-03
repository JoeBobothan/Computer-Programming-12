// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    int numPlayers = Math.min(5, boids.size()); // Get the lesser of 5 or the size of the list
    for (int i = 0; i < numPlayers; i++) {
        boids.get(i).player = true; // Set player to true for the first 'numPlayers' Boids
    }
    for (Boid b : boids) {
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
  }

  void removeBoid() {
    if (boids.isEmpty()) {
      return; // If no boids, exit
    }

    Boid closestBoid = boids.get(0); // Assume the first boid is the closest
    float closestDist = closestBoid.mouseDist(); // Get its distance to the mouse

    // Loop through all boids to find the closest one
    for (Boid b : boids) {
      float dist = b.mouseDist();
      if (dist < closestDist) {
        closestBoid = b;
        closestDist = dist;
      }
    }

    // Remove the closest boid
    boids.remove(closestBoid);
  }
  float closestDist() {
    if (boids.isEmpty()) {
      return 0;
    }

    Boid closestBoid = boids.get(0); // Assume the first boid is the closest
    float distToClosestBoid = closestBoid.mouseDist(); // Get its distance to the mouse

    // Loop through all boids to find the closest one
    for (Boid b : boids) {
      float dist = b.mouseDist();
      if (dist < distToClosestBoid) {
        closestBoid = b;
        distToClosestBoid = dist;
      }
    }
    return distToClosestBoid;
  }
}
