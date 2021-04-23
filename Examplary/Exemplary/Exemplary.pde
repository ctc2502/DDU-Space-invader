int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player player;
ArrayList enemies = new ArrayList();
ArrayList bullets = new ArrayList();
ArrayList pellets = new ArrayList();
int direction = 1;
boolean incy = false;
int score = 0;
PFont f;
int Phase;
Table scoreBord;
PImage[] menuImg = new PImage[26];
PImage[] whiteFade = new PImage[10];
PImage SpaceShip, Background00;
int round = 1;
PImage Play01, Play02, Quit01, Quit02, Title;

PVector Button00 = new PVector(500, 400);
PVector Button01 = new PVector(500, 450);

void setup() {
  scoreBord = loadTable("sb.csv");
  boolean loaded = scoreBord == null;
  println("loaded: "+ loaded );
  
  background(0);
  frameRate(60);
  noStroke();
  size(800, 550);
  player = new Player();
  createEnemies();
  for (int i = 1; i < menuImg.length; i++) {
    menuImg[i] = loadImage( "SpaceRoad " + "(" + i + ")" + ".gif");
    menuImg[i].resize(width, height);
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

  SpaceShip = loadImage("Ship.png");
  SpaceShip.resize(50, 50);

  Background00 = loadImage("spaceBack.png");
  Background00.resize(width, height);
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
    image(Background00, 0, 0);
    noFill();
    rect(0, 0, width*0.98, height*0.98);
    drawScore();
    
    if (player.hp()) {
    player.display();
    } else {
    Phase = 0;
    }

    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = (Bullet) bullets.get(i);
      bullet.display();
    }
    
    for (int i = 0; i < pellets.size(); i++) {
      Pellet pellet = (Pellet) pellets.get(i);
      pellet.display();
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
      if (!alive(enemy.x, enemy.y, 1)) {
        enemies.remove(i);
      } else {
        enemy.display();
      }
    }
    if(score == 750*round){
      round++;
    createEnemies();
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

void keyReleased() {
  if (key == 32) {
   saveScore();
  }
}


void drawScore() {
  textFont(f);
  text("Score: " + String.valueOf(score), 300, 50);
}

void createEnemies() {
  for (int i = 0; i < 5/*width/gridsize/2*/; i++) {
    for (int j = 0; j <= 2; j++) {
      enemies.add(new Enemy(i*gridsize, j*gridsize + 70));
    }
  }
}



void saveScore() {
  try {
  int i = scoreBord.getRowCount();
  scoreBord.setString(i, 0, "AlbertGaming");
  scoreBord.setString(i,1,""+score);
  scoreBord.setString(i,2,"Day: " + day()+" Month: " + month()+ " Hour: " + hour() + " Min: " + minute());
  saveTable(scoreBord, "data/sb.csv");
}
catch(Exception e) {
  println();
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
      player.life = 3;
      score = 0;
      //createEnemies();
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

boolean alive(int x, int y, int life) {
        for (int i = 0; i < bullets.size(); i++) {
            Bullet bullet = (Bullet) bullets.get(i);
            
            if (bullet.x > x && bullet.x < x + 7 * pixelsize + 5 && bullet.y > y && bullet.y < y + 5 * pixelsize) {
                bullets.remove(i);
                
                life--;
                
                
                if (life == 0) {
                    score += 50;
                    
                    return false;
                }
                
                break;
            }
        }

        return true;
    }
