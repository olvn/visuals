PShape x;
PShape[] letters = new PShape[5];

void setup() {
  size(640, 640, P2D);
  frameRate(15);
  noSmooth();
  letters[0] = TShape();
  letters[1] = HShape();
    letters[2] = XShape();
    letters[3] = ExBarShape();
    letters[4] = ExDotShape();

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
  background(0);
  fill(255);
  stroke(255);
  shapeMode(CENTER);
  
  // draw T
  pushMatrix();

  translate(width / 2 - 100, height / 2);
    //scale(frameCount / 100.0, 1);
  drawShape(TShape());
  popMatrix();
  
  // draw T
  pushMatrix();
  translate(width / 2, height / 2);
  drawShape(HShape());
  popMatrix();
  
  //draw x
  pushMatrix();
  translate(width /2 + 100, height / 2);
  drawShape(XShape());
  popMatrix();
  
  // draw !
  pushMatrix();
  translate(width / 2 + 130, height / 2 - 10);
  drawShape(ExBarShape());
    translate(-3, -30);

  drawShape(ExDotShape());
  popMatrix();
}


void drawShape(PShape s) {
    PShape newShape = createShape();
    newShape.beginShape();
    newShape.noFill();
    newShape.stroke(255);
    newShape.strokeWeight(1);

    for (int j = 0; j < s.getVertexCount(); j++) {
      PVector v = s.getVertex(j);
      
      newShape.vertex(v.x + random(-2, 2) + sin(frameCount / 10.0 / 3.0) * 20, v.y + random(-2, 2) + cos(frameCount / 10.0 / 3.0) * 20);
    }
    newShape.endShape(CLOSE);
    shape(newShape, 0, 0);
}
