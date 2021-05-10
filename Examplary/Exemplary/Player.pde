class Player extends SpaceShip {
    boolean canShoot = true;
    int shootdelay = 0;
    int life = 3;
    boolean left,right;
    PVector velocity = new PVector();

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
      
      x += int(velocity.x) * speed;
        if (keyPressed) {

        if (run) {

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
                break;
            }
            
        }
        if (life <= 0) {
                    
                    //printl
                    return false;
                }
        return true;
    }
    
    void controls(char key,int keyCode,boolean pressed){
       velocity.set(0,0);
    if (key != CODED)
      switch(key){
      case'A':
      case 'a':{
        left=pressed;
      }break;
      
      case'D':
      case'd':{
      right=pressed;
      }break;
      case 'w':
      case'W':{
      if(pressed && canShoot){
                 bullets.add(new Bullet(x, y));
            canShoot = false;
            shootdelay = 0;
            }
      }break;
   
   
        
      
      }
velocity.set((right?1:0)-(left?1:0),0);    
    
    }
}
