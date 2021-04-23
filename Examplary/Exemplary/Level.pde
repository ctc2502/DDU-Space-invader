void Level() {

image(Background00, 0, 0);
    noFill();
    rect(0, 0, width*0.98, height*0.98);
    drawScore();
    
    if (player.hp()) {
    player.display();
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

    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if (enemy.outside() == true) {
        direction *= (-1);
        incy = true;
        break;
      }
    }
    println();
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
}
