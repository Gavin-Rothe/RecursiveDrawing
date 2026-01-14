void setup() {
  size(800, 800);
  background(255);
  noFill();
  stroke(0);
//loc of start
  drawCircles(width/2, height - 100, 10, -PI/2, 6);
}

void draw() {
}

void drawCircles(float x, float y, float r, float angle, int depth) {
  if (depth == 0) return;

  // draw first circle
  circle(x, y, r);

  // distance to next circles
  float dist = r * 10;

  // angle spread
  float angleOffset = PI / 12;

  // left child
  float x1 = x + cos(angle - angleOffset) * dist;
  float y1 = y + sin(angle - angleOffset) * dist;

  // right child
  float x2 = x + cos(angle + angleOffset) * dist;
  float y2 = y + sin(angle + angleOffset) * dist;

  // recursive calls (smaller circles)
  drawCircles(x1, y1, r, angle - angleOffset, depth - 1);
  drawCircles(x2, y2, r, angle + angleOffset, depth - 1);
}
