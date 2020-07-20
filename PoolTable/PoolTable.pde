import java.util.ArrayList;

int cols;
int rows;
int wallSize;
Ball ball;
// Wall wally;
ArrayList<Wall> walls = new ArrayList<Wall>();


void setup() {
  size(800, 800);
  wallSize = 120;
  cols =  width/wallSize - 1;
  rows =  height/wallSize -1 ;
  ball = new Ball(wallSize/2, wallSize/2);
  // wally = new Wall(2*wallSize, 2*wallSize, wallSize);
  populateWalls();
}


void populateWalls() {


  for (int i = 1; i < cols; i++) {
    for (int j = 1; j < rows; j++) {
      if (random(2) >= 1) {
        walls.add(new Wall(i*wallSize, j*wallSize, wallSize));
      }
    }
  }
}

void draw() {

  background(200);
  if (mousePressed) {
    ball.addForce(new PVector(mouseX, mouseY));
  }

   for (Wall obj : walls) {
    obj.Draw();
    ball.checkCollision(obj);
  }
  ball.Draw();

}
