Board n;
boolean editMode;
boolean showKey;

void setup()
{
  size(800, 800);
  n = new Board();
  n.show();
  println(n.parityValue);
  editMode = true;
  showKey = true;
}


void draw() 
{
  n.show();
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
}
