void Menu(){
    background(255);
    frameRate(60);
    menu00.display(-150, 0,0.25);
    
    if (overRec(500, 200, OFFSizeW, OFFSizeH)) { 
      frameRate(60);
      menu01.display(-150, 0,0.5);
      image(Play02, 500-15, 200-15);
    } else {
      image(Play01, 500, 200);
    }
    if (overRec(500, 250, OFFSizeW, OFFSizeH)) { 
      frameRate(60);
      menu01.display(-150, 0,0.5);
      image(Play01, 500, 200);
      image(Help02, 500-15, 250-15);
    } else {
      image(Help01, 500, 250);
    }
    if (overRec(500, 300, OFFSizeW, OFFSizeH)) { 
      frameRate(60);
      menu01.display(-150, 0,0.5);
      image(Help01, 500, 250);
      image(Play01, 500, 200);
      image(Score02, 500-15, 300-15);
    } else {
      image(Score01, 500, 300);
    }
     if (overRec(500, 350, OFFSizeW, OFFSizeH)) { 
      frameRate(60);
      menu01.display(-150, 0,0.5);
      image(Help01, 500, 250);
      image(Play01, 500, 200);
      image(Score01, 500, 300);
      image(Quit02, 500-15, 350-15);
    } else {
      image(Quit01, 500, 350);
    }
    image(Title, width/2-1386/3/2, -50);
    
    if (gameStart == true) {
    frameRate(60);
    transition.display(0, 0,0.1);
      if (transition.frame >= 10) {
        Phase = 2;
      }
    }
}
