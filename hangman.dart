import 'dart:io';
import 'dart:math';
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

T generate_random<T>(List<dynamic> my_list) {
  Random random = new Random();
  int rand = random.nextInt(my_list.length);
  return my_list[rand];
}

void display_word() {
  List<String> char = [];
  List<dynamic> level1 = level_one();
  String word = generate_random(level1);
  print(word);
  for (int i = 0; i < word.length; i++) {
    char.add(word);
    char[i] = "*";
  }
  print("Guess The Word: ${char}");
}

void game() {}

void main() {
  instructions();
  String player_name = player("Enter Player Name: ");
  String start_game = start(player_name);

  if (start_game == "yes") {
    display_word();
  } else {
    print("There is a bug somewhere");
  }
}
