// 1. 이미지를 로딩한다.
// 2, 이미지의 픽셀의 색상(RGB)을 얻는다.
// 3, 모자이크 셀 한개에 해당하는 색상을 평균을 낸다.
// 4, 셀에 그 색깔을 적용한다.

PImage img; // PImage 클래스 객체 생성

int numOfCells_w = 30;
int numOfCells_h = 30;
int cellSize_w;
int cellSize_h;

color[][] mosaic_colors;

void setup()
{
  size(800, 800); // 캔버스 크기 설정
  img = loadImage("cat.png"); // 이미지 로드
  
  cellSize_w = img.width / numOfCells_w;
  cellSize_h = img.height / numOfCells_h;
  
  mosaic_colors = new color[numOfCells_w][numOfCells_h];
  
  for(int i = 0; i != numOfCells_w; ++i)
  {
    for(int j = 0; j != numOfCells_h; ++j)
    {
      int x = i * cellSize_w;
      int y = j * cellSize_h;
      
      mosaic_colors[i][j] = getAverageColor(img, x, y, cellSize_w, cellSize_h);
    }
  }
}

void draw() {
  //drawStyleMosaic(mosaic_colors,numOfCells_w, numOfCells_h, cellSize_w, cellSize_h);
  drawStyleDotGray(mosaic_colors,numOfCells_w, numOfCells_h, cellSize_w, cellSize_h);
  //drawStyleMine(mosaic_colors,numOfCells_w, numOfCells_h, cellSize_w, cellSize_h);
}


void drawStyleMosaic(color[][] colors, int cell_count_w, int cell_count_h, int cell_size_w, int cell_size_h )
{
  for(int i = 0; i != cell_count_w; ++i)
  {
    for(int j = 0; j != cell_count_h; ++j)
    {
      int x = i * cell_size_w;
      int y = j * cell_size_h;
      
      fill(colors[i][j]);
      rect(x, y, cell_size_w, cell_size_h);
    }
  }
}


void drawStyleDotGray(color[][] colors, int cell_count_w, int cell_count_h, int cell_size_w, int cell_size_h )
{
  for(int i = 0; i != cell_count_w; ++i)
  {
    for(int j = 0; j != cell_count_h; ++j)
    {
      int x = i * cell_size_w;
      int y = j * cell_size_h;
    
      float grayColor = brightness(colors[i][j]);

      fill(grayColor);
      
      float newSize = map(grayColor, 0, 255, 1,  cell_size_w);
      ellipse(x, y, newSize, newSize);
    }
  }
}

void drawStyleMine(color[][] colors, int cell_count_w, int cell_count_h, int cell_size_w, int cell_size_h )
{
}

// 특정 영역의 색상 평균값을 구하는 함수
color getAverageColor(PImage img, int x, int y, int w, int h)
{
  int rSum = 0, gSum = 0, bSum = 0;
  int pixelCount = w * h; // 영역 내 픽셀 수
  
  // 영역 내 모든 픽셀의 색상값을 더함
  for (int i = x; i < x + w; i++) {
    for (int j = y; j < y + h; j++) {
      color c = img.get(i, j);
      rSum += red(c);
      gSum += green(c);
      bSum += blue(c);
    }
  }
  
  // 각 색상값의 평균을 구하여 반환
  return color(rSum/pixelCount, gSum/pixelCount, bSum/pixelCount);
}
