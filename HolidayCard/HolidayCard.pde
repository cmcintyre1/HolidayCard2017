boolean clicking = false;
int numClicks = 0;
boolean shouldSink = false;
boolean hasSunk = false;
boolean hasRelaunched = false;
PFont stringWords;
public ArrayList <Snow> blizzard = new ArrayList<Snow>();
PImage fondo;
PImage elfPic;
PImage wreath;
PVector elfLocation = new PVector(850, 250);
PVector elfShiver = new PVector(5, 0);
int lightCounter = 25;
boolean red, green;

void setup() {
  size(2000, 1000);
  wreath = loadImage("goodWreath.png");
  wreath.resize(100,100);
  fondo = loadImage("bg.jpg");
  fondo.resize(2000, 1000);
  elfPic = loadImage("finalElf.png");
  stringWords = createFont("Calibri Italic", 50, true);

  for (int i = 0; i<500; i ++) {
    float size = parseInt(random(20));  
    float yStart = 780;
    Snow thisSnow = new Snow(random(740, 1260), yStart, size, size);
    blizzard.add(thisSnow);
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void draw() {
  background(fondo);

  message();
  globeGlass();
  elf();
  makeSnow();
  globeBase();
  lights();
  clickHere();
  sign();
}


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void globeGlass() {
  fill(147, 255, 241);
  ellipse(1000, 500, 800, 800);
}


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void globeBase() {
  fill(70, 36, 1);
  rect(0, 900, 2000, 200);
  fill(90, 55, 9);
  noStroke();
  ellipse(1000, 800, 600, 50);
  rect(725, 800, 550, 100);
  ellipse(1000, 900, 650, 100);
  
  image(wreath,730,800);
  image(wreath,1170,800);
  
}


//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void makeSnow() {

  for (Snow s : blizzard) {

    s.display();
    hasRelaunched = false;
    if (clicking && hasSunk && !hasRelaunched) {

      
      s.relaunch();
      
      hasRelaunched = true;
    }
    if (hasRelaunched) {

      if (sqrt(((s.getXPos()-1000)*(s.getXPos()-1000)) + ((s.getYPos()-500)*(s.getYPos()-500)))>=390) {
        s.turnAround();
        
      }
      s.move();
    } else if (clicking) {
      if (sqrt(((s.getXPos()-1000)*(s.getXPos()-1000)) + ((s.getYPos()-500)*(s.getYPos()-500)))>=390) {
        s.turnAround();
      }
      s.move();
    } else if (clicking == false && numClicks>0) {
      if (sqrt(((s.getXPos()-1000)*(s.getXPos()-1000)) + ((s.getYPos()-500)*(s.getYPos()-500)))>=390) {
        s.turnAround();
      }
      s.sink();

      s.move();
      hasSunk = true;
      hasRelaunched = false;
    }
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
void clickHere() {


  fill(215, 203, 55);
  rect(850, 838, 300, 75);
  textFont(stringWords, 50);
  fill(0);
  text("Click Me", 905, 890);



  if (mousePressed && mouseX>850 && mouseX<1150 && mouseY>838 && mouseY<913) {
    clicking = true;
    numClicks++;
    fill(198, 187, 65);
    rect(850, 838, 300, 75);
  } else {
    clicking = false;
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void message() {

  textFont(stringWords, 100);
  fill(0);
  text("Happy", 200, 750);
  text("Holidays", 1500, 750);
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void elf() {

  elfPic.resize(300, 550);
  image(elfPic, elfLocation.x, elfLocation.y);

  if (clicking) {
    elfLocation.add(elfShiver);

    elfShiver.mult(-1);
  }
}

//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

void lights() {
  if (lightCounter%50==0) {
    red = true;
    green = false;
  } else if (lightCounter%25==0) {
    red = false;
    green = true;
  }
  lightCounter++;
  if (green) {
    fill(0, 255, 0);
    ellipse(1000, 100, 20, 20);                   
    ellipse(600, 500, 20, 20);
    ellipse(1400, 500, 20, 20);
    ellipse(1346, 300, 20, 20);
    ellipse(1200, 154, 20, 20);
    ellipse(800, 154, 20, 20);
    ellipse(654, 300, 20, 20);
    ellipse(654, 700, 20, 20);
    ellipse(1346, 700, 20, 20);
  } else {
    fill(8, 100, 8);
    ellipse(1000, 100, 20, 20);                   
    ellipse(600, 500, 20, 20);
    ellipse(1400, 500, 20, 20);
    ellipse(1346, 300, 20, 20);
    ellipse(1200, 154, 20, 20);
    ellipse(800, 154, 20, 20);
    ellipse(654, 300, 20, 20);
    ellipse(654, 700, 20, 20);
    ellipse(1346, 700, 20, 20);
  }


  if (red) {
    fill(255, 0, 0);
    ellipse(717, 220, 20, 20);
    ellipse(717, 780, 20, 20);
    ellipse(1283, 220, 20, 20);
    ellipse(1283, 780, 20, 20);
    ellipse(614, 604, 20, 20);
    ellipse(614, 396, 20, 20);
    ellipse(896, 114, 20, 20);
    ellipse(1104, 114, 20, 20);
    ellipse(1386, 396, 20, 20);
    ellipse(1386, 604, 20, 20);
  } else {
    fill(100, 8, 8);
    ellipse(717, 220, 20, 20);
    ellipse(717, 780, 20, 20);
    ellipse(1283, 220, 20, 20);
    ellipse(1283, 780, 20, 20);
    ellipse(614, 604, 20, 20);
    ellipse(614, 396, 20, 20);
    ellipse(896, 114, 20, 20);
    ellipse(1104, 114, 20, 20);
    ellipse(1386, 396, 20, 20);
    ellipse(1386, 604, 20, 20);
  }
}

void sign(){
  textFont(stringWords,20);
  fill(0);
  text("Clayton McIntyre ACS",1700,980);
}