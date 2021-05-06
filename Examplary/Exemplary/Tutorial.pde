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
    createEnemies();
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

    for (int i = 0; i < 1; i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if (enemy.outside() == true) {
        direction *= (-1);
        incy = true;
        break;
      }
    }
    //println();
    for (int i = 0; i < 1; i++) {
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
      help("Starpilot Fox Mccloud,\nReporting for duty");
      spd = 0;
      if (subcnt > 200) {
       transmission.frame = 0;
      }
      bullets.clear();
      break;
      case 1:
      help("I'll learn you the basic\nprinciples of flyng");
      spd = 0;
      if (subcnt > 200) {
       transmission.frame = 0;
      }
      bullets.clear();
      break;
      case 2:
      help("Press 'A' and 'D',\nto move left and right");
      spd = 10;
      if (subcnt > 200) {
       transmission.frame = 0;
      }
      break;
    } 
}

void TutorialMouse() {
  switch(Dialog) {
      default:
      subcnt=0;
      Dialog++;
      break;
      case 1:
      subcnt=0;
      Dialog++;
      break;
      case 2:
      //subcnt=0;
      //Dialog++;
      break;
  }
}

void TutorialKey(){
  switch(Dialog) {
      default:
      break;
      case 1:
      break;
      case 2:
      /*if (keyPressed) {
            x -= speed;
        }*/
      break;
  }
}
