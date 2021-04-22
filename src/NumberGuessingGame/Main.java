import java.util.Scanner;
import java.util.Random;

class Main {
  public static void main(String[] args) {

    Random random = new Random();
    int randNum = random.nextInt(100);
    int guess = 0;
    int attempts = 0;
    Scanner sc = new Scanner(System.in);

    System.out.println("Welcome to the Guessing Game! Pick a number between 1 and 100!");
    guess = sc.nextInt();
    while(guess != randNum){
    if(randNum>guess) {
      System.out.println("Too low, guess again!");
      guess = sc.nextInt();
    } else if(guess > randNum) {
      System.out.println("Too high, guess again!");
      guess = sc.nextInt();
    }
    attempts ++;
    }
    System.out.println("You Win! You guessed it in: "+ attempts + " attempts!");

  }
}