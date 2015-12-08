class wolf {

  float w;
  float h;
  float xpos;
  float ypos;
  PImage wolf;
  float currentX;

  wolf() {
    wolf = loadImage("Wolf/w1.png");
    w = wolf.width;
    h = wolf.height; 
    xpos = width-50;
  }

  void drawWolf(float x) {
    // xpos = x;
    ypos = 500;
    noFill();
    wolf.resize((int)(w*0.8), (int)(h*0.8));
    imageMode(CENTER);
    currentX = (xpos)-x;
    image(wolf, (xpos)-x, ypos);
  }
  
void wolf1 () {
    wolf = loadImage("Wolf/w1.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }
  
  void wolf2 () {
    wolf = loadImage("Wolf/w2.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }

  void Cloud1 () {
    wolf = loadImage("Items and cloud/c1.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }

  void Cloud2 () {
    wolf = loadImage("Items and cloud/c2.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }

  void straw1 () {
    wolf = loadImage("Wolf/w1+STAW.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }

  void straw2 () {
    wolf = loadImage("Wolf/w2+STAW.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }

  void stick1 () {
    wolf = loadImage("Wolf/w1+STICK.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }

  void stick2 () {
    wolf = loadImage("Wolf/w2+STICK.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }

  void hurt () {
    wolf = loadImage("Wolf/w3.png");
    wolf.resize((int)(w*0.67), (int)(h*0.67));
  }
  
  float getWolfX(){
  return currentX;
  }
}

