void setup() {
  size(800, 800);
  background(255);
  fill(255, 0, 0);
  stroke(255, 0, 0);
//loc of start
  drawCircles(width/2, height - 100, 2, -PI/2, 6);
}

void draw() {
}

void drawCircles(float x, float y, float r, float angle, int depth) {
  if (depth == 0) return;

  //first circle
  circle(x, y, r);

  float dist = random(r * 10, r * 80);

  float angleOffset = random(PI / 24, PI / 12);

  //left
  float x1 = x + cos(angle - angleOffset) * dist;
  float y1 = y + sin(angle - angleOffset) * dist;

  //right
  float x2 = x + cos(angle + angleOffset) * dist;
  float y2 = y + sin(angle + angleOffset) * dist;
  
  strokeWeight(depth);
  noFill();
  curve(random(x-100, x+100), random(y-100, y+100), x, y, x1, y1, random(x1-100, x1+100), random(y1-100, y1+100));
  curve(random(x-100, x+100), random(y-100, y+100),x, y, x2, y2, random(x2-100, x2+100), random(y2-100, y2+100));

  //recursive
  drawCircles(x1, y1, r, angle - angleOffset, depth - 1);
  drawCircles(x2, y2, r, angle + angleOffset, depth - 1);
}
