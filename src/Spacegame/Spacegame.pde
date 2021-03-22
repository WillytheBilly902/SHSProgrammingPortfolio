//SpaceGame 2020 December
//by William Hackett
color c;

boolean isFinished;
Spaceship S1;
ArrayList<Blaster> blasters;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
ArrayList<Enemyship> eship;
ArrayList<Powerup> powers;
int score;
int pass;
boolean play;
Timer rock;
Timer Eship;
Timer Powerups;




void setup () {
  size(600, 600);
  S1 = new Spaceship();
  blasters = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  eship = new ArrayList();
  powers = new ArrayList();
  score = 0;
  pass = 0;
  play = false;
  rock = new Timer(2000);//int(random(5500, 9000)));
  Eship = new Timer(5000);
  Powerups = new Timer(int(random(10000, 20000)));
  rock.start();
  Eship.start();
  Powerups.start();
}

void draw () {
  //Gameplay
  if (!play) {
    startScreen();
  } else {
    noCursor();
    background(0);

    //Starfield simulation
    stars.add(new Star(int(random(width)), int(random(height)), color(random(190, 255))));
    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
    }
    //Enemyship logic
    if (Eship.isFinished()) {
      eship.add(new Enemyship(int(random(width)), int(random(20, height-350)), #CE2323));
      Eship.start();
    }

    for (int i = 0; i < eship.size(); i++) {
      Enemyship eeship = eship.get(i);
      eeship.display();
      eeship.move();
    }
    //Rocks Logic
    if (rock.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50, #EA9813));
      rock.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      //rock vs ship collision
      if (S1.rockIntersect(rock)) {
        S1.health-=rock.health;
        rocks.remove(rock);
        //score-=rock.health;
      }
      if (rock.reachedBottom()) {
        //pass++;
        rocks.remove(rock);
      }
    }

    //Powerup logic
    if (Powerups.isFinished()) {
      powers.add(new Powerup(int(random(width)), 50));
      Powerups.start();
    }

    for (int i = 0; i < powers.size(); i++) {
      Powerup powerup = powers.get(i);
      powerup.display();
      powerup.move();

      //powerup and ship collision
        if (S1.powerupIntersect(powerup)) {
          S1.health+=15;
          powers.remove(powerup);
        }

        if (powerup.reachedBottom()) {
          powers.remove(powerup);
        }
      }

      //Blaster logic
      for (int i = 0; i < blasters.size(); i++) {
        Blaster blast = blasters.get(i);
        blast.display();
        blast.fire();
        //Blaster vs rock intersection
        for (int j = 0; j < rocks.size(); j++) {
          Rock rock = rocks.get(j);
          if (rock.blasterIntersect(blast)) {
            rock.health-=10;
            blasters.remove(blast);
            if (rock.health<1) {
              rocks.remove(rock);
              score+=5;
            }
          }
        }
        
        //Blaster vs enemyship intersection
        for (int l = 0; l < eship.size(); l++) {
          Enemyship eeship = eship.get(l);
          if (eeship.blasterIntersect(blast)) {
            eeship.health-=10;
            blasters.remove(blast);
            if (eeship.health<1) {
              eship.remove(eship);
              score+=20;
            }
          }
        }

        if (blast.reachedTop()) {
          blasters.remove(blast);
        }
      }
      infoPanel();
      S1.display(mouseX, mouseY);

      //lives
      if (S1.health<1) {
        S1.lives -= 1;
        if (S1.lives<1) {
          S1.health = 0;
        } else {
          S1.health = 100;
        }
      } 

      //Game Over Logic
      if (S1.health<1 && S1.lives<1) {
        play = false;
        gameOver();
      }
    }
  }

  void mousePressed() {
    blasters.add(new Blaster(S1.x, S1.y, color(62, 245, 12)));
    //blasters.add(new Blaster(S1.x-5, S1.y, color(62, 245, 12)));
  }


  void infoPanel() {
    fill(128, 128);
    rectMode(CORNER);
    rect(0, height-50, width, 50);
    fill(128, 255);
    textAlign(BASELINE);
    textSize(13);
    text("Health: " + S1.health, 20, height-20);
    text("Lives: " + S1.lives, 100, height-20);
    text("Level: " + 0, 160, height-20);
    text("Score: " + score, 240, height-20);
  }

  //start screen 
  void startScreen() {
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(50);
    text("SPACE ADVENTURE!", width/2, height/2);
    textSize(20);
    text("Click to Continue", width/2, height/2+20);
    textSize(10);
    text("Develeped by William Hackett", width/2, height/2+200);

    if (mousePressed) {
      play = true;
    }
  }

  //Game over screen
  void gameOver() {
    background(0);
    textAlign(CENTER);
    fill(#FF1717);
    textSize(50);
    text("GAME OVER", width/2, height/2);
    textSize(12);
    text("FINAL SCORE:" + score, width/2, height/2 + 20);
    noLoop();
  }
