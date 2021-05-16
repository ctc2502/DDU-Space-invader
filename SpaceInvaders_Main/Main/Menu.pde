void Menu(){
    background(255);
    frameRate(15);
    menu00.display(-150, 0);
    
    if (overRec(500, 200, OFFSizeW, OFFSizeH)) { 
      frameRate(30);
      menu01.display(-150, 0);
      image(Play02, 500-15, 200-15);
    } else {
      image(Play01, 500, 200);
    }
    if (overRec(500, 250, OFFSizeW, OFFSizeH)) { 
      frameRate(30);
      menu01.display(-150, 0);
      image(Play01, 500, 200);
      image(Help02, 500-15, 250-15);
    } else {
      image(Help01, 500, 250);
    }
    if (overRec(500, 300, OFFSizeW, OFFSizeH)) { 
      frameRate(30);
      menu01.display(-150, 0);
      image(Help01, 500, 250);
      image(Play01, 500, 200);
      image(Quit02, 500-15, 300-15);
    } else {
      image(Quit01, 500, 300);
    }
    image(Title, width/2-1386/3/2, -50);
    
    if (gameStart == true) {
    frameRate(15);
    transition.display(0, 0);
      if (transition.frame == 10) {
        Phase = 2;
      }
    }
}
