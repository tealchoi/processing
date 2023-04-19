PImage img;

  public void settings() {
    size(400, 400);
  }

  public void setup() {
    img = loadImage("cat.png");
  }

  public void draw() {
    background(255);
    image(img, 0, 0, width, height);
  }
