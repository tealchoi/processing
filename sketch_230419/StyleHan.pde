void drawStyleHAN(color[][] colors, int cell_count_w, int cell_count_h, int cell_size_w, int cell_size_h )
{
  for(int i = 0; i != cell_count_w; ++i)
  {
    for(int j = 0; j != cell_count_h; ++j)
    {
      int x = i * cell_size_w;
      int y = j * cell_size_h;

      // 각 셀의 색상값을 구함
      color c = colors[i][j];

      // HSV 색상 모델을 이용하여 색상의 채도와 명도를 구함
      float hue = hue(c);
      float saturation = saturation(c);
      float brightness = brightness(c);

      // 기하학적 도형의 크기를 정함 (HSV 색상 모델을 이용하여 크기를 정함)
      float size = map(brightness, 0, 255, 1,  cell_size_w);

      // 라인을 이용하여 그림 (HSV 색상 모델을 이용하여 라인의 색상과 굵기를 결정함)
      strokeWeight(map(saturation, 0, 255, 1, 5));
      stroke(hue, saturation, brightness);
      float angle = map(brightness, 0, 255, 0, TWO_PI);
      line(x, y, x + size*cos(angle), y + size*sin(angle));
    }
  }
}
