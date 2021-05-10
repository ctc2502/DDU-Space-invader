class Enemy extends SpaceShip {
    
    int hitpoints = 1;
    
    Enemy(int xpos, int ypos) {
        x = xpos+100;
        y = ypos;
        sprite    = new String[5];
        sprite[0] = "1011101";
        sprite[1] = "0101010";
        sprite[2] = "1111111";
        sprite[3] = "0101010";
        sprite[4] = "1000001";
        baseColor = color(200, 86, 80);
    }

    void updateObj(int speed) {
        fill(baseColor);
        if (frameCount%60 <= speed) {
            x += direction * gridsize;
            if (random(0, 100) < 10) {
            pellets.add(new Pellet(x, y+50));
             }
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
