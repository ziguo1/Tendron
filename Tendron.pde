int x = 0, y = 0;

public void setup() {
  size(512, 512);  
  background(96);
  x = width / 2; 
  y = height / 2;
  frameRate(10);
}

public void draw() {
  background(96);
  x = mouseX;
  y = mouseY;
  for (int i = 0; i < 10; i++) {
    drawTendron(3, (2 * Math.PI / 10) * i, x, y);
  }
}

void drawTendron(int nLayers, double angle, int x, int y) {
  if (nLayers == 0) return;
  else if (nLayers == 3) stroke(color(254, 232, 185));
  else if (nLayers == 2) stroke(color(80, 226, 50));
  else if (nLayers == 1) stroke(color(245, 37, 59));
  
  int len = (int) Math.pow(nLayers, 4.8), step = 5;
  if (nLayers == 1) len = 5;
  
  for (int i = 0; i < len; i += step) {
    angle += (Math.random() > 0.5 ? -1 : 1) * 0.15;
    float newX = x + (float) Math.cos(angle) * step, newY = y + (float) Math.sin(angle) * step;
    line(x, y, newX, newY);
    x = (int) newX;
    y = (int) newY;
  }
  
  nLayers--;
  for (int i = 0; i < 10; i++) {
    drawTendron(nLayers, (2 * Math.PI / 10) * i, x, y);
  }
}
