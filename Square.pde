class Square
{
  PVector pos;
  int size;
  int colour;
  int value;
  Square(int x, int y, int s, int c, int v)
  {
    pos = new PVector(x, y);
    size = s;
    colour = c;
    value = v;
  }

  void show()
  {
    fill(colour);
    rect(pos.x, pos.y, size, size);
    textSize(size / 2);
    textAlign(CENTER, CENTER);
    colour = (colour - 255) * -1;
    fill(colour);
    text(value, pos.x + size / 2, pos.y + size / 2);
  }
}
