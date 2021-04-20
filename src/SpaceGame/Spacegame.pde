//SpaceGame 2020 December
//by William Hackett
//music
//Battleship Eden by 魔界Symphony | https://soundcloud.com/makai-symphony
//Music promoted by https://www.free-stock-music.com
//Creative Commons Attribution-ShareAlike 3.0 Unported
//https://creativecommons.org/licenses/by-sa/3.0/deed.en_US

color c;
int x, y;
boolean isFinished;
Spaceship S1;
ArrayList<Blaster> blasters;
ArrayList<Rock> rocks;
ArrayList<Star> stars;
ArrayList<Enemyship> eship;
ArrayList<Powerup> powers;
ArrayList<EnemyLaser> elasers;
int score;
int level;
int pass;
boolean play;
PImage enemyship;
PImage exp;
PImage starphoto;
PImage bang;
PImage shipexp;
Timer rock;
Timer Eship;
Timer Powerups;
import processing.sound.*;
SoundFile laser;
SoundFile Explosion;
SoundFile Music;






void setup () {
  size(600, 600);
  exp = loadImage("AstroidExplosion.png");
  bang = loadImage("Enemyship (3) (1).png");
  shipexp = loadImage("shipexp.png");
  S1 = new Spaceship();
  blasters = new ArrayList();
  rocks = new ArrayList();
  stars = new ArrayList();
  eship = new ArrayList();
  elasers = new ArrayList();
  powers = new ArrayList();
  score = 0;
  pass = 0;
  level=1;
  play = false;
  laser = new SoundFile(this, "Probe-Gun.wav");
  Explosion = new SoundFile(this, "boom4.wav");
  Music = new SoundFile(this, "makai-symphony-battleship-eden.mp3");
  rock = new Timer(int(random(3900, 7500)));
  Eship = new Timer(int(random(2700, 4300)));
  Powerups = new Timer(int(random(10000, 20000)));
  rock.start();
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
      eship.add(new Enemyship(int(random(width)), int(random(20, height-350)), #CE2323, int(random(500, 1500))));
      Eship.start();
    }
    for (int i = 0; i < eship.size(); i++) {
      Enemyship eeship = eship.get(i);
      eeship.display();
      eeship.move();
      if (S1.shipIntersect(eeship)) {
        image(bang, eeship.x, eeship.y, 80, 80);
        Explosion.play();
        S1.health-=10;
        eship.remove(eeship);
      }
      if (eeship.isFinished()) {
        elasers.add(new EnemyLaser(eeship.x, eeship.y));
        eeship.start();
      }
    }

    //EnemyLaser logic
    for (int i = elasers.size()-1; i>=0; i--) {
      EnemyLaser elaser = (EnemyLaser) elasers.get(i);
      elaser.fire();
      elaser.display();

      if (S1.enemylaserIntersect(elaser)) {
        S1.health-=elaser.power;
        elasers.remove(elaser);
      }
      if (elaser.reachedBottom()) {
        elasers.remove(elaser);
      }
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
        image(exp, rock.x, rock.y, 80, 80);
        Explosion.play();
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
      if (S1.powerupIntersect(powerup) && S1.health < 100) {
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
            image(exp, rock.x, rock.y, 80, 80);
            Explosion.play();
            score+=5;
            rocks.remove(rock);
          }
        }
      }

      //Blaster vs enemyship intersection
      for (int l = 0; l < eship.size(); l++) {
        Enemyship eeship = eship.get(l);
        if (eeship.blasterIntersect(blast)) {
          eeship.health-=25;
          blasters.remove(blast);
          if (eeship.health<1) {
            image(bang, eeship.x, eeship.y, 80, 80);
            Explosion.play();
            score+=20;
            eship.remove(eeship);
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

    //Level logic
    if (frameCount % 1000 == 10) {
      level++;
      score+=100;
    }


    //Game Over Logic
    if (S1.health<1 && S1.lives<1) {
      image(shipexp, S1.x, S1.y, 90, 90);
      Explosion.play();
      Music.stop();
      play = false;
      gameOver();
    }
  }
}

void mousePressed() {
  laser.play();
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
  text("Level: " + level, 160, height-20);
  text("Score: " + score, 240, height-20);
}

//start screen 
void startScreen() {
  background(0);
  textAlign(CENTER);
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text("SPACE ADVENTURE!", width/2, height/2);
  textSize(20);
  text("Click to Continue", width/2, height/2+20);
  textSize(10);
  text("Develeped by William Hackett", width/2, height/2+200);
  enemyship = loadImage("Enemyship (3).png");
  image(enemyship, 47, height/2-56, 65, 65);
  image(enemyship, 488, height/2-56, 65, 65);
  starphoto = loadImage("pixel-art-star-vector-21403712 (2).png");
  image(starphoto, 190, 45, 200, 200);


  if (mousePressed) {
    Music.loop();
    play = true;
  }
}

//Game over screen
void gameOver() {
  background(0);
  imageMode(CENTER);
  image(shipexp, width/2, height/2, 450, 450);
  textAlign(CENTER);
  fill(#FF1717);
  textSize(50);
  text("GAME OVER", width/2, height/2);
  textSize(12);
  text("FINAL SCORE:" + score, width/2, height/2 + 20);
  text("You made it to Level: " + level, width/2, height/2+40);
  noLoop();
}
