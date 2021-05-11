class Enemy3 extends SpaceShip {
    
    int hitpoints = 1;
    
    Enemy3(int xpos, int ypos) {
        x = xpos-150;
        y = ypos;
        sprite    = new String[5];
        sprite[0] = "0010000100";
        sprite[1] = "0001001000";
        sprite[2] = "0011111100";
        sprite[3] = "0110110110";
        sprite[4] = "1111111111";
        baseColor = color(200, 150, 86);
    }

    void updateObj(int speed) {
        fill(baseColor);
        if (frameCount%15 <= speed) {
            x += gridsize;
            if (random(0, 100) < 10) {
            pellets.add(new Pellet(x, y+50));
             }
        }
 
        //println(y);
    }

    boolean outside() {
        return x + (direction*gridsize) < 10 || x + (direction*gridsize) > width - gridsize;
    }
    
    boolean alive() {
  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);

    if (bullet.x > x && bullet.x < x + 10 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
      bullets.remove(i);
      hitpoints--;
      if (hitpoints == 0) {
        score += 100;
        int random = int(random(0, 3));
        
       if (random == 2) {
       for  (int H = 0; H < barrier.length; H++) {
        barrier[H].life = 3;
        }
        armorUp.play();
        println("DEFENSE UP");
       } else if (random == 1){
        player.life++;
        println("EXTRA LIFE");
        lifeUp.play();
       } else if (random == 0){
        player.powerup = true;
        println("SPEED");
       }
       
        return false;
    }

      break;
    }
  }

  return true;
  }
}
