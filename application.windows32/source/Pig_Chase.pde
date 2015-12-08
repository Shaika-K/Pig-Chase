import ddf.minim.*;
Minim minim;
AudioPlayer Game;
AudioPlayer Welcome;
AudioPlayer PlayAgain;
AudioPlayer button;
AudioPlayer eating;
AudioPlayer jump;
AudioPlayer ouch;
AudioPlayer Throw;

PImage welcome;
PImage howToPlay;
PImage PlayA;
PImage ChooseLevel;
PImage doc;
PImage BackB;
PImage QuitB;
PImage PlayB;
PImage PlayAgainB;
PImage easyB;
PImage medB;
PImage hardB;
PImage DocB;
PImage ContinueB;

boolean playGame;
boolean howTo;
boolean Levels;
boolean playAgain;
boolean showDoc;
float time, speed, straws, sticks, bricks, itemS;
Game g;

void setup() {
  size(1000, 700);


  minim = new Minim(this);
  Game = minim.loadFile("data/Sounds/Game.mp3");
  Welcome = minim.loadFile("data/Sounds/Welcome.mp3");
  PlayAgain = minim.loadFile("data/Sounds/Play Again.mp3");
  button = minim.loadFile("data/Sounds/button.mp3");
  eating = minim.loadFile("data/Sounds/eating.mp3");
  jump = minim.loadFile("data/Sounds/jump.mp3");
  ouch = minim.loadFile("data/Sounds/ouch.mp3");
  Throw = minim.loadFile("data/Sounds/Throw.mp3");

  welcome = loadImage("data/welcome.jpg");
  howToPlay = loadImage("data/howToPlay.jpg");
  PlayA = loadImage("data/PlayAgain.jpg");
  ChooseLevel = loadImage("data/Level.jpg");
  doc = loadImage("data/doc.jpg");
  BackB = loadImage("data/BackB.png");
  QuitB = loadImage("data/QuitB.png");
  PlayB = loadImage("data/PlayB.png");
  PlayAgainB = loadImage("data/PlayAgainB.png");
  easyB = loadImage("data/EasyB.png");
  medB = loadImage("data/MedB.png");
  hardB = loadImage("data/HardB.png");
  DocB = loadImage("data/DocB.png");
  ContinueB = loadImage("data/ConB.png");


  time = 0;
  speed = 0;
  straws = 0;
  sticks = 0;
  bricks = 0;
  itemS = 0;
  g = new Game();
}

void draw() {
  background(0);  
  check();
}

void update(float x, float y) {
  if (howTo) {   
    if (x>=(0) && x<=(0)+151 && y>= (height-75) && y <= (height-75)+75) {
      button.play();
      //Levels = false;
      Levels = !Levels;
      howTo = !howTo;
    } else if (x>=(width-151) && x<=(width-151)+151 && y>= (height-75) && y <= (height-75)+75) {
      button.play();
      exit();
    }
  } else if (Levels) {

    if (x>=((width/2)-(151/2)-10-151) && x<=((width/2)-(151/2)-10-151)+151 && y>= (height/2-75/2) && y <= (height/2-75/2)+75) {  // easy
      button.play();
      Levels = !Levels;
      playGame = !playGame;
      g = new Game();
      time = 60;
      speed = 35;
      straws = 10;
      sticks = 6;
      bricks = 4;
      itemS = 0.8;
      g.initialise(time, speed, straws, sticks, bricks, itemS);
    } else if (x>=(width/2-151/2) && x<=(width/2-151/2)+151 && y>= (height/2-75/2) && y <= (height/2-75/2)+75) {    //med
      button.play();
      Levels = !Levels;
      playGame = !playGame;
      g = new Game();
      time = 90;
      speed = 40;
      straws = 12;
      sticks = 6;
      bricks = 4;
      itemS = 1.2;
      g.initialise(time, speed, straws, sticks, bricks, itemS);
    } else if (x>=((width/2)+(151/2)+10) && x<=((width/2)+(151/2)+10)+151 && y>= (height/2-75/2) && y <= (height/2-75/2)+75) {    //hard
      button.play();
      Levels = !Levels;
      playGame = !playGame;
      g = new Game();
      time = 120;
      speed = 70;
      straws = 9;
      sticks = 6;
      bricks = 3;
      itemS = 1.6;
      g.initialise(time, speed, straws, sticks, bricks, itemS);
    } else if (x>=(width/2-151/2) && x<=(width/2-151/2)+151 && y>= (2*height/3 + 75) && y <= (2*height/3 + 75)+75) {
      button.play();
      Levels = !Levels;
      howTo = !howTo;
    }
  } else if (playGame) {
    if (x>=(width-151) && x<=(width-151)+151 && y>= (height-75) && y <= (height-75)+75) {    //quit
      button.play();
      playGame = !playGame;
      playAgain = !playAgain;
    }
  } else if (playAgain) {
    if (x>=((width/2)-(151/2)-10-151) && x<=((width/2)-(151/2)-10-151)+151 && y>= (2*height/3 + 75) && y <= (2*height/3 + 75)+75) {
      button.play();
      playAgain = !playAgain;     
      Levels = !Levels;
    } else if (x>=((width/2)+(151/2)+10) && x<=((width/2)+(151/2)+10)+151 && y>= (2*height/3 + 75) && y <= (2*height/3 + 75)+75) {
      button.play();
      exit();
    }
  } else if (showDoc) {
    if (x>=(width-151) && x<=(width-151)+151 && y>= (height-75) && y <= (height-75)+75) {
      button.play();
      showDoc = !showDoc;     
      //welcome = !welcome;
    }
  } else {     
    if (x>=(width/2-151/2) && x<=(width/2-151/2)+151 && y>= (2*height/3 - 75/2) && y <= (2*height/3 - 75/2)+75) {
      button.play();
      howTo = !howTo;
    }
    if (x>=(width/2-151/2) && x<=(width/2-151/2)+151 && y>= (2*height/3 - (75*2)) && y <= (2*height/3 - (75*2))+75) {
      button.play();
      showDoc = !showDoc;
    }  
    if (x>=(width/2-151/2) && x<=(width/2-151/2)+151 && y>= (2*height/3 + 75) && y <= (2*height/3 + 75)+75) {  
      button.play();      
      exit();
    }
  }
}

void mouseReleased() {
  g.j = false;
}

void mousePressed() {
  if (playGame) {
    if (mouseButton == LEFT) {
      g.j = true;
    }
    if (mouseX>=(width-151) && mouseY >= (height-75)) {
      update(mouseX, mouseY);
    }
  } else {
    update(mouseX, mouseY);
  }
}

void mouseClicked() {
  if (mouseButton == RIGHT) {
    if (g.itemHolding != null && !g.EATING && !g.HURT) {
      g.hit = true;      
      g.straw = false;
      g.stick = false;
      g.brick = false;
      g.itemThrown = g.itemHolding;
      g.itemHolding = null;
      g.itemY = g.p1.ypos;
    }
  }
}

void check() {
  if (howTo) {
    drawHowTo();
  } else if (playGame) {       //GREEN
    g.play();
  } else if (Levels) {
    drawLevels();
  } else if (showDoc) {
    drawDoc();
  } else if (playAgain) {
    drawPlayAgain();
  } else {    
    noStroke();
    //fill(255);
    image(welcome, 0, 0);

    noFill();
    strokeWeight(3);
    stroke(#FFD900);  
    image(DocB, width/2-151/2, 2*height/3 - (2*75));
    //rect(width/2-151/2, 2*height/3 - 75/2, 151, 75);    //how to
    image(PlayB, width/2-151/2, 2*height/3 - 75/2);
    //fill(#03FFC2);
    //rect(width/2-151/2, 2*height/3 + 75, 151, 75);    //quit
    image(QuitB, width/2-151/2, 2*height/3 + 75);

    if (mouseX>=(width/2-151/2) && mouseX<=(width/2-151/2)+151 && mouseY>= (2*height/3 - 75/2) && mouseY <= (2*height/3 - 75/2)+75) {
      rect(width/2-151/2, 2*height/3 - 75/2, 151, 75);
    }
    if (mouseX>=(width/2-151/2) && mouseX<=(width/2-151/2)+151 && mouseY>= (2*height/3 - (75*2)) && mouseY <= (2*height/3 - (75*2))+75) {
      rect(width/2-151/2, 2*height/3 - (2*75), 151, 75);
    }  
    if (mouseX>=(width/2-151/2) && mouseX<=(width/2-151/2)+151 && mouseY>= (2*height/3 + 75) && mouseY <= (2*height/3 + 75)+75) {  
      rect(width/2-151/2, 2*height/3 + 75, 151, 75);
    }
  }
  checkSound();
}

void drawHowTo() {    //PINK
  noStroke();
  fill(#FA03FF);
  rect(0, 0, 1000, 700);
  image(howToPlay, 0, 0);

  noFill();
  strokeWeight(3);
  stroke(#FFD900);  
  //rect(0, height-75, 151, 75);    //levels
  image(ContinueB, 0, height-75);
  //fill(#03FFC2);
  //rect(width-151, height-75, 151, 75);    //quit
  image(QuitB, width-151, height-75);

  if (mouseX>=(0) && mouseX<=(0)+151 && mouseY>= (height-75) && mouseY <= (height-75)+75) {
    rect(0, height-75, 151, 75);
  }
  if (mouseX>=(width-151) && mouseX<=(width-151)+151 && mouseY>= (height-75) && mouseY <= (height-75)+75) {
    rect(width-151, height-75, 151, 75);
  }
}

void drawDoc() {    //PINK
  noStroke();
  fill(#FA03FF);
  rect(0, 0, 1000, 700);
  image(doc, 0, 0);

  noFill();
  strokeWeight(3);
  stroke(#FFD900);  
  //rect(width-151, height-75, 151, 75);    //back to welcome
  image(BackB, width-151, height-75);

  if (mouseX>=(width-151) && mouseX<=(width-151)+151 && mouseY>= (height-75) && mouseY <= (height-75)+75) {
    rect(width-151, height-75, 151, 75);
  }
}

void drawPlayAgain() {      //BLUE
  noStroke();
  fill(#033BFF);
  rect(0, 0, 1000, 700);
  image(PlayA, 0, 0);

  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("Points:  "+(int)g.points, width/2, height/2-75);      
  text("Lives:  "+(int)g.lives, width/2, height/2);
  fill(#FFCD00);
  text("TOTAL:  "+(int)(g.points+(500*g.lives)), width/2, height/2 + 75);

  noFill();
  strokeWeight(3);
  stroke(#FFD900);  
  //rect(0, height/2-75/2, 151, 75);    //levels
  imageMode(CORNER);
  image(PlayAgainB, (width/2)-(151/2)-10-151, 2*height/3 + 75);
  //fill(#03FFC2);
  //rect(width-151, height/2-75/2, 151, 75);    //quit
  image(QuitB, (width/2)+(151/2)+10, 2*height/3 + 75);

  if (mouseX>=((width/2)-(151/2)-10-151) && mouseX<=((width/2)-(151/2)-10-151)+151 && mouseY>= ( 2*height/3 + 75) && mouseY <= ( 2*height/3 + 75)+75) {
    rect((width/2)-(151/2)-10-151, 2*height/3 + 75, 151, 75);
  }
  if (mouseX>=((width/2)+(151/2)+10) && mouseX<=((width/2)+(151/2)+10)+151 && mouseY>= (2*height/3 + 75) && mouseY <= (2*height/3 + 75)+75) {
    rect((width/2)+(151/2)+10, 2*height/3 + 75, 151, 75);
  }
}

void drawLevels() {      //ORANGE
  noFill();
  rect(0, 0, 1000, 700);
  image(ChooseLevel, 0, 0);

  noFill();
  strokeWeight(3);
  stroke(#FFD900);  
  //rect(0, height/2-75/2, 151, 75);    //easy  5
  image(easyB, (width/2)-(151/2)-10-151, height/2-75/2);
  //fill(0, 0, 255);
  // rect(width/2-151/2, height/2-75/2, 151, 75);    //medium
  image(medB, width/2-151/2, height/2-75/2);
  //fill(255, 0, 0);
  // rect(width-151, height/2-75/2, 151, 75);    //hard  width-151-5
  image(hardB, (width/2)+(151/2)+10, height/2-75/2);
  //fill(0);
  // rect(width/2-151/2, 2*height/3 + 75, 151, 75);     //back
  image(BackB, width/2-151/2, 2*height/3 + 75);


  if (mouseX>=((width/2)-(151/2)-10-151) && mouseX<=((width/2)-(151/2)-10-151)+151 && mouseY>= (height/2-75/2) && mouseY <= (height/2-75/2)+75) {
    rect((width/2)-(151/2)-10-151, height/2-75/2, 151, 75);
  } 
  if (mouseX>=(width/2-151/2) && mouseX<=(width/2-151/2)+151 && mouseY>= (height/2-75/2) && mouseY <= (height/2-75/2)+75) {
    rect(width/2-151/2, height/2-75/2, 151, 75);
  }
  if (mouseX>=((width/2)+(151/2)+10) && mouseX<=((width/2)+(151/2)+10)+151 && mouseY>= (height/2-75/2) && mouseY <= (height/2-75/2)+75) {
    rect((width/2)+(151/2)+10, height/2-75/2, 151, 75);
  }
  if (mouseX>=(width/2-151/2) && mouseX<=(width/2-151/2)+151 && mouseY>= (2*height/3 + 75) && mouseY <= (2*height/3 + 75)+75) {
    rect(width/2-151/2, 2*height/3 + 75, 151, 75);
  }
}

void checkSound() {
  if (playGame && !playAgain) {
    Welcome.pause();
    Welcome.rewind();
    Welcome.pause();
    //Game.play();
    if (!Game.isPlaying()) {
      Game.pause();
      Game.rewind();
      Game.play();
      //println("not playing");
    }
    if (g.EATING && !g.HURT && !g.hit) {
      if (!eating.isPlaying()) {
        eating.pause();
        eating.rewind();
        eating.play();
        //println("not playing");
      }
    }
    if (g.HURT && !g.EATING && !g.hit) {
      if (!ouch.isPlaying()) {
        ouch.pause();
        ouch.rewind();
        ouch.play();
        //println("not playing");
      }
    }
    if (g.hit && !g.HURT && !g.EATING) {
      if (!Throw.isPlaying()) {
        Throw.pause();
        Throw.rewind();
        Throw.play();
        //println("not playing");
      }
    }
    if (g.j) {    
      if (!jump.isPlaying()) {
        jump.pause();
        jump.rewind();  
        jump.play();
      }
    }
  } else if (playAgain && !playGame) {
    Game.pause();
    Game.rewind();
    Game.pause();
    //PlayAgain.play();       
    if (!PlayAgain.isPlaying()) {
      PlayAgain.pause();
      PlayAgain.rewind();
      PlayAgain.play();
      //println("not playing");
    }
  } else if (!playGame && !playAgain) {
    PlayAgain.pause();
    PlayAgain.rewind();
    PlayAgain.pause();
    //Welcome.play();
    if (!Welcome.isPlaying()) {
      Welcome.pause();
      Welcome.rewind();
      Welcome.play();
      //println("not playing");
    }
  }
}

