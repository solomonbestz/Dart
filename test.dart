import 'dart:io';

import 'hangman/hangman.dart';

void doSomething(Function callback) {
  print(callback.call());
}

bool check_equal_words(List hidden_word, List word) {
  for (int i = 0; i < hidden_word.length; i++) {
    if (hidden_word[i] == word[i]) {
      return true;
    }
  }
  return true;
}

void main() {
  List hidden = ["w", "e", "e", "k"];
  List word = ["w", "e", "e", "k"];
  var is_true = check_equal_words(hidden, word);
  // doSomething(() {
  //   return "Hello World";
  // });

  // const numbers = [1, 2, 3, 4, 5];

  // numbers.forEach((number) {
  //   print("The double of ${number} is ${number * 2}");
  // });
  if (is_true == true) {
    print("You win!!!!!");
  }
}
