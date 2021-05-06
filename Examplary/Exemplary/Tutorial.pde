int Dialog;
int spd = 10;

void Tutorial() {
  image(Background00, 0, 0); 
  frameRate(60);
  noFill();
  rect(0, 0, width*0.98, height*0.98);
  drawScore();

  if (player.hp()) {
    player.display(spd);
  } else {
    enemies.clear();
    bullets.clear();
    pellets.clear();
    createEnemies(1,0);
    Phase = 0;
    gameStart = false;
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
  //println();
  for (int i = 0; i < enemies.size(); i++) {
    Enemy enemy = (Enemy) enemies.get(i);
    if (!alive(enemy.x, enemy.y, 1)) {
      enemies.remove(i);
    } else {
      enemy.display(1);
    }
  }

  incy = false;

  switch(Dialog) {
  default:
    help("Starpilot Fox Mccloud,\nReporting for duty", 200);
    spd = 0;
    bullets.clear();
    break;
  case 1:
    help("I'll learn you the basic\nprinciples of flyng", 200);
    spd = 0;
    bullets.clear();
    break;
  case 2:
    help("Press 'A' and 'D',\nto move left and right", 200);
    spd = 10;
    bullets.clear();
    break;
  case 3:
    help("Nice moves pilot!", 100);
    bullets.clear();
    break;
  case 4:
    help("You do not only have to\noutmaneuver your enemies", 230);
    bullets.clear();
    break;
  case 5:
    help("But you also have to\nreturn back the fire", 200);
    bullets.clear();
    break;
  case 6:
    help("Press 'W' to fire bullets\nat your adversaries", 200);
    if (score == 50) {
      subcnt = 0;
      Dialog = 7;
    }
    break;
  case 7:
    help("They didn't stand\na chance!", 150);
  break;
  case 8:
    help("That covers\nall the basics", 100);
    break;
  case 9:
    help("Now get out there and\nkick some slimy alien ass!", 100);
  }
}

void TutorialMouse() {
  switch(Dialog) {
  default:
    subcnt=0;
    Dialog++;
    break;
  case 2:
    break;
  case 6:
    break;
  case 9:
    Dialog = 0;
    subcnt = 0;
    score = 0;
    enemies.clear();
    bullets.clear();
    pellets.clear();
    createEnemies(1,0);
    Phase = 1;
    gameStart = false;
    TabPOS.x = width+500;
    player.x = width/gridsize/2;
    player.y = height - (10 * pixelsize);
    break;
  }
}

void TutorialKey() {
  switch(Dialog) {
  default:
    break;
  case 1:
    break;
  case 2:
    if (keyPressed) {
      if (key == 'A' || key == 'a') {
        subcnt=0;
        Dialog++;
      } else if (key == 'D' || key == 'd') {
        subcnt=0;
        Dialog++;
      }
    }
    break;
  }
}
