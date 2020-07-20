class Ball {

  PVector pos;
  PVector velocity;
  PVector acceleration;
  float topSpeed;
  int size = 10;

  public Ball(float x, float y) {
    pos = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    topSpeed = 15;
  }

  public void Draw() {  
    Update();
    stroke(0);
    circle(pos.x, pos.y, size);
  }

  public void checkCollision(Wall wall) {
    float p = pos.x - (wall.pos.x+wall.size/2);
    float p2 = p*p;
    float q = pos.y - (wall.pos.y+wall.size/2);
    float q2 = q*q;

    //float distance = sqrt(p2+q2);
    // Checks if the balls center is inside the wall 
    if ((pos.x+size >= wall.pos.x && pos.x-size <= wall.pos.x+wall.size) && (pos.y+size >= wall.pos.y && pos.y-size <= wall.pos.y+wall.size)) {

      if (abs(p) >= abs(q)) {
        if (p < 0) {
          // This means it hit the left side of a wall
          pos.x = wall.pos.x-size;
        } else {
          // This means it hit the right side of a wall
          pos.x = wall.pos.x+wall.size+size;
        }

        velocity.x = velocity.x * -1;
        acceleration.x = acceleration.x * -1;
      } 

      if (abs(p) <= abs(q)) {

        if (q < 0) {
          // This means it hit the top of a wall
          pos.y = wall.pos.y-size;
        } else {
          // This measn it hit the bottom of a wall
          pos.y = wall.pos.y+wall.size+size;
        }
        velocity.y = velocity.y * -1;
        acceleration.y = acceleration.y * -1;
      }
      
      velocity.mult(0.88);
      pos.add(velocity);
    }
  }

  public void addForce(PVector force) {

    acceleration = PVector.sub(force, pos).mult(-1);
  }

  public void Update() {

    //acceleration.setMag(0.2);

    velocity.add(acceleration);
    velocity.limit(topSpeed);
    acceleration.mult(0.4);

    if (pos.y <= 10 || pos.y >= height - 10) {
      velocity.y = velocity.y * -1;
      acceleration.y = acceleration.y * -1;
    }

    if (pos.x <= 10 || pos.x >= width - 10) {
      velocity.x = velocity.x * -1;
      acceleration.x = acceleration.x * -1;
    }
    
    velocity.mult(0.92);
    pos.add(velocity);
  }
}
