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
PImage Play01, Play02, Quit01, Quit02, Start01, Start02, Help01, Help02, Title, Tutor01, Tutor02, Frame, A01, A02, D01, D02, W01, W02;

PVector Button00 = new PVector(500, 400);
PVector Button01 = new PVector(500, 450);

int OFFSizeW = Math.round(1938/8);
int OFFSizeH = Math.round(334/8);
int ONsizeW = Math.round(2192/8);
int ONsizeH = Math.round(584/8);

boolean gameStart = false;

Animation menu01, menu00, transition, transmission, tip1, tip2;

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
  menu00 = new Animation("SpaceGirl/SpaceGirl", ").gif", 10, width, height);
  transition = new Animation("Fade/White", ").png", 11, width, height);
  transmission = new Animation("StarF/StarFox", ").gif", 25, 100, 100);
  tip1 = new Animation("tip1/LeftRightShip", ").gif", 25, 200, 200);
  tip2 = new Animation("tip2/ShootShip", ").gif", 25, 200, 200);
  
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
  
  Tutor01 = loadImage("TutorialOFF.png");
  Tutor01.resize(OFFSizeW, OFFSizeH);
  Tutor02 = loadImage("TutorialON.png");
  Tutor02.resize(ONsizeW, ONsizeH);
  
  Title = loadImage("Tilte2.png");
  Title.resize(1386/3, 682/3);
  Frame = loadImage("Frame.png");
  Frame.resize(760, 385);
  
  A01 = loadImage("aKey.png");
  A01.resize(50, 50);
  A02 = loadImage("aKeyOFF.png");
  A02.resize(50, 50);
  
  D01 = loadImage("dKey.png");
  D01.resize(50, 50);
  D02 = loadImage("dKeyOFF.png");
  D02.resize(50, 50);
  
  W01 = loadImage("wKey.png");
  W01.resize(50, 50);
  W02 = loadImage("wKeyOFF.png");
  W02.resize(50, 50);
  
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
    Menu();
    image(Frame, width/2-Frame.width/2, height/2-Frame.height/2);
    frameRate(30);
    tip1.display(50, 200);
    if (tip1.frame > 14) {
    image(A01, 80, 100);
    } else {   
    image(A02, 80, 100);
    }
    if (tip1.frame < 14) {
    image(D01, 180, 100);
    } else {
    image(D02, 180, 100);
    }
    tip2.display(330, 200);
    if (tip2.frame < 2) {
    image(W01, 400, 100);
    } else {
    image(W02, 400, 100);
    }
    break;
  default:
    //kode
    
    background(255);
    frameRate(15);
    menu00.display(-150, 0);
    
    if (overRec(500, 400, OFFSizeW, OFFSizeH)) { 
      frameRate(30);
      menu01.display(-150, 0);
      image(Start02, 500-15, 400-15);
    } else {
      image(Start01, 500, 400);
    }
    image(Title, width/2-1386/3/2, -50);
    //transmission.display(width/2, height/2);
    
    break;  
  case 1:
    //kode
    Menu();
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
    if (overRec(500, 200, OFFSizeW, OFFSizeH)) { 
      gameStart = true;
      player.x = width/gridsize/2;
      player.y = height - (10 * pixelsize);
      player.life = 3;
      score = 0;
      round = 1;
      //createEnemies();
    }
    if (overRec(500, 250, OFFSizeW, OFFSizeH)) { 
      Phase = -1;
    }
    if (overRec(500, 300, OFFSizeW, OFFSizeH)) { 
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
