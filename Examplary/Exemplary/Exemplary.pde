int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player player;
ArrayList enemies = new ArrayList();
ArrayList bullets = new ArrayList();
int direction = 1;
boolean incy = false;
int score = 0;
PFont f;
int Phase;
PImage[] menuImg = new PImage[26];
PImage[] whiteFade = new PImage[10];

PImage Play01, Play02, Quit01, Quit02, Title;

    PVector Button00 = new PVector(500, 400);
    PVector Button01 = new PVector(500, 450);

void setup() {
    background(0);
    frameRate(60);
    noStroke();
    size(800, 550);
    player = new Player();
    createEnemies();
    for (int i = 1; i < menuImg.length; i++) {
    menuImg[i] = loadImage( "SpaceRoad " + "(" + i + ")" + ".gif");
    menuImg[i].resize(width,height);
  }
    Play01 = loadImage("PlayOFF.png");
    Play01.resize(1938/8, 334/8);
    Play02 = loadImage("PlayON.png");
    Play02.resize(2192/8, 584/8);
    
    Quit01 = loadImage("QuitOFF.png");
    Quit01.resize(1938/8, 334/8);
    Quit02 = loadImage("QuitON.png");
    Quit02.resize(2192/8, 584/8);
    
    Title = loadImage("Tilte.png");
    Title.resize(1307/3, 846/3);
    f = createFont("Arial", 36, true);
}

void draw() {
    background(0);
    
    switch(Phase) {
  case -6:
    //kode
    break;
  case -5:
    //kode
    break;
  case -4: 
    //kode
    break;
  case -3:
    //kode
    break;
  case -2:
    //kode
    break;
  case -1:
    //kode
    
    break;
  default:
    //kode
    
    if (menuImg[frameCount%24]!= null) {
    image(menuImg[frameCount%24], 0, 0);
      }
    if (overRec(Button00.x, Button00.y, 1938/8, 334/8)) { 
      image(Play02, Button00.x-15, Button00.y-15);
    } else {
      image(Play01, Button00.x, Button00.y);
    }
    
    if (overRec(Button01.x, Button01.y, 1938/8, 334/8)) { 
      image(Quit02, Button01.x-15, Button01.y-15);
    } else {
      image(Quit01, Button01.x, Button01.y);
    }
    image(Title, width/2-225, height/2-200);
    break;  
  case 1:
    //kode
    
    drawScore();

    player.draw();

    for (int i = 0; i < bullets.size(); i++) {
        Bullet bullet = (Bullet) bullets.get(i);
        bullet.draw();
    }

    for (int i = 0; i < enemies.size(); i++) {
        Enemy enemy = (Enemy) enemies.get(i);
        if (enemy.outside() == true) {
            direction *= (-1);
            incy = true;
            break;
        }
    }

    for (int i = 0; i < enemies.size(); i++) {
        Enemy enemy = (Enemy) enemies.get(i);
        if (!enemy.alive()) {
            enemies.remove(i);
        } else {
            enemy.draw();
        }
    }

    incy = false;
    
    break;  
  case 2:
    //kode
    break;
  case 3:
    //kode
    break;
  }
}

void drawScore() {
    textFont(f);
    text("Score: " + String.valueOf(score), 300, 50);
}

void createEnemies() {
    for (int i = 0; i < width/gridsize/2; i++) {
        for (int j = 0; j <= 5; j++) {
            enemies.add(new Enemy(i*gridsize, j*gridsize + 70));
        }
    }
}

void mousePressed() {
  switch(Phase) {
  case -6:
    //kode
    break;
  case -5:
    //kode
    break;
  case -4: 
    //kode
    break;
  case -3:
    //kode
    break;
  case -2:
    //kode
    break;
  case -1:
    //kode
    
    break;
  default:
    //kode
    if (overRec(Button00.x, Button00.y, 1938/8, 334/8)) { 
      Phase = 1;
    }
    if (overRec(Button01.x, Button01.y, 1938/8, 334/8)) { 
      exit();
    }
    break;  
  case 1:
    //kode
    break;  
  case 2:
    //kode
    break;
  case 3:
    //kode
    break;
  }
}

boolean overRec(float x, float y, float w, float h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}
