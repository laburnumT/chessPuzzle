class Square
{
  PVector pos;
  int size;
  int colour;
  int value;
  String label;
  boolean containsKey;
  int index;

  public Square(int x, int y, int s, int c, int v, int i)
  {
    pos = new PVector(x, y);
    size = s;
    colour = c;
    value = v;
    label = binary(i, 6);
    index = i;
    containsKey = false;
  }

  public void show()
  {
    if (!containsKey || !showKey)
      fill(colour);
    else
      fill(255, 0, 0);

    rect(pos.x, pos.y, size, size);
    textSize(size / 2);
    textAlign(CENTER, CENTER);
    fill((colour - 255) * -1);
    text(value, pos.x + size / 2, pos.y + size / 2);
    textSize(size / 8);
    text(index, pos.x + size / 8, pos.y + size / 8);
  }
}
