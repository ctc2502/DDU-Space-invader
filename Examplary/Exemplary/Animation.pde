class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, String type, int count, int w, int h) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + " (" + i + type;
      images[i] = loadImage(filename);
      images[i].resize(w, h);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
    println(frame);
  }
  
  int getWidth() {
    return images[0].width;
  }
}
