class Board
{
  Square[] squares;
  int squareSize;
  Board()
  {
    squares = new Square[64];

    squareSize = width / 8;
    int c = 255;
    for (int i = 0; i < squares.length; i += 1)
    {
      if (i % 8 != 0)
      {
        c = (c - 255) * -1;
      }
      int value = int(random(0, 2));
      squares[i] = new Square(i % 8 * 100, i / 8 * 100, squareSize, c, value);
    }
  }

  void show()
  {
    for (Square s : squares)
    {
      s.show();
    }
  }
}
