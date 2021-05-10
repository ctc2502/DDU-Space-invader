class Enemy2 extends SpaceShip {
  
  boolean leftright = false;
  
  Enemy2(int xpos, int ypos) {
  x = xpos;
  y = ypos;
  sprite    = new String[5];
  sprite[0] = "1111111";
  sprite[1] = "1111111";
  sprite[2] = "1111111";
  sprite[3] = "1111111";
  sprite[4] = "1111111";
  }
  
  void updateObj(int speed) {
        fill(baseColor);
        if (frameCount%60 <= speed) {
            x += direction * gridsize*2;
        }
        
        if (incy == true) {
            y += gridsize / 2;
        }
       
        if (y >= 500) {
          player.life = 0;
        }
        //println(y);
    }
    
    boolean outside() {
        return x + (direction*gridsize) < 10 || x + (direction*gridsize) > width - gridsize;
    }
}
