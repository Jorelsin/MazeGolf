class Wall {
  PVector pos;
  int size;

  public Wall(int x, int y, int size) {
    pos = new PVector(x, y);
    this.size = size;
  }


  public void Draw() {
    square(pos.x, pos.y, size);
  }
}
