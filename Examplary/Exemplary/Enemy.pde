class Enemy extends SpaceShip {
    
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
}
