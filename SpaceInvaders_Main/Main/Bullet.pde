class Bullet {
    int x, y;

    Bullet(int xpos, int ypos) {
        x = xpos + gridsize/2 - 4;
        y = ypos;
    }

    void display(int rate) {
        fill(255);
        rect(x, y, pixelsize, pixelsize);
        y -= rate;
    }
}
