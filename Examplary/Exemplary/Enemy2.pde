class Enemy2 extends SpaceShip {
  
  boolean leftright = false;
  
  Enemy2(int xpos, int ypos) {
  x = xpos;
  y = ypos;
  sprite    = new String[5];
  sprite[0] = "1011101";
  sprite[1] = "0101010";
  sprite[2] = "1111111";
  sprite[3] = "0101010";
  sprite[4] = "1000001";
  }
  
  void updateObj(int start, int end) {
        /*if (x >= start && leftright == false) {
        x++;
        } else if (leftright == true) {
        x--;
        }
    
        if (x >= end) {
        leftright = true;
        } else if (x == start) {
        leftright = false;
        }*/
      }
}
