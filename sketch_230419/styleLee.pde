
float time = 0; //애니메이션 사용 변수!

void drawStyleLEE(color[][] mosaic_colors, int numOfCells_w, int numOfCells_h, int cellSize_w, int cellSize_h)
{

  time += 0.01; // 애니메이션 사용 변수 t를 0.01씩 증가
  
  int cellSize = cellSize_w;
  
  for (int i = 0; i < numOfCells_w; i++) {
    for (int j = 0; j < numOfCells_h; j++) {
      int x = i * cellSize_w;
      int y = j * cellSize_h;

      //x좌표와 y좌표의 이동거리 계산
      //map(value, fromLow, fromHigh, toLow, toHigh)
      float offsetX = map(cos(time + i * 0.03), -1, 1, -cellSize, cellSize);
      float offsetY = map(sin(time + j * 0.03), -1, 1, -cellSize, cellSize);
      
      color c = mosaic_colors[i][j];
      float r = red(c) + map(offsetX, -cellSize, cellSize / 2, -80, 80); 
      float g = green(c) + map(offsetY, -cellSize, cellSize / 2, -80, 80); 
      float b = blue(c) + map(offsetX + offsetY, -2 * cellSize / 4, 2 * cellSize / 4, -80, 80); 

      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      fill(r, g, b);
      noStroke();
      ellipse(x + cellSize/2 + offsetX, y + cellSize/2 + offsetY, cellSize, cellSize);
    }
  }
}
