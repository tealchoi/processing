
void drawStyleCHOI(color[][] colors, int cell_count_w, int cell_count_h, int cell_size_w, int cell_size_h )
{
  for(int i = 0; i != cell_count_w; ++i)
  {
    for(int j = 0; j != cell_count_h; ++j)
    {
      int x = i * cell_size_w;
      int y = j * cell_size_h;
      
      if ((i+j) % 2 == 0) {
        fill(colors[i][j]);
      } else {
        fill(255);
      }
      rect(x, y, cell_size_w, cell_size_h);
    }
  }
}
