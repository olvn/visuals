PShape x;
PShape[] letters = new PShape[5];
int rb = 1;
float SCALEFACTOR = 1.3;

void setup() {
  //fullScreen();
  size(640, 480);
  frameRate(19);
  noSmooth();
  letters[0] = TShape();
  letters[1] = HShape();
    letters[2] = XShape();
    letters[3] = ExBarShape();
    letters[4] = ExDotShape();
  colorMode(HSB, 100);
}

PShape TShape() {
  PShape s = createShape();
  s.beginShape();
  s.fill(0);
  s.stroke(255);
  s.strokeWeight(2);
  s.vertex(0, 0);
  s.vertex(100, 0);
  s.vertex(100, 20);
  s.vertex(60, 20);
  s.vertex(60, 100);
  s.vertex(40, 100);
  s.vertex(40, 20);
  s.vertex(0, 20);
  s.endShape(CLOSE);
return s;
}

PShape funky() {
  PShape s = createShape();
  s.beginShape();
  s.fill(0);
  s.stroke(255);
  s.strokeWeight(2);
  s.vertex(0, 0);
  s.vertex(20, 0);
  s.vertex(20, 40);
  s.vertex(80, 40);
  s.vertex(80, 0);
  s.vertex(40, 100);
  s.vertex(40, 20);
  s.vertex(0, 20);
  s.endShape(CLOSE);
return s;
}

PShape ExBarShape() {
  PShape s = createShape();
  s.beginShape();
  s.vertex(40, 0);
  s.vertex(60, 0);
  s.vertex(55, 85);
  s.vertex(45, 85);
  s.endShape(CLOSE);
  return s;
}


PShape ExDotShape() {
  PShape s = createShape();
  s.beginShape();
  s.vertex(55, 90);
  s.vertex(55, 100);
  s.vertex(45, 100);
  s.vertex(45, 90);
  s.endShape(CLOSE);
  return s;
}

PShape XShape() {
  PShape s = createShape();
  s.beginShape();
  s.noFill();
  s.stroke(255);
  s.strokeWeight(1);
  s.vertex(0, 0);
  s.vertex(25, 0);
  s.vertex(50, 35);
  s.vertex(75, 0);
  s.vertex(100, 0);
  s.vertex(65, 50);
  s.vertex(100, 100);
  s.vertex(75, 100);
  s.vertex(50, 65);
  s.vertex(25, 100);
  s.vertex(0, 100);
  s.vertex(35, 50);  
  s.endShape(CLOSE);
  return s;
}

PShape HShape() {
  PShape s = createShape();
  s.beginShape();
  s.fill(0);
  s.stroke(255);
  s.strokeWeight(1);
  s.vertex(0, 0);
  s.vertex(20, 0);
  s.vertex(20, 40);
  s.vertex(80, 40);
  s.vertex(80, 0);
  s.vertex(100, 0);
  s.vertex(100, 100);
  s.vertex(80, 100);
  s.vertex(80, 60);
  s.vertex(20, 60);
s.vertex(20, 100);
s.vertex(0, 100);
  s.endShape(CLOSE);
  return s;
}


void draw() {
  //background(abs((sin(2 * frameCount / 100.0) + 1) * 255), abs((sin(3 * frameCount / 100.0) + 1) * 255), abs((sin(2.5 * frameCount / 100.0) + 1) * 255));
  for (int i = 0; i < 16; i++) {
    int rr1 = round(random(-rb, rb));
    int rr2 = round(random(-rb, rb));
    int rr3 = round(random(-rb, rb));
    int rr4 = round(random(-rb, rb));
    int rr5 = round(random(-rb, rb));
    int rr6 = round(random(-rb, rb));
        int rr7 = round(random(-rb, rb));
    int rr8 = round(random(-rb, rb));


    print(rr1, rr2, rr3, rr4, "\n");

    fill((frameCount + (100 / 10) * i) % 100, 100, 100);
    quad(width * (i / 16.0) + rr1, 
          0 + rr2,
          width * ((i + 1) / 16.0) + rr3,
          0 + rr4,
          width * ((i + 1) / 16.0) + rr5, 
          height + rr6,
          width * (i / 16.0) + rr7,
          height + rr8); 
  }
  
  fill(255);
  //stroke(100, 100, 100);
  noStroke();
  shapeMode(CENTER);
  strokeWeight(4);

  // draw T
  pushMatrix();

  translate(width / 2 - 150, height / 2);
      scale(SCALEFACTOR);

    //scale(frameCount / 100.0, 1);
  drawShape(TShape());
  popMatrix();
  
  // draw H
  pushMatrix();
  translate(width / 2 - 10, height / 2);
      scale(SCALEFACTOR);

  drawShape(HShape());
  popMatrix();
  
  //draw x
  pushMatrix();
  translate(width /2, height / 2);
      scale(SCALEFACTOR);

  drawShape(XShape());
  popMatrix();
  
  // draw !
  pushMatrix();
  translate(width / 2 + width / 7, height / 2 - 10);
      scale(SCALEFACTOR);

  drawShape(ExBarShape());
    translate(-3, 10);

  drawShape(ExDotShape());
  popMatrix();
}


void drawShape(PShape s) {
    //rb = round((sin(frameCount / 100.0) + 1) * 20.0 + 1);
    PShape newShape = createShape();
    newShape.beginShape();
    newShape.noFill();
    newShape.stroke(0, 0, 100);
    newShape.strokeWeight(2);

    for (int j = 0; j < s.getVertexCount(); j++) {
      PVector v = s.getVertex(j);
      
      newShape.vertex(v.x + random(-rb, rb), v.y + random(-rb, rb));
    }
    newShape.endShape(CLOSE);
    shape(newShape, 0, 0);
}
