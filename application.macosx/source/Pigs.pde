class pigs {

  float w;
  float h;
  float xpos;
  float ypos;
  PImage pig;

  pigs(PImage p) {
    pig = p;
    w = p.width;
    h = p.height;        
  }

  void drawpigs(float x, float y) {
    xpos = x;    
    ypos = y;
   // println(ypos);
    noFill();
    pig.resize((int)(w*0.8), (int)(h*0.8));
    imageMode(CENTER);
    image(pig, xpos, ypos - 50);
  }

  void setSTRAWImage (String num) {
    pig = loadImage("Straw Pig/stPig"+num+".png");
    pig.resize((int)(w*0.67), (int)(h*0.67));
  }

  void setSTICKImage (String num) {
    pig = loadImage("stick pig/stkPig"+num+".png");
    pig.resize((int)(w*0.67), (int)(h*0.67));
  }

  void setBRICKImage (String num) {
    pig = loadImage("brick pig/brkPig"+num+".png");
    pig.resize((int)(w*0.67), (int)(h*0.67));
  }
}


