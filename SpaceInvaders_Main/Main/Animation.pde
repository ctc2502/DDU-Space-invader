class Animation {
  PImage[] images;
  int imageCount;
  float frame;
  
  Animation(String imagePrefix, String type, int count, int w, int h) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i+=1) {
      String filename = imagePrefix + " (" + i + type;
      images[i] = loadImage(filename);
      images[i].resize(w, h);
    }
  }

  void display(float xpos, float ypos,float speed) {
    frame = (frame+speed) % imageCount;
    image(images[(int)frame], xpos, ypos);
    //println(frame);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
