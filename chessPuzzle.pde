Board n;
boolean editMode;
boolean showKey;
int boardSize;

void setup()
{
  size(800, 1000);
  //boardSize = width / 2;

  n = new Board();
  n.show();
  //println(n.parity.Value);
  editMode = true;
  showKey = true;


  update();
}


void draw() 
{
}

void mousePressed()
{
  if (editMode)
  {
    int x = constrain(mouseX, 0, width);
    int y = constrain(mouseY, 0, height);
    n.update(x, y, mouseButton);
  } else
  {
    n.placeKey(mouseX, mouseY);
  }
  update();
}

void keyPressed()
{
  if (key == ' ')
  {
    editMode = !editMode;
  }
  if (key == 'c')
  {
    showKey = !showKey;
  }
  if (key == 'r')
  {
    n.resetKey();
  }
  update();
}

void update()
{
  background(0);
  n.show();
  for (int i = 0; i < 5; i += 1)
  {
    println();
  }


  int parity = n.parityValue;
  int keyLocation = n.containsKeyIndex;


  fill(255);
  textSize(20);
  textAlign(CORNER, CORNER);

  if (showKey)
  {
    if (keyLocation != -1)
    {
      int toFlip = parity ^ keyLocation;
      text("Parity of current board: " + parity + "\nIndex of key: " + keyLocation + 
        "\nLocation to flip: " + toFlip, 10, height - 150);

      text("Binary value: " + binary(parity, 6) + "\nBinary value: " + binary(keyLocation, 6) + "\nBinary value: " + binary(toFlip, 6), 350, height - 150);
    } else
    {
      text("Parity of current board: " + parity + "\nKey not placed", 10, height - 150);
      text("Binary value: " + binary(parity, 6), 350, height - 150);
    }
  }
}

//char[] toFlip(String current, String goal)
//{
//  char[] arr = new char[6];
//  for (int i = 0; i < 6; i += 1)
//  {

//  }
//}
