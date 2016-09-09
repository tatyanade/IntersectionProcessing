int numberLines = 12;
float[] linePointsX1 = new float[numberLines];
float[] linePointsY1 = new float[numberLines];
float[] linePointsX2 = new float[numberLines];
float[] linePointsY2 = new float[numberLines];
int widthX = 700;
int heightY = 360;

float x1 = 0;
float x2 = 0;
float x3 = 0;
float x4 = 0;
float y1 = 0;
float y2 = 0;
float y3 = 0;
float y4 = 0;


void setup()
{
  size(700, 360);
  getLineData();
  noLoop();
}

void getLineData()
{
  for (int i = 0; i < numberLines; i++)
  {
    x1 = random(700);  
    x2 = random(700);
    y1 = random(360);
    y2 = random(360);
    
    line(x1, y1, x2, y2);

    linePointsX1[i] = x1;
    linePointsY1[i] = y1;
    linePointsX2[i] = x2;
    linePointsY2[i] = y2;
  }
}


void getIntersections()
{
  for (int i = 0; i < numberLines; i++)
  {
    for (int j = i+1; j < numberLines; j++ )
    {
      x1 = linePointsX1[i];
      y1 = linePointsY1[i];
      x2 = linePointsX2[i];
      y2 = linePointsY2[i];

      x3 = linePointsX1[j];
      y3 = linePointsY1[j];
      x4 = linePointsX2[j];
      y4 = linePointsY2[j];

      float denom  = (y4-y3) * (x2-x1) - (x4-x3) * (y2-y1);
      float numera = (x4-x3) * (y1-y3) - (y4-y3) * (x1-x3);
      float numerb = (x2-x1) * (y1-y3) - (y2-y1) * (x1-x3);

      float xx = 0;
      float yy = 0;

      float mua = numera / denom;
      float mub = numerb / denom;

      if (mua >= 0 && mua <= 1 && mub >= 0 && mub <= 1)
      {
        xx = x1 + mua * (x2 - x1);
        yy = y1 + mua * (y2 - y1);
        ellipse(xx, yy, 15, 15);
      }
    }
  }
}


void mousePressed()
{
  getLineData();
  redraw();
}

void drawLines()
{
  for (int i =0; i<numberLines; i++)
  {
    x1 = linePointsX1[i];
    y1 = linePointsY1[i];
    x2 = linePointsX2[i];
    y2 = linePointsY2[i];
    line(x1, y1, x2, y2);
  }
}


void draw()
{
  background(212, 232, 102);
  getLineData();
  drawLines();
  getIntersections();
}