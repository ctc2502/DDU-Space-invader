void Level() {

image(Background00, 0, 0);
    noFill();
    rect(0, 0, width*0.98, height*0.98);
    drawScore();
    
    if (run) {
    if (player.hp()) {
    player.display(10);
    } else {
    Phase = 3;
    reset();
    createEnemies(5,2);
    saveScore();
    gameStart = false;
    }
    
    for  (int i = 0; i < barrier.length; i++) {
      if (barrier[i].hp()) {
      barrier[i].display(0);
      } 
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
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if (!enemy.alive()) {
        enemies.remove(i);
      } else {
        enemy.display(1);
      }
    }
    
    for (int i = 0; i < enemies2.size(); i++) {
      Enemy2 enemy2 = (Enemy2) enemies2.get(i);
      if (!enemy2.alive()) {
        enemies2.remove(i);
      } else {
        enemy2.display(1);
      }
    }
     for (int i = 0; i < enemies2.size(); i++) {
      Enemy2 enemy2 = (Enemy2) enemies2.get(i);
      if (enemy2.outside() == true) {
        direction *= (-1);
        break;
      }
    }
    
    for (int i = 0; i < enemies3.size(); i++) {
      Enemy3 enemy3 = (Enemy3) enemies3.get(i);
      if (!enemy3.alive()) {
        enemies3.remove(i);
      } else {
        enemy3.display(1);
      }
    }
    
    if (random(0, 1000) < 1) {
    enemies3.add(new Enemy3(gridsize, gridsize + 70));
    }
    
    if(enemies.size() == 0 && enemies2.size() == 0){
      round++;
      createEnemies(int(random(1,10)),int(random(0,5)));
      createEnemies2(int(random(0,5)),int(random(0,2)));
    }
    incy = false;
      
    } else {
      Pause();
    }
}

void Pause() {
      player.display(0);
      
      for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = (Bullet) bullets.get(i);
      bullet.display(0);
      }
    
      for (int i = 0; i < pellets.size(); i++) {
      Pellet pellet = (Pellet) pellets.get(i);
      pellet.display(0);
      }
      
      for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if (!enemy.alive()) {
        enemies.remove(i);
      } else {
        enemy.display(-1);
        }
      }
      for (int i = 0; i < enemies2.size(); i++) {
      Enemy2 enemy2 = (Enemy2) enemies2.get(i);
      if (!enemy2.alive()) {
        enemies2.remove(i);
      } else {
        enemy2.display(-1);
        }
      }
      
      for (int i = 0; i < enemies3.size(); i++) {
      Enemy3 enemy3 = (Enemy3) enemies3.get(i);
      if (!enemy3.alive()) {
        enemies3.remove(i);
      } else {
        enemy3.display(-1);
        }
      }
      
      textSize(50);
      fill(255);
      textAlign(CENTER);
      text("PAUSED", width/2, height/2);
      textAlign(0);
      textSize(20);
      if (overRec(500, 500, OFFSizeW, OFFSizeH)) { 
      image(Resum02, 500-15, 500-15);
    } else {
      image(Resum01, 500, 500);
    }
    
    if (overRec(50, 500, OFFSizeW, OFFSizeH)) { 
      image(Menu02, 100-15, 500-15);
    } else {
      image(Menu01, 100, 500);
    }
}
