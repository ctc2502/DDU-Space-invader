class PLAYER {
  PVector shipPos = new PVector(width/2, height-20);
  
  PLAYER() {
  }
  
  void show() {
    fill(255);
    rect(shipPos.x, shipPos.y, 20, 20);
  }
  
  void move(int shipSpd) {
    if (keys['d'] == true)
    shipPos.x = shipPos.x + shipSpd;
    else if (keys['a'] == true)
    shipPos.x = shipPos.x - shipSpd;
  }
}
