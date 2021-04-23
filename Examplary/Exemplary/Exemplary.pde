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
PImage[] menuImg;
PImage[] whiteFade = new PImage[10];
PImage SpaceShip, Background00;
int round = 1;
PImage Play01, Play02, Quit01, Quit02, Start01, Start02, Help01, Help02, Title;

PVector Button00 = new PVector(500, 400);
PVector Button01 = new PVector(500, 450);

int OFFSizeW = Math.round(1938/8);
int OFFSizeH = Math.round(334/8);
int ONsizeW = Math.round(2192/8);
int ONsizeH = Math.round(584/8);

boolean gameStart = false;

Animation menu01, transition;

void setup() {
  smooth();
  scoreBord = loadTable("sb.csv");
  boolean loaded = scoreBord == null;
  println("loaded: "+ loaded );
  
  background(0);
  
  noStroke();
  size(800, 550);
  player = new Player();
  createEnemies();

  /*menuImg = new PImage[21];
  for (int i = 1; i < menuImg.length; i++) {
    menuImg[i] = loadImage( "SpaceMan " + "(" + i + ")" + ".gif");
    menuImg[i].resize(width, height);
  }*/
  
  menu01 = new Animation("SpaceMan/SpaceMan", ").gif", 20, width, height);
  transition = new Animation("Fade/White", ").png", 11, width, height);
  
  Play01 = loadImage("PlayOFF.png");
  Play01.resize(OFFSizeW, OFFSizeH);
  Play02 = loadImage("PlayON.png");
  Play02.resize(ONsizeW, ONsizeH);
  
  Help01 = loadImage("HelpOFF.png");
  Help01.resize(OFFSizeW, OFFSizeH);
  Help02 = loadImage("HelpON.png");
  Help02.resize(ONsizeW, ONsizeH);
  
  Start01 = loadImage("StartOFF.png");
  Start01.resize(OFFSizeW, OFFSizeH);
  Start02 = loadImage("StartON.png");
  Start02.resize(ONsizeW, ONsizeH);

  Quit01 = loadImage("QuitOFF.png");
  Quit01.resize(OFFSizeW, OFFSizeH);
  Quit02 = loadImage("QuitON.png");
  Quit02.resize(ONsizeW, ONsizeH);

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
    frameRate(30);
    /*if (menuImg[frameCount%21] != null) {
      image(menuImg[frameCount%21], 0, 0);
    }*/
    menu01.display(0, 0);
    
    if (overRec(500, 400, OFFSizeW, OFFSizeH)) { 
      image(Start02, 500-15, 400-15);
    } else {
      image(Start01, 500, 400);
    }
    image(Title, width/2-225, height/2-200);
    break;  
  case 1:
    //kode
    frameRate(30);
    menu01.display(0, 0);
    
    if (overRec(300, 200, OFFSizeW, OFFSizeH)) { 
      image(Play02, 300-15, 200-15);
    } else {
      image(Play01, 300, 200);
    }
    if (overRec(300, 250, OFFSizeW, OFFSizeH)) { 
      image(Help02, 300-15, 250-15);
    } else {
      image(Help01, 300, 250);
    }
    if (overRec(300, 300, OFFSizeW, OFFSizeH)) { 
      image(Quit02, 300-15, 300-15);
    } else {
      image(Quit01, 300, 300);
    }
    
    if (gameStart == true) {
    frameRate(15);
    transition.display(0, 0);
      if (transition.frame == 10) {
        Phase = 2;
      }
    }

    break;  
  case 2:
    //kode
    frameRate(60);
    Level();
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
    if (overRec(500, 400, OFFSizeW, OFFSizeH)) { 
      Phase = 1;
    }
    break;  
  case 1:
    //kode
    if (overRec(300, 200, OFFSizeW, OFFSizeH)) { 
      gameStart = true;
      player.x = width/gridsize/2;
      player.y = height - (10 * pixelsize);
      player.life = 3;
      score = 0;
      
      //createEnemies();
    }
    if (overRec(300, 250, OFFSizeW, OFFSizeH)) { 
      Phase = -1;
    }
    if (overRec(300, 300, OFFSizeW, OFFSizeH)) { 
      exit();
    }
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
