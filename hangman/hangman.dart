import 'dart:io';
import 'dart:math';
import '../main.dart';
import 'levels.dart';

String prompt(String message) {
  print(message);
  String? answer = stdin.readLineSync();
  return answer!;
}

void instructions() {
  print("""
    HANGMAN GAME INSTRUCTIONS
    **Player is too guess all characters correctly to move to the next round.
    **Player has 6guesses and hints would be given.
    **Player that gets hanged has to wait for a particular time frame to play again.
    **Player can buy time to play again as soon as the time elapse.
  """);
}

String player(String message) {
  print(message);
  String player_name = stdin.readLineSync()!;
  return player_name;
}

String start(String player) {
  String start = prompt("Start Game ${player} 'YES/NO': ");
  return start.toLowerCase();
}

T generate_random<T>(List my_list) {
  Random random = new Random();
  int rand = random.nextInt(my_list.length);
  return my_list[rand];
}

List display_word() {
  List words = [];
  List level1 = level_one();
  String word = generate_random(level1);

  for (int i = 0; i < word.length; i++) {
    words.add(word);
    words[i] = word[i];
  }
  return words;
}

void end_game(int number_of_guesses_limit) {
  List hints = ["First", "Second", "Third"];
  if (number_of_guesses_limit < 0) {
    print("Game Over!!, You have been hanged");
    exit(0);
  }
  if (number_of_guesses_limit == 5) {
    print("${hints[0]} hint: ${level_one_hints()[0]}");
  }
  if (number_of_guesses_limit == 3) {
    print("${hints[1]} hint: ${level_one_hints()[1]}");
  }
  if (number_of_guesses_limit == 2) {
    print("${hints[2]} hint: ${level_one_hints()[2]}");
  }
}

void game() {
  int number_of_guesses = 6;
  List char = [];
  List word = display_word();
  for (int i = 0; i < word.length; i++) {
    char.add(word);
    char[i] = "*";
  }
  print(word);
  while (true) {
    print("""
         Guess The Hidden Word: ${char}
    """);
    String guess_character = prompt("""
         Enter The Missing Character: 
    """);
    if (word.contains(guess_character)) {
      ;
      for (int i = 0; i < word.length; i++) {
        if (word[i] == guess_character) {
          char[i] = guess_character;
        }
      }
    } else {
      print("");
      print("You have $number_of_guesses guess(s) left.");
      number_of_guesses = number_of_guesses - 1;
      end_game(number_of_guesses);
    }
    print("");
    print("""
         Correct Character:             ${char}
    """);
  }
}

void main() {
  instructions();
  String player_name = player("""
     Enter Player Name: 
     """);
  String start_game = start(player_name);

  if (start_game == "yes") {
    game();
  } else {
    print("There is a bug somewhere");
  }
}
