PShape x;

void setup() {
  size(640, 640, P2D);
  frameRate(15);
  noSmooth();
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

PShape[] letters = {TShape(), HShape()};

void draw() {
  background(0);
  fill(255);
  stroke(255);
  //shapeMode(CENTER);
  pushMatrix();
  translate(width / 2, height / 2);
  scale(1);
  x = HShape();
  PShape newShape = createShape();
    newShape.beginShape();
          newShape.fill(0);
    newShape.stroke(255);
    newShape.strokeWeight(2);

  for (int i = 0; i < x.getVertexCount(); i++) {
    PVector v = x.getVertex(i);
    
    newShape.vertex(v.x + random(-2, 2), v.y + random(-2, 2));
  }
  newShape.endShape(CLOSE);
  shape(newShape, 0, 0);
  popMatrix();
}
