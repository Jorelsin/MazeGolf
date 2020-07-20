
Ball ball;

void setup() {
  size(1200, 900);
  ball = new Ball(400.0, 300.0);
}


void draw() {

  background(200);
  if (mousePressed) {
    ball.addForce(new PVector(mouseX, mouseY));
  }

  ball.Draw();
}
