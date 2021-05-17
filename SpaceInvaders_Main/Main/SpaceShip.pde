class SpaceShip {
    int x, y;
    String sprite[];
    color baseColor;
    //color nextColor = baseColor;

    void display(int velo) {
        updateObj(velo);
        drawSprite(x, y);
    }
  
    void drawSprite(int xpos, int ypos) {
        fill(baseColor);
        
        //nextColor = baseColor;
        //image(SpaceShip, xpos, ypos);
        for (int i = 0; i < sprite.length; i++) {
            String row = (String) sprite[i];
            for (int j = 0; j < row.length(); j++) {
                if (row.charAt(j) == '1') {
                  strokeWeight(0);
                  noStroke();
                  rect(xpos+(j * pixelsize), ypos+(i * pixelsize), pixelsize, pixelsize);  
                }
            }
        }
        
    }

    void updateObj(int speed) {
      
    }
}
