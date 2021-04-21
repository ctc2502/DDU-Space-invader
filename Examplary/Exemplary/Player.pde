class Player extends SpaceShip {
    boolean canShoot = true;
    int shootdelay = 0;

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

    void updateObj() {
        if (keyPressed && keyCode == LEFT) {
            x -= 10;
        }
        if (keyPressed && keyCode == RIGHT) {
            x += 10;
        }
        
        if (keyPressed && keyCode == UP && canShoot) {
            bullets.add(new Bullet(x, y));
            canShoot = false;
            shootdelay = 0;
        }
        
        shootdelay++;
        
        if (shootdelay >= 20) {
            canShoot = true;
        }
    }
}
