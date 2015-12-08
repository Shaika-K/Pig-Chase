class Game {

  PImage strawPig;
  PImage stickPig;
  PImage brickPig;

  pigs p1;
  pigs p2;
  pigs p3;

  wolf w;

  String[] strPig = new String[13];
  String[] stkPig = new String[13];
  String[] brkPig = new String[13];

  //pig position--------
  final int NUM1 = 20;
  final int NUM2 = 30;
  final int NUM3 = 40;
  final PVector[] trail1 = new PVector[NUM1];
  final PVector[] trail2 = new PVector[NUM2];
  final PVector[] trail3 = new PVector[NUM3];
  //--------------------

  float pos;
  PImage back;
  float x = 1;
  float speed = 2;
  float sec;
  float SEC;  //wolf changes
  float SEC2;  //wolf changes
  float wolfX;  //wolf changes
  float lives;
  float newPoints;
  String holding;
  items itemHolding;
  items itemThrown;
  float itemX;
  float itemY;
  float current;

  //jumping variables
  int points;
  float jump;
  boolean j;
  float time;
  float Msec;
  float SPEED;
  float ITspeed;

  //running states
  boolean change;
  boolean straw;
  boolean stick;
  boolean brick;
  boolean hit;
  boolean STRAW;  //wolf changes
  boolean STICK;  //wolf changes
  boolean HURT;  //wolf changes
  boolean EATING;  //wolf changes

  //floating items
  ArrayList <items> it = new ArrayList <items> ();
  ArrayList <items> toBeDrawn = new ArrayList <items> ();

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  Game () {
    //adding image names
    strPig[0] = "1";
    strPig[1] = "2";
    strPig[2] = "4";
    strPig[3] = "3";
    strPig[4] = "1+STRAW";
    strPig[5] = "2+STRAW";
    strPig[6] = "4+STRAW";
    strPig[7] = "1+STICK";
    strPig[8] = "2+STICK";
    strPig[9] = "4+STICK";
    strPig[10] = "1+BRICK";
    strPig[11] = "2+BRICK";
    strPig[12] = "4+BRICK";

    stkPig[0] = "1";
    stkPig[1] = "2";
    stkPig[2] = "4";
    stkPig[3] = "3";
    stkPig[4] = "1+STRAW";
    stkPig[5] = "2+STRAW";
    stkPig[6] = "4+STRAW";
    stkPig[7] = "1+STICK";
    stkPig[8] = "2+STICK";
    stkPig[9] = "4+STICK";
    stkPig[10] = "1+BRICK";
    stkPig[11] = "2+BRICK";
    stkPig[12] = "4+BRICK";

    brkPig[0] = "1";
    brkPig[1] = "2";
    brkPig[2] = "4";
    brkPig[3] = "3";
    brkPig[4] = "1+STRAW";
    brkPig[5] = "2+STRAW";
    brkPig[6] = "4+STRAW";
    brkPig[7] = "1+STICK";
    brkPig[8] = "2+STICK";
    brkPig[9] = "4+STICK";
    brkPig[10] = "1+BRICK";
    brkPig[11] = "2+BRICK";
    brkPig[12] = "4+BRICK";

    strawPig= loadImage("Straw Pig/stPig1.png");
    stickPig= loadImage("stick pig/stkPig1.png");
    brickPig= loadImage("brick pig/brkPig1.png");
  }


  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void initialise(float t, float s, float str, float stk, float brk, float its) {   
    p1 = new pigs(strawPig);
    p2 = new pigs(stickPig);
    p3 = new pigs(brickPig);
    pos = 100;   
    back = loadImage("back.jpg");
    sec = second();
    SEC = second();
    SEC2 = second();
    points = 0;
    w = new wolf();
    wolfX = 0;
    lives = 3;
    newPoints = 0;
    itemX = 280;
    itemY = 0;
    hit = false;
    time = t*1000;
    Msec = millis();
    ITspeed = its;

    for (int i = 0; i<str; i++) {       //<--CHANGE according to TO LEVEL!                          
      itemA A = new itemA(Msec/1000, (millis()+time)/1000);
      it.add(i, A);
    }

    for (int i = 0; i<stk; i++) {        //<--CHANGE according to TO LEVEL!   
      itemB B = new itemB(Msec/1000, (millis()+time)/1000);
      it.add(i, B);
    }

    for (int i = 0; i<brk; i++) {        //<--CHANGE according to TO LEVEL!      
      itemC C = new itemC(Msec/1000, (millis()+time)/1000);
      it.add(i, C);
    }

    itemHolding = null;
    itemThrown = null;
    float current = 0;
    SPEED = s;
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void play() {  
    float passed = millis() - Msec;
    if (passed > time || lives == 0) {
      playGame = !playGame;
      playAgain = !playAgain;
    } else {
      //println(second());  
      background(0);
      noStroke();

      //background
      x+=speed;
      x%=width;
      imageMode(CORNER);
      image(back, int(x), 0);
      image(back.get(back.width-int(x), 0, int(x), back.height), 0, 0);

      //JUMPING LIMITS
      if (!j) {
        if (p1.ypos<500) {
          jump -= 3;
        }
      }
      if (j) {
        if (p1.ypos>300) {
          jump = jump + 10;
        }
      }

      //pig and wolf image changes
      if (sec+1 >= 60) {
        sec = second();
      }
      if (sec+1 == second()) {
        change = !change;
        sec = second();
      }

      if (lives == 2) {
        p1 = new pigs(stickPig);
        //println("turned to stick pig");
        p2 = new pigs(brickPig);
        p3 = null;
        if (!HURT && !EATING) {
          STRAW = true;
        }
      } else if (lives == 1) {
        p1 = new pigs(brickPig);
        p2 = null;
        p3 = null;
        if (!HURT && !EATING) {
          STRAW = false;
          STICK = true;
        }
      } else {
        p1 = p1;
        p2 = p2;
        p3 = p3;
      } 

      /*if (!hit) {
       g.itemY = p1.ypos;
       } */


      //wolf speed changes
      if (SEC+2 >= 60) {
        SEC = second();
      }
      if (SEC+2 == second()) {
        if (((w.xpos - (w.w/4)) - wolfX) < (280 + (p1.w/2)) && !EATING && !HURT) {
          EATING = true;
          hit = false;
          lives --;
          //println("EATING");       
          // wolfX = (w.xpos - (w.w/4))-(280 + (p1.w/2));
        } else if (EATING) {
          // println("in eating");
          if ((w.xpos - wolfX) > w.xpos) {      
            wolfX = 0;         
            EATING = false;
          } else {
            wolfX = wolfX - 90;
          }
        } else if (HURT && !EATING) {
          if ((w.xpos - wolfX) >= current) {
            HURT = false;
          } else {
            if (itemThrown.getType().equals("stick")) {
              wolfX = wolfX - 47;
            } else if (itemThrown.getType().equals("brick")) {
              wolfX = wolfX - 70;
            } else {
              wolfX = wolfX - 35;
            } 
            //wolfX = wolfX - 35;
          }
        } else {      
          wolfX = wolfX + SPEED;
          // println("in else");
        }
        //println("x= : "+ wolfX);
        SEC = second();
      }

      //WOLF
      if (HURT) {
        w.hurt();
        w.drawWolf(wolfX);
      } else if (change) {
        if (STRAW && !EATING) {
          w.straw2();
          w.drawWolf(wolfX);
        } else if (STICK && !EATING) {
          w.stick2();
          w.drawWolf(wolfX);
        } else if (EATING) {
          w.Cloud2();
          w.drawWolf(wolfX);
        } else if (!STRAW && !STICK) {
          w.wolf2();
          w.drawWolf(wolfX);
          // println("here");
        }
      } else {
        if (STRAW && !EATING) {
          w.straw1();
          w.drawWolf(wolfX);
        } else if (STICK && !EATING) {
          w.stick1();
          w.drawWolf(wolfX);
        } else if (EATING) {
          w.Cloud1();
          w.drawWolf(wolfX);
        } else if (!STRAW && !STICK) {
          w.wolf1();
          w.drawWolf(wolfX);
          //println("NOT here");
        }
      }

      //pigs

      trail1[NUM1 - 1] = new PVector(180+100, 400-jump); 
      for (int i = 0; i < NUM1 - 1; i++)
      {
        trail1[i] = trail1[i + 1];
      }

      if (trail1[0] != null)
      {
        if (p1 != null) {
          if (lives == 2) {
            if (j) {///image change at jump
              if (straw) { 
                p1.setSTICKImage(stkPig[6]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (stick) {
                p1.setSTICKImage(stkPig[9]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (brick) {
                p1.setSTICKImage(stkPig[12]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (hit) {
                p1.setSTICKImage(stkPig[3]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else {
                p1.setSTICKImage(stkPig[2]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              }
            } else if (change) { 
              if (straw) { 
                p1.setSTICKImage(stkPig[5]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (stick) {
                p1.setSTICKImage(stkPig[8]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (brick) {
                p1.setSTICKImage(stkPig[11]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (hit) {
                p1.setSTICKImage(stkPig[3]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else {    
                p1.setSTICKImage(stkPig[1]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              }
            } else if (hit) {
              p1.setSTICKImage(stkPig[3]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (straw) {
              p1.setSTICKImage(stkPig[4]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (stick) {
              p1.setSTICKImage(stkPig[7]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (brick) {
              p1.setSTICKImage(stkPig[10]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else {
              p1.setSTICKImage(stkPig[0]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            }
          } else if (lives == 1) {
            if (j) {///image change at jump
              if (straw) { 
                p1.setBRICKImage(brkPig[6]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (stick) {
                p1.setBRICKImage(brkPig[9]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (brick) {
                p1.setBRICKImage(brkPig[12]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (hit) {
                p1.setBRICKImage(brkPig[3]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else {
                p1.setBRICKImage(brkPig[2]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              }
            } else if (change) { 
              if (straw) { 
                p1.setBRICKImage(brkPig[5]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (stick) {
                p1.setBRICKImage(brkPig[8]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (brick) {
                p1.setBRICKImage(brkPig[11]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (hit) {
                p1.setBRICKImage(brkPig[3]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else {    
                p1.setBRICKImage(brkPig[1]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              }
            } else if (straw) {
              p1.setBRICKImage(brkPig[4]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (stick) {
              p1.setBRICKImage(brkPig[7]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (brick) {
              p1.setBRICKImage(brkPig[10]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (hit) {
              p1.setBRICKImage(brkPig[3]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else {
              p1.setBRICKImage(brkPig[0]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            }
          } else {
            if (j) {///image change at jump
              if (straw) { 
                p1.setSTRAWImage(strPig[6]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (stick) {
                p1.setSTRAWImage(strPig[9]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (brick) {
                p1.setSTRAWImage(strPig[12]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (hit) {
                p1.setSTRAWImage(strPig[3]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else {
                p1.setSTRAWImage(strPig[2]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              }
            } else if (change) { 
              if (straw) { 
                p1.setSTRAWImage(strPig[5]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (stick) {
                p1.setSTRAWImage(strPig[8]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (brick) {
                p1.setSTRAWImage(strPig[11]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else if (hit) {
                p1.setSTRAWImage(strPig[3]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              } else {    
                p1.setSTRAWImage(strPig[1]);
                p1.drawpigs(trail1[0].x, trail1[0].y);
              }
            } else if (straw) {
              p1.setSTRAWImage(strPig[4]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (stick) {
              p1.setSTRAWImage(strPig[7]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (brick) {
              p1.setSTRAWImage(strPig[10]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else if (hit) {
              p1.setSTRAWImage(strPig[3]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            } else {
              p1.setSTRAWImage(strPig[0]);
              p1.drawpigs(trail1[0].x, trail1[0].y);
            }
          }
        }
      }

      if (hit) {
        // println("hit is true");
        itemThrown.Hit(itemX, itemY);
        //println(w.getWolfX());
        //stroke(0);
        //rect(w.getWolfX() - (w.w/4), (w.ypos-(w.h/4)), w.w/2, w.h/2);
        if (itemX != width+itemThrown.getWidth()) {//(w.xpos + (w.w/3))    itemX < width+itemThrown.getWidth()
          itemX++;
        } else {
          hit = false;
          println("in");
        }
        if (itemY != height+itemThrown.getHeight()) {//(w.ypos+(w.h/3))    itemY < height+itemThrown.getHeight()
          itemY++;
        } else {    // (itemX > width+itemThrown.getWidth() || itemY > height+itemThrown.getHeight())
          hit = false;
          println("in");
        }
        if (itemX >= (w.getWolfX() - (w.w/4)) && itemX <= (w.getWolfX() - (w.w/4)+w.w/3) && itemY >= (w.ypos-(w.h/4)) && itemY <= (w.ypos-(w.h/4)+ w.w/3)) {
          points = points + itemThrown.getPoints();
          HURT = true;
          hit = false;      
          itemX = 280;
          current = w.getWolfX() + 60;
          itemY = p1.xpos;
        }
      }

      ////// other pigs//////////

      trail2[NUM2 - 1] = new PVector(180+100, 400-jump); 
      for (int i = 0; i < NUM2 - 1; i++)
      {
        trail2[i] = trail2[i + 1];
      }

      if (trail2[0] != null)
      {
        if (p2 != null) {
          if (lives == 2) {
            if (j) {
              p2.setBRICKImage(brkPig[2]);
              p2.drawpigs(trail2[0].x-40, trail2[0].y+45);
            } else if (change) {
              p2.setBRICKImage(brkPig[1]);
              p2.drawpigs(trail2[0].x-40, trail2[0].y+45);
            } else {
              p2.setBRICKImage(brkPig[0]);
              p2.drawpigs(trail2[0].x-40, trail2[0].y+45);
            }
          } else {
            if (j) {
              p2.setSTICKImage(stkPig[2]);
              p2.drawpigs(trail2[0].x-40, trail2[0].y+45);
            } else if (change) {
              p2.setSTICKImage(stkPig[1]);
              p2.drawpigs(trail2[0].x-40, trail2[0].y+45);
            } else {
              p2.setSTICKImage(stkPig[0]);
              p2.drawpigs(trail2[0].x-40, trail2[0].y+45);
            }
            //p2.drawpigs(155, trail2[0].x-40, trail2[0].y+30);
          }
        }
      }



      //////////

      trail3[NUM3 - 1] = new PVector(180+100, 400-jump); 
      for (int i = 0; i < NUM3 - 1; i++)
      {
        trail3[i] = trail3[i + 1];
      }

      if (trail3[0] != null)
      {
        if (p3 != null) {
          if (j) {
            p3.setBRICKImage(brkPig[2]);
            p3.drawpigs(trail3[0].x-80, trail3[0].y+90);
          } else if (change) {
            p3.setBRICKImage(brkPig[1]);
            p3.drawpigs(trail3[0].x-80, trail3[0].y+90);
          } else {
            p3.setBRICKImage(brkPig[0]);
            p3.drawpigs(trail3[0].x-80, trail3[0].y+90);
          }
          //p3.drawpigs(55, trail3[0].x-70, trail3[0].y+50);
        }
      }

      items i1 = null;
      for (int i = 0; i<it.size (); i++) {

        if (it.get(i) != null) {
          i1 = it.get(i);      
          if (i1.time() == second()) {
            //println("will appear at: " + i1.time());
            toBeDrawn.add(i1);
            it.remove(i);
          }
        }
      }
      checkItems();
      checkCollision();

      //points display
      if (points > newPoints) {
        fill(234, 0, 0);
      } else {
        fill(0, 209, 46);
      }  
      textSize(50);
      textAlign(RIGHT, TOP);
      text(points, width, 10);
      newPoints = points;

      //noStroke();
      //fill(#FAD103);
      //rect(width-151, height-75, 151, 75);    //quit
      imageMode(CORNER);
      image(QuitB, width-151, height-75);

      noFill();
      strokeWeight(3);
      stroke(#FFD900); 
      if (mouseX>=(width-151) && mouseX<=(width-151)+151 && mouseY>= (height-75) && mouseY <= (height-75)+75) {
        rect(width-151, height-75, 151, 75);
      } 
      // println(millis());
      // println("passed: " + passed);
    }

    //*END OF DRAW
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /*void mouseReleased() {
   j = false;
   }*/

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  /*void mousePressed() {
   if (mouseButton == LEFT) {
   j = true;
   }
   }*/

  /* void mouseClicked() {
   if (mouseButton == RIGHT) {
   if (itemHolding != null) {
   hit = true;      
   straw = false;
   stick = false;
   brick = false;
   itemThrown = itemHolding;
   itemHolding = null;
   }
   }
   }*/

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void checkItems() {
    items i2 = null;
    PVector p = new PVector ();
    for (int i = 0; i<toBeDrawn.size (); i++) {  
      if (  toBeDrawn.get(i) != null) {
        i2 = toBeDrawn.get(i);
        //println("getting item");    
        p = i2.getPos();
        i2.display((float)(p.x)+ITspeed);
      }
    }
  }

  /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  void checkCollision() {
    float left = p1.xpos-((p1.w)/4);
    float right = p1.xpos+((p1.w)/4);
    float top = p1.ypos-((p1.h)/4);
    float bot = p1.ypos+((p1.h)/10);
    PVector p3 = new PVector ();
    items i3 = null;
    float Iw = 0;
    float Ih = 0;
    float pigLeft=0;
    float pigRight=0;
    float pigTop=0;
    float pigBot=0;
    float itLeft=0;
    float itRight=0;
    float itTop=0;
    float itBot=0;
    for (int i = 0; i<toBeDrawn.size (); i++) {    
      if (  toBeDrawn.get(i) != null) {
        i3 = toBeDrawn.get(i);
        p3 = i3.getPos();
        Iw = i3.getWidth()/3;
        Ih = i3.getHeight()/2;      
        pigLeft=left;
        pigRight=right;
        pigTop=top-((p1.h)/3);
        pigBot=bot;
        itLeft=p3.x-Iw-(Iw/3);
        itRight= itLeft + (i3.getWidth() - i3.getWidth()/3);
        itTop=p3.y-(Ih/2);
        itBot=itTop + (i3.getHeight()-i3.getHeight()/3);
        /*stroke(0);
         rect(itLeft, itTop, Iw, Ih);
         rect(pigLeft, pigTop, pigRight-pigLeft, pigBot-pigTop);*/
        //println(pigLeft+((pigRight-pigLeft)/2));
        //stroke(0);
        //rect(w.xpos - (w.w/4), (w.ypos-(w.h/4)), 50, 50);
        if (pigLeft<= itRight && pigRight >= itLeft && pigTop <= itBot && pigBot >= itTop) {          
          if (!hit) {
            points = points + 5;
            itemHolding = null;
            itemHolding = i3;
            toBeDrawn.set(i, null);
            //println("removed");
            changeItemState(i3.getType());
          }
        }
      }
    }
  }

  void changeItemState(String itm) {
    if (!hit) {
      if (itm.equals("straw")) {
        straw = true;
        stick = false;
        brick = false;
      }
      if (itm.equals("stick")) {
        straw = false;
        stick = true;
        brick = false;
      }
      if (itm.equals("brick")) {
        straw = false;
        stick = false;
        brick = true;
      }
      holding = itm;
    }
  }
}

