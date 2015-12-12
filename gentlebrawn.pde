PShape gendurbrang, gantlebing;
PImage sebastian;
/* @pjs preload="elgreco.png,gantleBung.svg,gantleBungLater.svg"; */
/* @pjs font="ComicSansMS.ttf"; */

int unit = 100; //hehe unit
float centerX, centerY, randX, randY, allConsumingEntropy;
float mouseAngle, amtX, amtY;
float sebastianWidth, sebastianHeight;
float hideYourShame = 1.0;
boolean transitioning; //aren't we all
boolean gay = true, superGay = false;
boolean iHaveNoMouthAndIMustMeme;

String[] labels = new String[] { "Gender Identity",
  "Gender Expression",
  "Biological Sex",
  "Sexual Orientation"
};

int illuminati = 300;

PVector[] points = new PVector[] {
  new PVector(-illuminati, 0),
  new PVector(illuminati, 0),
  new PVector(0, -sqrt(pow(illuminati*2,2)-pow(illuminati,2))),
};

void setup() {
  size(800, 600);
  smooth();
  colorMode(HSB,100, 100, 100, 255);
  
  frameRate(30);
  
  // a colony of writhing maggots
  gendurbrang = loadShape("gantleBung.svg");
  gendurbrang.disableStyle(); // ZE HAS NO STYLE ZE HAS NO GRACE
  
  gantlebing = loadShape("gantleBungLater.svg");
  gantlebing.disableStyle(); // this kong has a circle face

  shapeMode(CENTER);
  
  textFont(loadFont("ComicSansMS"),24);

  sebastian = loadImage("elgreco.png");
  sebastianHeight = height;
  sebastianWidth = (500/642.0) * sebastianHeight;
  imageMode(CENTER);

  centerX = width/2;
  centerY = height/2;
}

void draw() {
  // darkness
  background(0);
  
  allConsumingEntropy += 0.001;
  
  if (gay) { // always
    randX = lerp(randX, random(allConsumingEntropy), 0.5);
    randY = lerp(randY, random(allConsumingEntropy), 0.5);
  }

  mouseAngle = atan2(mouseY - centerY, mouseX - centerX);
  amtX = abs(mouseX - pmouseX)*0.5 + 1.0;
  amtY = abs(mouseY - pmouseY)*0.5 + 1.0;


  if (mousePressed && frameCount > 300) { // give it time
    transitioning = true;
  }
  
  if (transitioning) {
    if (!iHaveNoMouthAndIMustMeme) {
      noMore();
      iHaveNoMouthAndIMustMeme = true;
    }
    if (hideYourShame <= 0.0) {
      hideYourShame = 0.0;
      transitioning = false;
      superGay = true;
    }
    
    hideYourShame -= 0.005;
    
    jintlabang();
    sanSebas();
  } else {
    if (superGay) {
      sanSebas();
    } else {
      jintlabang();
      drawLabels();
    }   
  }
  corruptText();
}

void drawGendurBrang(float X, float Y, float visible) {
  pushMatrix(); // shove it down and repress
  translate(X, Y);
  
  scale(0.75);
  
  strokeWeight(5);
  stroke(255, 255.0*visible);
  noFill();

  // now the hot stinking ganterbreath is forming
  shape(gendurbrang);
  popMatrix();
  // you can function again in society // HAHA J/K!!
}

void drawGantleBing(float hidden) { 
  pushMatrix();
  translate(centerX, centerY + 120);
  strokeWeight(5);
  stroke(255, hidden * 200.0);
  noFill();
  shape(gantlebing);
  popMatrix();
}

void jintlabang() {
  for (int i = -3; i < 3; i++) {
    float X = centerX + i*unit*cos(mouseAngle)*randX*amtX + random(allConsumingEntropy);
    float Y = centerY + i*unit*sin(mouseAngle)*randY*amtY + random(allConsumingEntropy);
  
    if (!transitioning || (transitioning && i == 0)) { 
      //BEHOLD!!!!!
      drawGendurBrang(X, Y, hideYourShame);
    }
  }
}

void sanSebas() {
  if (!superGay) {
    tint(255, 255 * (1.0 - hideYourShame));
  }
  image(sebastian, centerX, centerY, sebastianWidth, sebastianHeight);

  drawGantleBing(1.0 - hideYourShame);
  pierceThisFool();
}

void pierceThisFool() {
  drawArrow(1 * unit + 60, height - 160, int(hideYourShame * 100.0), 8, labels[0]);
  drawArrow(1 * unit - 20, centerY + 10, int(hideYourShame * 100.0), -3, labels[1]);
  drawArrow(6.5 * unit, centerY + 40, int(hideYourShame * 100.0), 183, labels[2]);
  drawArrow(6.3 * unit, centerY - 140, int(hideYourShame * 100.0), 160, labels[3]);
}

void drawLabels() {
  // technologies of heterosexual coercion
  float total = int(min(allConsumingEntropy, 6.66)*100) + 100;
  float innerTotal = 5;
  for (int i = 0; i < total; i++) {
    fill(0, 100, 100, 64);
    for (int j = 0; j < innerTotal; j++) {
      //text(labels[i % 4], (width * (j/innerTotal)) + random(allConsumingEntropy), (height * (i/total)) + random(allConsumingEntropy));
      text(labels[i % 4], random(width), random(height));
    }
    
    PVector pos = triPoint(i, total);
    fill(0, 100, 100, 128);
    text(labels[i % 4], pos.x, pos.y);
  }
}

PVector triPoint(int i, int total) {
  // Batter my heart, three-person'd God
  float seg = total / 3.0;
  int j = int(i / seg);
  
  float between = (i - (j * seg))/seg;
  float x = centerX - 75 + lerp(points[j].x, points[(j+1) % 3].x, between); 
  float y = centerY + 270 + lerp(points[j].y, points[(j+1) % 3].y, between); 

  return new PVector(x, y);
}

void drawArrow(float X, float Y, int soFar, float angle, String label) {
  pushMatrix();
  translate(X, Y);
  rotate(radians(angle));
  noStroke();
  
  int inc = 2;
  for (int i = 0; i < 100; i += inc) {
    fill(i, 100, 100, (1.0 - hideYourShame) * 200.0);
    if (i >= soFar) {
      rect(199 - (2*i) -1, 0, (2*inc)+2, 10);
    }
  }
  
  if (soFar <= 0) {
    pushMatrix();
    translate(200,10);
    rotate(radians(225));
    rect(0, 0, 40, 10);
    rotate(radians(270));
    rect(0, 0, 30, 10);
    popMatrix();
  }

  for (int i = label.length(); i >= 0; i--) {
    float c = 100.0 * float(i) / label.length();
    noStroke();
    fill(c, 100, 100, (1.0 - hideYourShame) * 200.0);
    if (c >= soFar) {
      text(label.charAt(label.length() - i), (label.length() - i)*15, -5);
    }
  }
  
  popMatrix();
}

void corruptText() {
  if (random(1.0) > 0.97) {
    int i = int(random(labels.length));
    int j = int(random(labels[i].length()));
    String begin = labels[i].substring(0, j);
    String end = labels[i].substring(j+1);
    char c = sigil(int(pow(2,random(16))) + 31);
    labels[i] = begin + c + end;
  }
}