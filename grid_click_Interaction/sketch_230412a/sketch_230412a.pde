int canvasWidth = 400; // 캔버스 크기를 정한다.
int canvasHeight = 400;
int numCells = 10; // 행열 몇칸 나눌지 정한다.
int cellWidth = canvasWidth / numCells; // 각 셀의 너비와 높이를 구한다.
int cellHeight = canvasHeight / numCells;
color cellColorGreen = color(0, 255, 0);
color cellColorBlack = color(0, 0, 0); // 셀의 색상을 정의한다.
color gridColor = color(255, 255, 255); // 경계선의 색상을 정의한다.

boolean[][] cells = new boolean[numCells][numCells]; // 각 셀의 상태를 저장하는 2차원 배열을 만든다.

void setup() {
  size(400, 400); // 캔버스를 생성한다.

  // 각 셀의 상태를 초기화한다.
  for (int i = 0; i < numCells; i++) {
    for (int j = 0; j < numCells; j++) {
      cells[i][j] = false;
    }
  }
}

void draw() {
  background(gridColor); // 캔버스 배경색을 설정한다.

  // 각 셀을 그린다.
  for (int i = 0; i < numCells; i++) {
    for (int j = 0; j < numCells; j++) {
      if(cells[i][j])
      {
        fill(cellColorGreen); // 각 셀의 색상을 설정한다.
      }
      else
      {
        fill(cellColorBlack); // 각 셀의 색상을 설정한다.
      }
      
      stroke(gridColor); // 각 셀의 경계선 색상을 설정한다.
      rect(i * cellWidth, j * cellHeight, cellWidth, cellHeight); // 각 셀을 그린다.
    }
  }
}

void mousePressed() {

  // 마우스 클릭 위치의 해당하는 셀의 인덱스를 구한다.
  int mouseXPos = floor(mouseX / cellWidth);
  int mouseYPos = floor(mouseY / cellHeight);

  //해당 셀의 상태를 바꾼다.
  if (cells[mouseXPos][mouseYPos] == false)
  {
    cells[mouseXPos][mouseYPos] = true;
  } else {
    cells[mouseXPos][mouseYPos] = false;
  }
}
