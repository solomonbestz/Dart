import 'dart:io';
import 'dart:math';
import 'game_manager.dart';

// Gobal Level Increment
int increase_level = 0;

// Global count variable
int count_level = 1;

String prompt(String message) {
  print(message);
  String? answer = stdin.readLineSync();
  return answer!;
}

// FUNCTION TO INSTRUCT THE PLAYER
void instructions() {
  print("""
    HANGMAN GAME INSTRUCTIONS 😍😍😍😍
    🔥 Player is too guess all characters correctly to move to the next round.
    🔥 Player has 6 guesses, 3 hints would be given.
    🔥 Player that gets hanged has to wait for a particular time frame to play again.
    🔥 Player can buy time to play again as soon as the time elapse.
  """);
}

// FUNCTION TO COLLECT PLAYER NAME
String player(String message) {
  print(message);
  String player_name = stdin.readLineSync()!;
  if (player_name == int) {
    print("");
    print("Player name should contain alphabets alone.");
    main();
  }
  return player_name;
}

// FUNCTION TO ASK A USER TO START
String start(String player) {
  String start = prompt("Start Game ${player} 😃 'YES/NO': ");
  if (start != String) {
    print(" Wrong Input \n Quitting Program 😒");
  }
  return start.toLowerCase();
}

// FUNCTION TO GENERATE RANDOM
T generate_random<T>(List my_list) {
  Random random = new Random();
  int rand = random.nextInt(my_list.length);
  return my_list[rand];
}

// FUNCTION TO CHECK IF HIDDEN WORD IS EQUAL TO USER GUESS
bool check_equal_words(List hidden_word, List word) {
  for (int i = 0; i < hidden_word.length; i++) {
    if (hidden_word[i] != word[i]) {
      return false;
    }
  }
  return true;
}

// FUNCTION TO CHECK FOR WIN
void check_for_win(List hidden_word, List word) {
  var player_win = check_equal_words(hidden_word, word);
  if (player_win == true) {
    print("You Won This Level 🔥😃😃");
    increase_level++;
    count_level++;
    print("""
        Level ${count_level} 😍😍😍
    """);
    print("");
    game_play();
  }
}

// FUNCTION TO DISPLAY THE WORD IN LIST
List display_word() {
  String word = level_control();
  List words = [];
  for (int i = 0; i < word.length; i++) {
    words.add(word);
    words[i] = word[i];
  }
  return words;
}

// FUNCTION TO CONTROL THE GAMELEVEL
String level_control() {
  Map level = game_manager_levels();
  String level_control = game_control();
  String next_level = generate_random(level[level_control]);
  return next_level;
}

// FUNCTION TO CONTROL THE GAME
String game_control() {
  List change_level = game_manager_level_update();
  String level = change_level[increase_level];
  return level;
}

// FUNCTION TO END THE GAME
void end_game(int number_of_guesses_limit) {
  List hints_counter = ["First", "Second", "Third"];
  List change_hint = game_manager_hint_update();
  Map game_hints = game_manager_hints();
  if (number_of_guesses_limit < 0) {
    print("Game Over!!, You have been hanged");
    exit(0);
  }
  if (number_of_guesses_limit == 5) {
    print(
        "${hints_counter[0]} hint: ${game_hints[change_hint[increase_level]][0]}");
  }
  if (number_of_guesses_limit == 3) {
    print(
        "${hints_counter[1]} hint: ${game_hints[change_hint[increase_level]][1]}");
  }
  if (number_of_guesses_limit == 2) {
    print(
        "${hints_counter[2]} hint: ${game_hints[change_hint[increase_level]][2]}");
  }
}

// The MAIN GAME FUNCTION
void game_play() {
  int number_of_guesses = 6;
  List hidden_word = [];
  List? word = display_word();
  for (int i = 0; i < word.length; i++) {
    hidden_word.add(word);
    hidden_word[i] = "*";
  }
  print(word);
  print(hidden_word);
  while (true) {
    check_for_win(hidden_word, word);
    print("""
         Guess The Hidden Word: ${hidden_word} 🤔🤔🤔
    """);
    String guess_character = prompt("""
         Enter The Missing Character: 
    """);
    if (word.contains(guess_character)) {
      ;
      for (int i = 0; i < word.length; i++) {
        if (word[i] == guess_character) {
          hidden_word[i] = guess_character;
        }
      }
    } else {
      print("");
      print("You have $number_of_guesses fail guess(s) left.");
      number_of_guesses = number_of_guesses - 1;
      end_game(number_of_guesses);
    }
    print("");
    print("""
         Correct Character:             ${hidden_word}
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
    print("""
        Level ${count_level} 😍😍😍
    """);
    game_play();
  } else {
    print("GoodBye 😊😊");
  }
}
