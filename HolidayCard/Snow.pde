class Snow {

  float xPos, yPos, xSize, ySize;
  float xDir = random(-15, 15);
  float yDir = random(-15, -5);
  float col = 255;

  PVector location;
  PVector velocity;
  PVector acceleration;

  public Snow() {
  }


  public Snow(float xPosition, float yPosition, float xWidth, float yWidth) {

    xSize = xWidth;
    ySize = yWidth;


    location = new PVector(xPosition, yPosition);
    velocity = new PVector(xDir, yDir);

    acceleration = new PVector(0, random(.01, .5));
  }

  public float getXPos() {
    return location.x;
  }

  public float getYPos() {
    return location.y;
  }

  public void display() {
    fill(col); 

    ellipse(location.x, location.y, xSize, ySize);
  }

  public void move() {
    location.add(velocity);
  }

  public void turnAround() {
    velocity.mult(-1);
  }

  public void relaunch() {
    velocity.x = xDir;
    velocity.y = yDir;
  }

  public void sink() {
    if (location.y<780) {
      velocity.y += acceleration.y;
    } else {
      velocity.mult(0);
      location.x = random(740, 1260);
      location.y = 780;
    }
    if (location.x<730 && velocity.x<0) {
      velocity.x += random(1, 2);
    } else if (location.x>1270 && velocity.x>0) {
      velocity.x += random(-2, -1);
    }
  }
}