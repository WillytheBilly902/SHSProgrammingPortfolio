class Spaceship {

  //Member Variables
  int x, y, health, lives, rad;
  color c;
  float easing;

  //Constructor
  Spaceship() {
    x = 0;
    y = 0;
    health = 100;
    lives = 3;
    rad=25;
  }
  
  
  
  //Member Methods

  void display(int x, int y) {
    this.x = x;
    this.y = y;
    stroke(0);
    strokeWeight(1);
    fill(#6409AF);
    quad(x-5, y, x+4, y-35, x+38, y+25, x+30, y+50);
    quad(x+5, y, x-4, y-35, x-38, y+25, x-30, y+50);
    stroke(0);
    fill(95, 87, 87);
    rectMode(CORNER);
    rect(x-2.5, y+13, 5, 12);
    noStroke();
    fill(160, 24, 29);
    triangle(x, y-20, x+45, y+15, x-45, y+15);
    stroke(62, 245, 12);
    line(x+4, y-32, x+4, y-42);
    line(x-4, y-32, x-4, y-42);
    strokeWeight(2);
    fill(3, 204, 252);
    ellipse(x, y-8, 6, 10);
  }
  //method will detect rock vs ship
  boolean rockIntersect(Rock rock) {
    float distance = dist (x, y, rock.x, rock.y);
    if(distance < rad + rock.rad) {
      return true;
    } else {
      return false;
    }
  }
  
   //method will detect powerup vs ship
  boolean powerupIntersect(Powerup powerup) {
    float distance = dist (x, y, powerup.x, powerup.y);
    if(distance < rad + powerup.rad) {
      return true;
    } else {
      return false;
    }
  }

  //method will detect ship vs enemyship
  boolean shipIntersect(Enemyship eeship) {
    float distance = dist(x, y, eeship.x, eeship.y);
    if(distance < rad + eeship.rad) {
      return true;
    } else {
      return false;
    }
  }
  
  //method will detect ship vs enemylaser
  boolean enemylaserIntersect(EnemyLaser elaser) {
    float distance = dist(x, y, elaser.x, elaser.y);
    if(distance<rad +elaser.rad) {
      return true;
    } else {
      return false;
    }
  }
  
}
