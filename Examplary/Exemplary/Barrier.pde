class Barrier extends SpaceShip {
    
    int life = 3;
    
    Barrier(int xpos) {
        x = xpos;
        y = 400;
        sprite    = new String[5];
        sprite[0] = "00111111111100";
        sprite[1] = "11111111111111";
        sprite[2] = "11111111111111";
        sprite[3] = "11111000011111";
        sprite[4] = "11110000001111";
        baseColor = color(22, 186, 100);
    }

    void updateObj() {
        fill(baseColor);
        //println(y);
    }
    
    boolean hp() {
        for (int i = 0; i < pellets.size(); i++) {
            Pellet pellet = (Pellet) pellets.get(i);  
            
            if (life > 0) {
            if (pellet.x > x && pellet.x < x + 14 * pixelsize + 5 && pellet.y > y && pellet.y < y + 5 * pixelsize) {
                pellets.remove(i);
                life--;  
                break;
              }
            }
            
        }
        if (life <= 0) {
                    
                    //printl
                    return false;
                }
        return true;
  }
} 
