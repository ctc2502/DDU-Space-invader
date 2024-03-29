int Dialog;
int spd = 10;

void Tutorial() {
  image(Background00, 0, 0); 
  frameRate(60);
  noFill();
  rect(0, 0, width*0.98, height*0.98);
  drawScore();
  if (run) {
  if (player.hp()) {
    player.display(spd);
  } else {
    reset();
    createEnemies(1,0);
    Phase = 1;
    gameStart = false;
    tutorTheme.pause();
  }
  
  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);
    bullet.display(pixelsize * 2);
  }

  for (int i = 0; i < pellets.size(); i++) {
    Pellet pellet = (Pellet) pellets.get(i);
    pellet.display(pixelsize * 2);
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
    if (!enemy.alive()) {
      enemies.remove(i);
    } else {
      enemy.display(1);
    }
  }
  
  for  (int i = 0; i < barrier.length; i++) {
      if (barrier[i].hp()) {
      barrier[i].display(0);
      } 
    }

  incy = false;

  switch(Dialog) {
  default:
    help("Starpilot Fox Mccloud,\nReporting for duty");
    spd = 0;
    player.canShoot = false;
    break;
  case 1:
    help("I'll learn you the basic\nprinciples of flyng");
    spd = 0;
     player.canShoot = false;
    break;
  case 2:
    help("Press 'A' and 'D',\nto move left and right");
    spd = 10;
     player.canShoot = false;
    break;
  case 3:
    help("Nice moves pilot!");
     player.canShoot = false;
    break;
  case 4:
    help("You do not only have to\noutmaneuver your enemies");
     player.canShoot = false;
    break;
  case 5:
    help("But you also have to\nreturn back the fire");
     player.canShoot = false;
    break;
  case 6:
    help("Press 'W' to fire bullets\nat your adversaries");
    if (score == 50) {
      niceJob.play();
      subcnt = 0;
      Dialog = 7;
    }
    break;
  case 7:
    help("They didn't stand\na chance!");
  break;
  case 8:
    help("That covers\nall the basics");
    break;
  case 9:
    help("Now get out there and\nkick some slimy alien ass!");
    }
  } else {
   Pause();
  }
}

void TutorialMouse(int size) {
  if (run) {
  switch(Dialog) {
  default:
  if(size >subcnt){
  subcnt = 1000;
  }
  else{
    subcnt=0;
    Dialog++;
  }
    break;
  case 2:{
    if(size >subcnt){
  subcnt =1000;
  }}
    break;
  case 6:{
    if(size > subcnt){
  subcnt =1000;
  }}
    break;
  case 9:
    if(size > subcnt){
  subcnt =1000;
  } else {
    reset();
    tutorTheme.pause();
    mainTheme.play();
    createEnemies(1,0);
    Phase = 1;
    break;
      }
    }
  }
}

void TutorialKey() {
  if (run) {
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
        niceJob.play();
      }
    }
    break;
  }
  }
}
