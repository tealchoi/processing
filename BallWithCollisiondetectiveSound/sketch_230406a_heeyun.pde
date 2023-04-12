import processing.sound.*;

SoundFile hitSound;

int circleCount = 5;
Circle[] circles = new Circle[circleCount];

void setup() {
  size(500, 500);
  hitSound = new SoundFile(this, "data/boing.wav");
  for (int i = 0; i < circleCount; i++) {
    circles[i] = new Circle(random(width), random(height), random(-5, 5), random(-5, 5), 20);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < circleCount; i++) {
    circles[i].move();
    circles[i].checkBoundaryCollision();
    circles[i].checkWallCollision();
    circles[i].display();
  }
}

class Circle {
  float x;
  float y;
  float dx;
  float dy;
  float r;

  Circle(float x, float y, float dx, float dy, float r) {
    this.x = x;
    this.y = y;
    this.dx = dx;
    this.dy = dy;
    this.r = r;
  }

  void move() {
    x += dx;
    y += dy;
  }

  void checkBoundaryCollision() {
    if (x < r) {
      x = r;
      dx *= -1;
      hitSound.play();
    } else if (x > width - r) {
      x = width - r;
      dx *= -1;
      hitSound.play();
    }

    if (y < r) {
      y = r;
      dy *= -1;
      hitSound.play();
    } else if (y > height - r) {
      y = height - r;
      dy *= -1;
      hitSound.play();
    }
  }

  void checkWallCollision() {
    if (x < r || x > width - r) {
      dx *= -1;
      hitSound.play();
    }
    if (y < r || y > height - r) {
      dy *= -1;
      hitSound.play();
    }
  }

  void display() {
    fill(0, 0, 255);
    ellipse(x, y, r*2, r*2);
  }
}
