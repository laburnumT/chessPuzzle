Board n;
boolean editMode;
boolean showKey;
int boardSize;

void setup()
{
  size(800, 1000);

  n = new Board();
  n.show();

  editMode = true;
  showKey   = true;

  update();
}

void draw()
{
}

void mousePressed()
{
  int x = constrain(mouseX, 0, width);
  int y = constrain(mouseY, 0, height);
  if (editMode) 
    n.update(x, y);
  else
    n.placeKey(x, y);

  update();
}

void keyPressed()
{
  switch (key) {
  case ' ':
    editMode = !editMode;
    break;

  case 'c':
    showKey = !showKey;
    break;
  }

  update();
}

void update()
{
  background(0);
  n.show();

  int parity  = n.parityValue;
  int keyLocation = n.containsKeyIndex;

  fill(255);
  textSize(20);
  textAlign(CORNER, CORNER);

  if (showKey) {
    if (keyLocation != -1) {
      int toFlip = parity ^ keyLocation;
      text("Parity of current board: " + parity + "\nIndex of key: " + keyLocation +
        "\nLocation to flip: " + toFlip, 
        10, height - 150);

      text("Binary value: " + binary(parity, 6) + "\nBinary value: " + binary(keyLocation, 6) + "\nBinary value: " + binary(toFlip, 6), 350, height - 150);
    } else {
      text("Parity of current board: " + parity + "\nKey not placed", 10, height - 150);
      text("Binary value: " + binary(parity, 6), 350, height - 150);
    }
  }

  text("Switch between key placing and parity swithing modes: SPACE", 0, height - 50);
  text("Toggle key visibility: c", 0, height - 20);
}
