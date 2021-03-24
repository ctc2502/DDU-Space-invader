PLAYER SHIP;
boolean[] keys = new boolean[128];

void setup() {
  size(1200, 800);
  smooth();
  SHIP = new PLAYER();
}

void draw() {
  background(51);
  SHIP.show(); 
}

void keyPressed() {
  keys[key] = true;
  SHIP.move(10);
}

void keyReleased() {
  keys[key] = false;
}
