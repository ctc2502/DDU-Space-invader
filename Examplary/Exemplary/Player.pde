class Player extends SpaceShip {
    boolean canShoot = true;
    int shootdelay = 0;
    int life = 3;

    Player() {
        x = width/gridsize/2;
        y = height - (10 * pixelsize);
        sprite    = new String[5];
        sprite[0] = "0110110";
        sprite[1] = "0110110";
        sprite[2] = "1111111";
        sprite[3] = "1111111";
        sprite[4] = "0111110";
        baseColor = color(22, 86, 200);
        
    }

    void updateObj(int speed) {
        if (keyPressed) {
          if (key == 'A' || key == 'a') {
            x -= speed;
        } 
        if (key == 'D' || key == 'd') {
            x += speed;
        }
        
        if ((key == 'W' || key == 'w') && canShoot) {
            bullets.add(new Bullet(x, y));
            canShoot = false;
            shootdelay = 0;
          }
        }
        
        shootdelay++;
        
        if (shootdelay >= 20) {
            canShoot = true;
        }
    }
    
    boolean hp() {
        for (int i = 0; i < pellets.size(); i++) {
            Pellet pellet = (Pellet) pellets.get(i);
            
            if (pellet.x > x && pellet.x < x + 7 * pixelsize + 5 && pellet.y > y && pellet.y < y + 5 * pixelsize) {
                pellets.remove(i);
                
                life--;  
                if (life == 0) {
                      score += 50;
                    //printl
                    return false;
                }
                break;
            }
        }

        return true;
    }
}
