import processing.sound.*;
SoundFile click, armorUp, lifeUp, mainTheme, tutorTheme;

int pixelsize = 4;
int gridsize  = pixelsize * 7 + 5;
Player player;
Barrier[] barrier = new Barrier[4];
ArrayList enemies = new ArrayList();
ArrayList enemies2 = new ArrayList();
ArrayList enemies3 = new ArrayList();
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
int subcnt;
PImage Play01, Play02, Quit01, Quit02, Start01, Start02, Help01, Help02, Title;     
PImage Tutor01, Tutor02, Tab, A01, A02, D01, D02, W01, W02, Menu01, Menu02, Resum01, Resum02, Back;
int sblimit;

PVector Button00 = new PVector(500, 400);
PVector Button01 = new PVector(500, 450);
PFont VCR;

int OFFSizeW = Math.round(1938/8);
int OFFSizeH = Math.round(334/8);
int ONsizeW = Math.round(2192/8);
int ONsizeH = Math.round(584/8);

boolean skipText;
boolean gameStart = false;

Animation menu01, menu00, transition, transmission, tip1, tip2;

PVector TabPOS = new PVector(width+1000, 200);

int[] listScores = new int[100];
int[] sortScores = new int[100];

boolean run = true; 

void setup() {
  smooth();
  scoreBord = loadTable("data/sb.csv");
  boolean loaded = scoreBord == null;
  println("loaded: "+ loaded );

  background(0);
  VCR = createFont("VCR.ttf", 20);
  textFont(VCR);
  noStroke();
  size(800, 550);
  player = new Player();
  for  (int i = 0; i < barrier.length; i++) {
  barrier[i] = new Barrier(i*200+50);
  }
  createEnemies(5, 2);
  //createEnemies2(5, 2);
  for (int o = 1; o < scoreBord.getRowCount(); o++) {
    int scoreV;
    scoreV = Integer.valueOf(scoreBord.getString(o, 1)); 
    listScores[o-1] = scoreV;
  }
  
  armorUp = new SoundFile(this, "ArmorUp.mp3", false);
  click = new SoundFile(this, "Click.mp3", false);
  mainTheme = new SoundFile(this, "MainTheme.wav", false);
  lifeUp = new SoundFile(this, "LifeUp.mp3", false);
  tutorTheme = new SoundFile(this, "TutorialTheme.wav", false);
  mainTheme.loop();
  
  /*
   menuImg = new PImage[21];
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
  
  Menu01 = loadImage("MenuOFF.png");
  Menu01.resize(OFFSizeW, OFFSizeH);
  Menu02 = loadImage("MenuON.png");
  Menu02.resize(ONsizeW, ONsizeH);
  
  Resum01 = loadImage("ResumeOFF.png");
  Resum01.resize(OFFSizeW, OFFSizeH);
  Resum02 = loadImage("ResumeON.png");
  Resum02.resize(ONsizeW, ONsizeH);

  Title = loadImage("Tilte2.png");
  Title.resize(1386/3, 682/3);
  Tab = loadImage("Frame.png");
  Tab.resize(760, 385);

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

  Back = loadImage("backArrow.png");
  Back.resize(25, 25);

  f = createFont("Arial", 36, true);

  SpaceShip = loadImage("Ship.png");
  SpaceShip.resize(50, 50);

  Background00 = loadImage("spaceBack.png");
  Background00.resize(width, height);
}

void draw() {

  background(0);
  println(mainTheme.frames());

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
    Tutorial();
    break;
  case -1:
    //kode
    Menu();
    image(Tab, width/2-Tab.width/2, height/2-Tab.height/2);
    stroke(255);
    strokeWeight(3);
    line(470, 105, 470, 440);
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
    tip2.display(300, 200);
    if (tip2.frame < 2) {
      image(W01, 370, 100);
    } else {
      image(W02, 370, 100);
    }
    if (overRec(520, 260, OFFSizeW, OFFSizeH)) { 
      image(Tutor02, 520-15, 260-15);
    } else {
      image(Tutor01, 520, 260);
    }

    if (overRec(50, 50, 25, 25)) { 
      image(Back, 50-2, 50-2, 27, 27);
    } else {
      image(Back, 50, 50);
    }
    Debug();
    break;
  default:
    //kode
    //println(sortScores);
    
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
    Debug();
    break;  
  case 1:
    //kode
    Menu();
    Debug();
    break;  
  case 2:
    //kode
    frameRate(60);
    Level();
    Debug();
    break;
  case 3:
    //kode
    //println(scoreBord.getRowCount());
    sortScores = sort(listScores);
    image(Background00, 0, 0);
    image(Tab, width/2-Tab.width/2, height/2-Tab.height/2);
    
    try {
      
      header("SCOREBOARD", width/2, 100);
      text("Your score:\n" + score, 600, 150);
      for (int o = 95; o <= sortScores.length; o++) {
          int scoreV = sortScores[o];
          //println(scoreV);
          textAlign(CENTER);
          text(scoreBord.getString(100-o, 0) + " " + scoreV + " " + scoreBord.getString(100-o, 2), 275, (100-o)*50+100);
      }
      textAlign(0);
    } 
    catch(Exception e) {
      println();
    }
    if (overRec(50, 50, 25, 25)) { 
      image(Back, 50-2, 50-2, 27, 27);
    } else {
      image(Back, 50, 50);
    }
    Debug();
    break;
  }
}




void drawScore() {
  fill(255);
  text("Score: " + String.valueOf(score), 300, 50);
  text("Lives: " + String.valueOf(player.life), 50, 50);
}

void createEnemies(int ROW, int COLUMN) {
  for (int i = 0; i < ROW; i++) {
    for (int j = 0; j <= COLUMN; j++) {
      enemies.add(new Enemy(i*gridsize, j*gridsize + 70));
    }
  }
}

void createEnemies2(int ROW, int COLUMN) {
  for (int i = 0; i < ROW; i++) {
    for (int j = 0; j <= COLUMN; j++) {
      enemies2.add(new Enemy2(i*gridsize, j*gridsize + 70));
    }
  }
}


 void keyPressed()
{
  
   if (Phase == 2 || Phase == -2) {
    if (key == 'p' || key == 'P')
     run = !run; 
   }
   
   player.controls(key,keyCode,true);
   
   
} 
void keyReleased(){
player.controls(key,keyCode,false);
  if (Phase == -2) {
    TutorialKey();
  }
}



void saveScore() {
  try {
    sblimit = scoreBord.getRowCount();
    scoreBord.setString(sblimit, 0, "AlbertGaming");
    scoreBord.setString(sblimit, 1, ""+score);
    scoreBord.setString(sblimit, 2, hour() + ":" + minute() + " " + day() + "/" + month()+ " ");
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
    if (!run) {
    if (overRec(50, 500, OFFSizeW, OFFSizeH)) { 
        reset();
        mainTheme.play();
        click.play();
        createEnemies(5,2);
        Phase = 1;
        run = true;
      }
    if (overRec(500, 500, OFFSizeW, OFFSizeH)) { 
       click.play();
       run = true;
      }
    }
    break;
  case -1:
    //kode
    if (overRec(520, 260, OFFSizeW, OFFSizeH)) { 
      click.play();
      mainTheme.pause();
      tutorTheme.loop();
      Phase = -2;
      reset();
      score = 0;
      createEnemies(1, 0);
      
    }
    if (overRec(50, 50, 25, 25)) { 
      click.play();
      Phase = 1;
    }
    break;
  default:
    //kode
    if (overRec(500, 400, OFFSizeW, OFFSizeH)) { 
        click.play();
      Phase = 1;
    }
    break;  
  case 1:
    //kode
    if (overRec(500, 200, OFFSizeW, OFFSizeH)) { 
       click.play();
       mainTheme.pause();
      reset();
      gameStart = true;
      createEnemies(5, 2);
      score = 0;
    }
    if (overRec(500, 250, OFFSizeW, OFFSizeH)) { 
      click.play();
      Phase = -1;
    }
    if (overRec(500, 300, OFFSizeW, OFFSizeH)) { 
        click.play();
      exit();
    }
    break;  
  case 2:
    //kode
    if (!run) {
    if (overRec(50, 500, OFFSizeW, OFFSizeH)) { 
        click.play();
        mainTheme.play();
        reset();
        createEnemies(5,2);
        Phase = 1;
        run = true;
      }
    if (overRec(500, 500, OFFSizeW, OFFSizeH)) { 
        click.play();
       run = true;
      }
    }
    break;
  case 3:
    //kode
    if (overRec(50, 50, 25, 25)) { 
        click.play();
        mainTheme.play();
      Phase = 1;
    }
    break;
  }
}

void mouseReleased(){
skipText=true;
}

boolean overRec(float x, float y, float w, float h) {
  if (mouseX >= x && mouseX <= x+w && mouseY >= y && mouseY <= y+h) {
    return true;
  } else {
    return false;
  }
}

void Debug() {
  //Debug
  if (mouseButton == RIGHT) {
    ellipse( mouseX, mouseY, 2, 2 );
    fill(255);
    text( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
    text(frameRate, mouseX+64, mouseY+64);
    fill(255);
  }
}

void typeWrite(String msg, int x, int y) {
  textAlign(LEFT);
  //fill(255);
  text (msg.substring(0, constrain(int(subcnt/5), 0, msg.length())), x, y);
  //println(subcnt);
  subcnt++;
  textAlign(LEFT);
}

void help(String hints) {
  imageMode(CENTER);
  textAlign(LEFT);
  if(skipText){
    TutorialMouse(hints.length()*5);
  }
      skipText=false;

  image(Tab, TabPOS.x, TabPOS.y, 400, 100);
  transmission.display(TabPOS.x-150, TabPOS.y);
  fill(#03C04A);
  text("Fox Mccloud:", (int)TabPOS.x-95, (int)TabPOS.y-20);
  fill(255);
  typeWrite(hints, (int)TabPOS.x-95, (int)TabPOS.y+10);
  if (Phase == -2) {
    if (TabPOS.x >  width-200) {
      TabPOS.x -= 10;
    }
  } 
  if (subcnt >= hints.length()*5) {
    transmission.frame = 0;
  }
  imageMode(0);
  textAlign(LEFT);
}

void reset() {
  Dialog = 0;
    subcnt = 0;
    round = 1;
    player.life = 3;
    enemies.clear();
    enemies2.clear();
    enemies3.clear();
    bullets.clear();
    pellets.clear();
    gameStart = false;
    TabPOS.x = width+500;
    player.x = width/gridsize/2;
    player.y = height - (10 * pixelsize);
    player.cooldown = 0;
    player.powerup = false;
    for  (int i = 0; i < barrier.length; i++) {
      barrier[i].life = 3;
    }
}

void header(String titel, int titelposX, int titelposY) {
  textSize(50);
      fill(255);
      textAlign(CENTER);
      text(titel, titelposX, titelposY);
      textAlign(0);
      textSize(20);
}
