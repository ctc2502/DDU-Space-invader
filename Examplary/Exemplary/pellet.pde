class Pellet {
  int x, y;

    Pellet(int xpos, int ypos) {
        x = xpos + gridsize/2 - 4;
        y = ypos;
    }

    void display() {
        fill(255);
        rect(x, y, pixelsize, pixelsize);
        y += pixelsize * 2;
    }
}
