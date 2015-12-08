interface items {
  void display(float x);
  String getType();
  PVector getPos();
  int getPoints();
  int time();
  int getWidth();
  int getHeight();
  void Hit(float x, float y);
}


class itemA implements items {
  float w;
  float h;
  String type;
  int Points;
  float Y;
  float X;  
  int timeToAppear;
  PImage p;
  float r;

  itemA(float nowTime, float ammountTime) {   
    Points = 40;
    type = "straw";
    Y = random(100, 400);
    X= 0.0;
    if (ammountTime >= 60) {
      float newTime = map(((int)random(nowTime, ammountTime)), nowTime, ammountTime, 0, 59);
      timeToAppear = (int)newTime;
    } else {
      timeToAppear = (int)random(nowTime, ammountTime);
    }
    //println(ammountTime);
    //println("time to appear: " + (int)timeToAppear);
    p = loadImage("Items and cloud/straw.png");
    w = p.width;
    h = p.height;
    r = 0;
  }

  void display(float x) {
    noStroke();
    noFill();
    X = x;
    p.resize((int)(w*0.6), (int)(h*0.6));
    imageMode(CENTER);
    image(p, X-(p.width/2), Y);
    //println("displaying");
  }

  String getType() {
    return type;
  }

  PVector getPos() {
    PVector p = new PVector(X, Y);
    return p;
  }

  int getPoints() {
    return Points;
  }

  int time() {   
    return timeToAppear;
  }

  int getWidth() {
    return (int)w;
  }

  int getHeight() {
    return (int)h;
  }

  void Hit(float x, float y) {
    pushMatrix();
    translate(x, y); 
    r = r+10;
    rotate(radians(r));
    noFill();
    noStroke();  
    imageMode(CENTER);
    image(p, 0, 0);
    popMatrix();
  }
}

class itemB implements items {
  float w;
  float h;
  String type;
  int Points;
  float Y;
  float X;  
  int timeToAppear;
  PImage p;
  float r;

  itemB(float nowTime, float ammountTime) {
    Points = 60;
    type = "stick";
    Y = random(100, 400);
    timeToAppear = (int)random(nowTime, ammountTime);
    //println("time to appear: " + (int)timeToAppear);
    p = loadImage("Items and cloud/stick.png");
    w = p.width;
    h = p.height;
    r = 0;
  }

  void display(float x) {
    noStroke();
    noFill();
    X = x;
    p.resize((int)(w*0.6), (int)(h*0.6));
    imageMode(CENTER);
    image(p, X-(p.width/2), Y);
  }

  String getType() {
    return type;
  }

  PVector getPos() {
    PVector p = new PVector(X, Y);
    return p;
  }

  int getPoints() {
    return Points;
  }

  int time() {
    return timeToAppear;
  }

  int getWidth() {
    return (int)w;
  }

  int getHeight() {
    return (int)h;
  }

  void Hit(float x, float y) {
    pushMatrix();
    translate(x, y); 
    r = r+10;
    rotate(radians(r));
    noFill();
    noStroke();  
    imageMode(CENTER);
    image(p, 0, 0);
    popMatrix();
  }
}

class itemC implements items {
  float w;
  float h;
  String type;
  int Points;
  float Y;
  float X; 
  int timeToAppear; 
  PImage p;
  float r;

  itemC(float nowTime, float ammountTime) {
    Points = 100;
    type = "brick";
    Y = random(100, 400);
    timeToAppear = (int)random(nowTime, ammountTime);
    //println("time to appear: " + (int)timeToAppear);
    p = loadImage("Items and cloud/brick.png");
    w = p.width;
    h = p.height;
    r = 0;
  }

  void display(float x) {
    noStroke();
    noFill();
    X = x;
    p.resize((int)(w*0.6), (int)(h*0.6));
    imageMode(CENTER);
    image(p, X-(p.width/2), Y);
  }

  String getType() {
    return type;
  }

  PVector getPos() {
    PVector p = new PVector(X, Y);
    return p;
  }

  int getPoints() {
    return Points;
  }

  int time() {
    return timeToAppear;
  }

  int getWidth() {
    return (int)w;
  }

  int getHeight() {
    return (int)h;
  }

  void Hit(float x, float y) {    
    pushMatrix();
    translate(x, y); 
    r = r+10;
    rotate(radians(r));
    noFill();
    noStroke();  
    imageMode(CENTER);
    image(p, 0, 0);
    popMatrix();
  }
}

