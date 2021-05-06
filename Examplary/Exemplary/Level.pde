void Level() {

image(Background00, 0, 0);
    noFill();
    rect(0, 0, width*0.98, height*0.98);
    drawScore();
    
    if (player.hp()) {
    player.display(10);
    } else {
    Phase = 3;
    enemies.clear();
    bullets.clear();
    pellets.clear();
    createEnemies(5,2);
    saveScore();
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
    println(enemies.size());
    for (int i = 0; i < enemies.size(); i++) {
      Enemy enemy = (Enemy) enemies.get(i);
      if (!alive(enemy.x, enemy.y, 1)) {
        enemies.remove(i);
      } else {
        enemy.display(1);
      }
    }
    
    if(enemies.size() == 0){
      round++;
      createEnemies(int(random(1,10)),int(random(0,5)));
    }
    incy = false;
}
