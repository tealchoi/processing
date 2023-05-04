
void drawStyleSA(color[][] colors, int cell_count_w, int cell_count_h, int cell_size_w, int cell_size_h )
{
  colorMode(HSB, 255); // 색상 모드 변경
  
  
  for(int i = 0; i != cell_count_w; ++i)
  {
    for(int j = 0; j != cell_count_h; ++j)
    {
      int x = i * cell_size_w;
      int y = j * cell_size_h;
    
      color c = colors[i][j];
      float hueColor = hue(c); // 색조 값 추출

      fill(color((hueColor+180)%255, 255, 255));  // 파란색으로 변경한다면 hueColor+120
      
      float newSize = map(hueColor, 0, 255, 255,  cell_size_w);
      float halfSize = newSize / 2;
      
      // 세 점의 좌표 계산
      //float x1 = x + halfSize;
      //float y1 = y + newSize;
      //float x2 = x;
      //float y2 = y;
      //float x3 = x + newSize;
      //float y3 = y;
      
      // 역삼각형 그리기
      // triangle(x1, y1, x2, y2, x3, y3);
      triangle(x, y, x+10, y, x+5, y+10);

      //rect(x,y,10,10);
    }
  }
}
