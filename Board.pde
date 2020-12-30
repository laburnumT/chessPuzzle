class Board
{
  Square[] squares;
  int squareSize;
  int parityValue;
  int containsKeyIndex;
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
      squares[i] = new Square(i % 8 * 100, i / 8 * 100, squareSize, c, value, i);
    }
    parityValue = calculateParity();
    containsKeyIndex = -1;
  }

  void show()
  {
    for (Square s : squares)
    {
      s.show();
    }
  }

  int calculateParity()
  {
    int[] arr = new int[6];
    for (int i = 0; i < arr.length; i += 1)
    {
      arr[i] = 0;
    }

    for (Square s : squares)
    {
      if (s.value == 1)
      {
        for (int i = 0; i < arr.length; i += 1)
        {
          if (s.label.charAt(i) == '1')
          {
            arr[i] = (arr[i] + 1) % 2;
          }
        }
      }
    }

    int par = 0;
    for (int i = 0; i < arr.length; i += 1)
    {
      par += pow(2, i) * arr[5 - i];
    }
    //println(arr);
    return par;
  }

  void update(int x, int y, int button)
  {
    x /= 100;
    y /= 100;
    int index = x + y * 8;
    if (button == LEFT)
    {
      squares[index].value = 1;
    } else
    {
      squares[index].value = 0;
    }
    parityValue = calculateParity();
    //println(parityValue);
  }

  void placeKey(int x, int y)
  {
    x /= 100;
    y /= 100;
    int index = x + y * 8;
    if (containsKeyIndex != -1)
    {
      squares[containsKeyIndex].containsKey = false;
    }
    squares[index].containsKey = true;
    containsKeyIndex = index;
  }

  void resetKey()
  {
    if (containsKeyIndex != -1)
    {
      squares[containsKeyIndex].containsKey = false;
    }
    containsKeyIndex = -1;
  }
  //int
}
