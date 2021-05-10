class Enemy2 extends SpaceShip {
  
  boolean leftright = false;
  
  int hitpoints = 3;
  
  Enemy2(int xpos, int ypos) {
  x = xpos;
  y = ypos+150;
  sprite    = new String[5];
  sprite[0] = "0011100";
  sprite[1] = "0111110";
  sprite[2] = "1101011";
  sprite[3] = "1111111";
  sprite[4] = "1110111";
  baseColor = color(200, 86, 150);
  }
  
  void updateObj(int speed) {
        fill(baseColor);
        if (frameCount%30 <= speed) {
            x += direction * gridsize;
        }
        
        if (incy == true) {
            y += gridsize;
        }
       
        if (y >= 500) {
          player.life = 0;
        }
        //println(y);
    }
    
    boolean outside() {
        return x + (direction*gridsize) < 10 || x + (direction*gridsize) > width - gridsize;
    }
   boolean alive(int x, int y) {
  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);

    if (bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
      bullets.remove(i);
      hitpoints--;
      if (hitpoints == 0) {
        score += 50;

        return false;
    }

      break;
    }
  }

  return true;
}
}
